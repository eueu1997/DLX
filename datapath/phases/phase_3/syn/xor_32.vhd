library ieee;
use ieee.std_logic_1164.all;

entity xor_32 is 

port ( 		x: in std_logic_vector(31 downto 0);
		   y: in std_logic;
		   z: out std_logic_vector(31 downto 0));

end xor_32;

architecture structural of xor_32 is

component  xor_1 is
	
	port ( x: in std_logic;
		   y: in std_logic;
		   z: out std_logic);
end component;

begin 

gen : for i in 0 to 31 generate
row_1 : xor_1 port map (x(i),y,z(i));
end generate;

end structural; 
