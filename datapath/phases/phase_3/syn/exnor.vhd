library ieee;
use ieee.std_logic_1164.all;

entity exnor is
	
	port ( x: in std_logic;
		   y: in std_logic;
		   z: out std_logic);
end exnor;

architecture structural of exnor is

begin
	
z <= x xnor y;

end structural;
