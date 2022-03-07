library ieee;
use ieee.std_logic_1164.all;

entity or_32 is
	
	port ( x: in std_logic_vector(31 downto 0);
		   y: in std_logic_vector(31 downto 0);
		   z: out std_logic(31 downto 0));
end or_32;

architecture structural of or_32 is

begin
	
z <= x or y;

end structural;

