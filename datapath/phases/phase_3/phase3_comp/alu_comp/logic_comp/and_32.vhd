library ieee;
use ieee.std_logic_1164.all;

entity and_32 is

	port(a : in std_logic_vector(31 downto 0);
		 b : in std_logic_vector(31 downto 0);
		 out32 : out std_logic_vector(31 downto 0));
end and_32;

architecture structural of and_32 is 
	
	begin 
	
	out32 <= a and b; -- da implementare in cascata

end structural;
