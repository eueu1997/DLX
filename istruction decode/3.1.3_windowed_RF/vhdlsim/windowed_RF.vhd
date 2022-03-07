library IEEE;
use IEEE.std_logic_1164.all;
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
       ADD_WR: in std_logic_vector(log2(3*N+M)-1 downto 0);
       ADD_RD1: in std_logic_vector(log2(3*N+M)-1 downto 0);
       ADD_RD2: in std_logic_vector(log2(3*N+M)-1 downto 0);
------ Data in/out
       DATAIN: in std_logic_vector(NBIT-1 downto 0);
       OUT1: out std_logic_vector(NBIT-1 downto 0);
       OUT2: out std_logic_vector(NBIT-1 downto 0);
------ Subroutine control signals
       CALL: in std_logic; 
       RET: in std_logic;
------ MMU control signals
       --FILL: out std_logic;
       --SPILL: out std_logic;
end entity;

-------------------------------------------------------------------------------------------------
architecture behavioral of WINDOWED_RF is

component register_file is
generic( bit_add:	integer;
         bit_data:	integer);
 port ( CLK: 	IN std_logic;
        RESET: 	IN std_logic;
        ENABLE: IN std_logic;
	RD1: 	IN std_logic;
        RD2: 	IN std_logic;
        WR: 	IN std_logic;
        ADD_WR: 	IN std_logic_vector(integer(log2(real(bit_data))) -1 downto 0);
        ADD_RD1: 	IN std_logic_vector(integer(log2(real(bit_data))) -1 downto 0);
        ADD_RD2: 	IN std_logic_vector(integer(log2(real(bit_data))) -1 downto 0);
        DATAIN: 	IN std_logic_vector(bit_data -1 downto 0);
        OUT1: 	OUT std_logic_vector(bit_data -1 downto 0);
        OUT2: 	OUT std_logic_vector(bit_data -1 downto 0));
end component;

component Cnt IS 
  generic ( N : integer);
  PORT (C: OUT std_logic_vector(N-1 DOWNTO 0);
        clk, clr, cnt, dir: IN std_logic ); 
end component;

signal int_add_wr, int_add_rd1, int_add_rd2: std_logic_vector(log2(2*N*F+M)-1 downto 0);

-------------------------------------------------------------------------------------------------------------------------
begin

RF_U : register_file generic map (bit_add => log2(2*N*F+M), bit_data => NBIT)
                     port map (CLK, RST, EN, RD1, RD2, WR,
                               int_add_wr, int_add_rd1, int_add_rd2,
                               DATAIN, OUT1, OUT2);
                               



end behavioral;
--------------------------------------------------------------------------------------------------------------------------


component Cnt IS 
generic ( N : integer);
PORT (C: OUT std_logic_vector(N-1 DOWNTO 0);
clk, clr, cnt, dir: IN std_logic ); 
END component;

signal addr_wr,addr_rd1,addr_rd2: std_logic_vector(log2(2*N*F+M)-1 downto 0);

-------------------------------------------------------------------------------------------------------------------------
begin

process (ADD_WR, ADD_RD1, ADD_RD2)
variable SWP,CWP,CANSAVE,CANRESTORE : std_logic_vector(LOG2(F) downto 0); -- 99% le variabili non vanno bene perche non hanno memoria probabilmente e poi non possono essere passate da un processo all'altro. Possiamo generare 4 registri e all'inizio di ogni processo assegniamo il valore del registro in quell'istante a una variabile per comodita, modifichiamo la variabile a piacimento, e a fine processo assegnamo la variabile al registro

	begin
	IF(CWP =7*2*N) THEN -- CASO SPECIALE( ultima window con blocco out nei primi registri del RF)
	if(to_integer(unsigned(ADD_WR))<2*N) THEN -- per i registri IN LOCAL
	  addr_wr(LOG2(real(2*N*F+M))-1           downto LOG2(real(2*N*F+M))-LOG2(real(F)))   <= cwp;  -- i MSB del addres fisico sono dati dal CWP
      addr_wr(LOG2(real(2*N*F+M))-LOG2(real(F)) -1  downto 0) <= addr; -- i LSB 

	else if(2*N<=to_integer(unsigned(ADD_WR))<3*N)THEN -- per i registri OUT
	  addr_wr(LOG2(real(2*N*F+M)-1                 downto      LOG2(real(2*N*F+M))-LOG2(real(F)))   <= (OTHERS =>’0’);
      addr_wr(LOG2(real(2*N*F+M))-LOG2(real(F))-1  downto 0) <= addr; -- i LSB 

	else --  PER I REGISTRI GLOBALI
      addr_wr(LOG2(real(2*N*F+M)-1     downto      LOG2(real(2*N*F+M))-LOG2(real(F))   <= (OTHERS =>’1’);
      addr_wr(LOG2(real(2*N*F+M))-LOG2(real(F))  -1  downto 0) <= addr; -- i LSB 

    ELSE  -- CASO NORMALE 
	if(to_integer(unsigned(ADD_WR))<3*N) then -- IN/OUT/LOCAL registers 
       addr_wr(LOG2(real(2*N*F+M)-1     downto      LOG2(real(2*N*F+M))-LOG2(F)   <= cwp;  -- i MSB del addres fisico sono dati dal CWP
       addr_wr( LOG2(real(2*N*F+M))-LOG2(F)  -1  downto 0) <= addr; -- i LSB 

	else -- GLOBAL registers
       addr_wr(LOG2(real(2*N*F+M)-1     downto      LOG2(real(2*N*F+M))-LOG2(F)   <= (OTHERS =>’1’);
       addr_wr( LOG2(real(2*N*F+M))-LOG2(F)  -1  downto 0) <= addr; -- i LSB 

end process;

PROCESS( CALL )
 variable SWP,CWP,CANSAVE,CANRESTORE : std_logic_vector(LOG2(real(F)) downto 0); 
	begin 
	CANSAVE := CANSAVE - '1'; 
	CANRESTORE := CANRESTORE + '1';
    CWP := CWP + 2*N ;  
    if(CANSAVE =1) then 
    spill() -- implementare funzione spill() ( puo anche non essere funzione basta che spilli
    SWP := SWP + 2*N;
	CANSAVE := CANSAVE +'1';
	CANRESTORE := CANRESTORE - '1';
	end if;
end process;

PROCESS(RET)
 variable SWP,CWP,CANSAVE,CANRESTORE : std_logic_vector(LOG2(real(F)) downto 0); 
	
	begin
	CANSAVE := CANSAVE + '1'; 
	CANRESTORE := CANRESTORE - '1';
    CWP := CWP - 2*N ;  
    if(CANRESTORE = '1') then 
    restore() -- implementare funzione spill() ( puo anche non essere funzione basta che spilli
    SWP := SWP + 2*N;
	CANSAVE := CANSAVE -'1';
	CANRESTORE := CANRESTORE + '1';
	end if;
end behavioral;
--------------------------------------------------------------------------------------------------------------------------



