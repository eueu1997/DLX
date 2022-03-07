library IEEE;
use IEEE.std_logic_1164.all;
use ieee.math_real.all;
use ieee.numeric_std.all;

entity TBWREGISTERFILE is
end TBWREGISTERFILE;

architecture TESTA of TBWREGISTERFILE is

       signal CLK: std_logic := '0';
       signal RESET: std_logic;
       signal ENABLE: std_logic;
       signal RD1: std_logic;
       signal RD2: std_logic;
       signal WR: std_logic;
       signal ADD_WR: std_logic_vector(3 downto 0);
       signal ADD_RD1: std_logic_vector(3 downto 0);
       signal ADD_RD2: std_logic_vector(3 downto 0);
       signal DATAIN: std_logic_vector(7 downto 0);
       signal OUT1: std_logic_vector(7 downto 0);
       signal OUT2: std_logic_vector(7 downto 0);
	   signal CALL:  std_logic; 
       signal RET:  std_logic;
       signal FILL:  std_logic;
       signal SPILL:  std_logic;
       signal BUSIN:   std_logic_vector(7 downto 0);
       signal BUSOUT:  std_logic_vector(7 downto 0);

component WINDOWED_RF is

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
	end component;

begin 

RG: WINDOWED_RF
GENERIC MAP (8,4,4,4)
PORT MAP (CLK,RESET,ENABLE,RD1,RD2,WR,ADD_WR,ADD_RD1,ADD_RD2,DATAIN,OUT1,OUT2,CALL,RET,FILL,SPILL,BUSIN,BUSOUT);
	RESET <= '1','0' after 1 ns;
	ENABLE <= '0','1' after 3 ns;
	WR <= '0','1' after 4 ns, '0' after 6 ns;
	RD1 <= '0','1' after  7 ns, '0' after 8 ns, '1' after 24 ns;
	RD2 <= '0', '1' AFTER 7 ns, '0' after 8 ns, '1' after 24 ns;
	CALL <= '0' , '1' after 6 ns ,'0' after 7 ns , '1' after 8 ns , '0' after 9 ns , '1' after 10 ns , '0' after 11 ns ;
	RET <= '0', '1' after 12 ns , '0' after 16 ns ;
	
	ADD_WR <= "1100"after 4 ns,"0000" after 5 ns;
	ADD_RD1 <= "1100" after 7 ns;
	ADD_RD2<=  "0000" after 7 ns ;
	DATAIN<= "10101100", "10001000" after 5 ns,"11110000" after 8 ns ;
	BUSIN <= "10001000" after 15 ns, "00000000" after 16 ns;
 	
	

	PCLOCK : process(CLK)
	begin
		CLK <= not(CLK) after 0.5 ns;	
	end process;

end TESTA;

---
configuration CFG_TESTWRF of TBWREGISTERFILE is
  for TESTA
	for RG : WINDOWED_RF
		use configuration WORK.CFG_WRF;
	end for; 
  end for;
end CFG_TESTWRF;
