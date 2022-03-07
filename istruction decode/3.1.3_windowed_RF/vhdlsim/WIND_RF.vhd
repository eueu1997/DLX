library IEEE;
use IEEE.std_logic_1164.all;
use ieee.math_real.all;
use ieee.numeric_std.all;

entity WINDOWED_RF is
  generic(NBIT: integer;
          M : integer; -- Num global regs
          N : integer; -- Regs in each IN, OUT, LOCAL
          F : integer); -- Num of windows
  port(-- Input control bit
       CLK: in std_logic;
       RST: in std_logic;
       EN:  in std_logic;
       RD1: in std_logic;
       RD2: in std_logic;
       WR: in std_logic;
------ Input address
       ADD_WR: in std_logic_vector(integer(log2(real(3*N+M)))-1 downto 0);
       ADD_RD1: in std_logic_vector(integer(log2(real(3*N+M)))-1 downto 0);
       ADD_RD2: in std_logic_vector(integer(log2(real(3*N+M)))-1 downto 0);
------ Data in/out
       DATAIN: in std_logic_vector(NBIT-1 downto 0);
       OUT1: out std_logic_vector(NBIT-1 downto 0);
       OUT2: out std_logic_vector(NBIT-1 downto 0);
------ Subroutine control signals
       CALL: in std_logic; 
       RET: in std_logic;
------ MMU control signals
       FILL: out std_logic;
       SPILL: out std_logic;
------ BUS to/from used when spilling/filling registers
       BUSIN:   in std_logic_vector(NBIT-1 downto 0);
       BUSOUT:  out std_logic_vector(NBIT-1 downto 0));
end entity;

architecture behavioral of WINDOWED_RF is
--USEFUL DECLARATIONS------------------------------------------------------------------
--Dimension costants
constant NREG: integer := M+2*N*F;
constant dim_ph_add: integer := integer(ceil(log2(real(NREG))));
constant dim_vir_add: integer := integer(log2(real(3*N+M)));

--Physical register
subtype PHYSICAL_VECT is std_logic_vector(dim_ph_add-1 downto 0);
type REGS_ARRAY is array(NREG-1 downto 0) of std_logic_vector(NBIT-1 downto 0);
signal REGS: REGS_ARRAY;
   
