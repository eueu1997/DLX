library ieee;
use ieee.std_logic_1164.all;

entity not_32 is 
	
	port (a : in std_logic_vector(31 downto 0);
		  output : out std_logic_vector(31 downto 0));

end not_32;

architecture beh of not_32 is 
begin
output <= not(a);

end beh;
