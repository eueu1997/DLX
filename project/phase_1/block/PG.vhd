library ieee;
use ieee.std_logic_1164.all;

entity PG is 
	port ( pik : in std_logic;
		   gik : in std_logic;
		   pik_1 : in std_logic;
		   gik_1 : in std_logic;
		   pij : out std_logic;
		   gij : out std_logic);
end PG;

architecture behavioral of PG is 
begin
 gij <= gik or (pik and gik_1);
 pij <= pik and pik_1;
end behavioral;

configuration CFG_PG_BEH of PG is 
for behavioral
end for;
end CFG_PG_BEH;