--Address constants
constant GLOBAL_REGS: PHYSICAL_VECT := std_logic_vector(to_unsigned(NREG-M, PHYSICAL_VECT'length)); -- address of global regs
constant WIN_0: PHYSICAL_VECT := std_logic_vector(to_unsigned(0, PHYSICAL_VECT'length)); -- address of first window
constant WIN_F: PHYSICAL_VECT := std_logic_vector(to_unsigned(2*N*(F-1), PHYSICAL_VECT'length)); -- address of the last window

--Signal pointer regs
--CWP -> Current Window Pointer
--SWP -> Saved Window Pointer
signal CWP, SWP: PHYSICAL_VECT := (others =>'0');

--Signal flags
signal CANSAVE, CANRESTORE, INT_SPILL, INT_FILL: std_logic;
signal COUNT: natural range 0 to 2*N-1; --2*N = N_regs of IN and LOC

----------------------------------------------------------------------------------------

--FUNCTIONS---------------------------------------------------------------------------------------

--TO_PHYSICAL_ADD--
--args: VIR_ADD, virtual address to convert
--      CWP, current windows pointer
--ret: physical address
function to_physical_add(VIR_ADD: std_logic_vector(dim_vir_add-1 downto 0); CWP: PHYSICAL_VECT) return PHYSICAL_VECT is
  variable GL_OFFSET: natural range 0 to M-1; --To store global reg offset
  begin
    if(to_integer(unsigned(VIR_ADD)) < 3*N) then --True if VIR_ADD correspond to IN, LOC or OUT regs
      return std_logic_vector(unsigned(VIR_ADD) + unsigned(CWP));
    else
      GL_OFFSET := to_integer(unsigned(VIR_ADD)) - 3*N;
      return std_logic_vector(unsigned(GLOBAL_REGS) + GL_OFFSET);
    end if;
end function to_physical_add;

--NEXT_WIN--
--args: WP - Window Pointer
--ret: next window pointer
function next_win(WP: PHYSICAL_VECT) return PHYSICAL_VECT is
  begin
    if(WP = WIN_F) then --if WP point in the last window -> return to first
      return WIN_0;
    else -- else add offset (2*N) to WP -> next window
      return std_logic_vector(unsigned(WP) + to_unsigned(2*N, PHYSICAL_VECT'length));
    end if;
end function next_win;    

--PREV_WIN--
--args: WP
--ret: previous window pointer
function prev_win(WP: PHYSICAL_VECT) return PHYSICAL_VECT is
  begin
    if(WP = WIN_0) then
      return WIN_F;
    else
      return std_logic_vector(unsigned(WP) - to_unsigned(2*N, PHYSICAL_VECT'length));
    end if;
end function prev_win;

--------------------------------------------------------------------------------------------------

begin

  W_RF_P: process(CLK)
    begin
--_CLOCK      
      if(rising_edge(CLK)) then
----__RESET ON
        if(RST = '1') then
        --> reset registers
        REGS <= (others => (others => '0'));
        -- out, counters e flags si azzerano???
----__RESET OFF     
        else
------___SPILL
          if (INT_SPILL = '1') then
            BUSOUT <= REGS(to_integer(unsigned(CWP)) + COUNT);
            if(COUNT = 2*N-1) then
              INT_SPILL <= '0';
              COUNT <= 0;
            else
              COUNT <= COUNT + 1;
            end if;
          end if; -- end SPILL if
------___FILL
          if (INT_FILL = '1') then
            REGS(to_integer(unsigned(CWP)) + COUNT) <= BUSIN;
            if(COUNT = 2*N-1) then
              INT_FILL <= '0';
              COUNT <= 0;
            else
              COUNT <= COUNT + 1;
            end if;
          end if; -- end FILL if
------___ENABLE ON        
          if (EN = '1') then
--------____WRITE ON
            if (WR = '1') then
              REGS(to_integer(unsigned(to_physical_add(ADD_WR, CWP)))) <= DATAIN;
            end if; -- end WRITE if
--------____READ1 ON
            if (RD1 = '1') then
              OUT1 <= REGS(to_integer(unsigned(to_physical_add(ADD_RD1, CWP))));
            end if; -- end READ1 if
--------____READ2 ON
            if (RD2 = '1') then
              OUT2 <= REGS(to_integer(unsigned(to_physical_add(ADD_RD2, CWP))));
            end if; -- end READ2 if
          end if; -- end ENABLE if
------__CALL
          if (CALL = '1') then
            CWP <= next_win(CWP);
--------___CANSAVE
            if (CANSAVE = '1') then
              INT_SPILL <= '1'; --you can save -> SPILL
              SWP <= next_win(SWP); --you have to update SWP
            end if; -- end CANSAVE if
          end if; --end CALL if
------__RETURN
          if (RET = '1') then
            CWP <= prev_win(CWP);
--------___CANRESTORE
            if (CANRESTORE = '1') then
              INT_FILL <= '1'; --you can restore -> FILL
              SWP <= prev_win(SWP); --you have to update SWP
            end if; -- end CANRESTORE if
          end if; -- end RETURN if
        end if; -- end RESET if
      end if; -- end CLOCK if
  end process;

--Manage SAVE and RESTORE flags
  CANSAVE <= '1' when (SWP = next_win(CWP)) else '0';
  CANRESTORE <= '1' when (SWP = CWP) else '0';
--è possibile trattare CANSAVE e CANRESTORE come registri (stesso modo di CWP e
--SWP) facendo in modo che FILL/SPILL non siano "all'ultimo" ma mentre vengono
--fatte subrutine più "distanti" dal limite di finestre utilizzabili senza
--store di registri

--SPILL and FILL outputs
  SPILL <= INT_SPILL;
  FILL <= INT_FILL;

end behavioral;
--------------------------------------------------------------------------------------------------------------------------

configuration CFG_WRF of WINDOWED_RF is
  for behavioral
	
  end for;
end CFG_WRF;
