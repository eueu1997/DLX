library IEEE;
use IEEE.std_logic_1164.all;



entity MUX21 is
	Generic (NBIT: integer := 32;
		 	 DELAY_MUX: Time := 0 ns);
	Port (	A:	In	std_logic_vector(NBIT-1 downto 0) ;
		B:	In	std_logic_vector(NBIT-1 downto 0);
		SEL:	In	std_logic;
		Y:	Out	std_logic_vector(NBIT-1 downto 0));
end MUX21;

architecture BEHAVIORAL of MUX21 is
begin
	Y <= A when SEL='0' else B after DELAY_MUX;
end BEHAVIORAL;

configuration CFG_MUX21_BEHAVIORAL of MUX21 is
	for BEHAVIORAL
	end for;
end configuration;


