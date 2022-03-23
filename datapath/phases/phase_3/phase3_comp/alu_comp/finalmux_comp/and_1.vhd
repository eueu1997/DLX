library ieee;
use ieee.std_logic_1164.all;

entity and_1 is
	
	port ( x: in std_logic;
		   y: in std_logic;
		   z: out std_logic);
end and_1;

architecture structural of and_1 is

begin
	
z <= x and y;

end structural;
