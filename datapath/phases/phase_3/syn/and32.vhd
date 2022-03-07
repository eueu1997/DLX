library ieee;
use ieee.std_logic_1164.all;

entity nand32 is

	port(a : in std_logic_vector(31 downto 0);
		 b : in std_logic_vector(31 downto 0);
		 sel : in std_logic;
		 out32 : out std_logic_vector(31 downto 0));
end nand32;

architecture structural of nand32 is 
	
	begin 
	
	out32 <= not(a and b)and sel; -- da implementare in cascata

end structural;
