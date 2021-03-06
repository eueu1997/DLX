library ieee;
use ieee.std_logic_1164.all;

entity zero_tb is
end zero_tb;

architecture tb of zero_tb is

component zero is
	generic(nbit	:	integer 	:=32);

	port(
		x		:	in		std_logic_vector(nbit -1 downto 0);
		opcode	: 	in		std_logic; -- 0 for beq, 1 for bneq
		z		:	out		std_logic);

end component;

signal x_s : std_logic_vector(31 downto 0);
signal opcode_s, z_s : std_logic ;

begin

DUT : zero generic map ( 32 ) port map ( x_s,opcode_s,z_s);

x_s <= "00000000000000000000000000000000", "00000000000000000000000000000001" after 10 ns, "11111111111111111111111111111111" after 20 ns;
opcode_s <= '0','1' after 5 ns,'0' after 10 ns , '1' after 15 ns , '0' after 20 ns , '1' after 25 ns ;

end tb;


