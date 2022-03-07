library ieee;
use ieee.std_logic_1164.all;

entity xor_1 is
	
	port ( x: in std_logic;
		   y: in std_logic;
		   z: out std_logic);
end xor_1;

architecture structural of xor_1 is

begin
	
z <= x xor y;

end structural;

