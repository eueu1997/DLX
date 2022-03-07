library IEEE;
use IEEE.std_logic_1164.all;



entity MUX21 is
	Generic (NBIT: integer);
	Port (	A:	In	std_logic_vector(NBIT-1 downto 0) ;
		B:	In	std_logic_vector(NBIT-1 downto 0);
		SEL:	In	std_logic;
		en : in std_logic;
		Y:	Out	std_logic_vector(NBIT-1 downto 0));
end MUX21;

architecture BEHAVIORAL of MUX21 is
signal s : std_logic_vector( NBIT-1 downto 0);
begin
	s <= A when SEL='0' else B;
	Y <= A when en = '0'else s;
	
end BEHAVIORAL;

configuration CFG_MUX21_BEHAVIORAL of MUX21 is
	for BEHAVIORAL
	end for;
end configuration;


