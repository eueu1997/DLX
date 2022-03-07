library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;

entity zero is
	generic(
			nbit	:	integer 	:=32
			);

	port(
		x		:	in		std_logic_vector(nbit -1 downto 0);
		opcode	: 	in		std_logic; -- 0 for beq, 1 for bneq
		z		:	out		std_logic
		);

end zero;

architecture structural of zero is

component  or_1 is
	
	port ( x: in std_logic;
		   y: in std_logic;
		   z: out std_logic);
end component;

component exnor is
	
	port ( x: in std_logic;
		   y: in std_logic;
		   z: out std_logic);
end component;

 

signal row1 : std_logic_vector(nbit-1 downto 0);
signal row2 : std_logic_vector(nbit/2-1 downto 0);
signal row3 : std_logic_vector(nbit/4 -1 downto 0);
signal row4 : std_logic_vector(nbit/8 -1 downto 0);
signal row5 : std_logic_vector(nbit/16 -1 downto 0);
signal row6 : std_logic_vector(nbit/32 -1 downto 0);

begin

gen1 : for i in 0 to nbit-1 generate 
	row_1 : or_1 port map (x(i),'0',row1(i));
end generate gen1;

gen2 : for i in 0 to nbit/2-1 generate
	row_2 : or_1 port map (row1(2*i),row1(2*i+1),row2(i));
end generate gen2;

gen3 : for i in 0 to nbit/4-1 generate 
	row_3 : or_1 port map (row2(2*i),row2(2*i+1),row3(i));
end generate gen3;

gen4 : for i in 0 to nbit/8-1 generate
	row_4 : or_1 port map (row3(2*i),row3(2*i+1),row4(i));
end generate gen4;

gen5 : for i in 0 to nbit/16-1 generate
	row_5 : or_1 port map (row4(2*i),row4(2*i+1),row5(i));
end generate gen5;

	row_6 : or_1 port map(row5(0),row5(1),row6(0));

	row_7 : exnor port map (row6(0) , opcode,z);


end structural;


