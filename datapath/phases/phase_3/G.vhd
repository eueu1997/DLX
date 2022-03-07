library ieee;
use ieee.std_logic_1164.all;

entity G is 
	port (pik: in std_logic;
              gik: in std_logic;
              gik_1: in std_logic;
              gij: out std_logic);
end G;

architecture behavioral of G is 
begin
 gij <= (pik and gik_1) or gik;
end behavioral;

configuration CFG_G_BEH of G is 
for behavioral
end for;
end CFG_G_BEH;
