library ieee;
use ieee.std_logic_1164.all;

entity comparator is 
	
	port ( cout : in std_logic;
		   zero : in std_logic;
		   g : out std_logic;
		   eq : out std_logic);

end comparator;

architecture beh of comparator is 

	begin

	g <= cout;
	eq <= zero;

end beh;


