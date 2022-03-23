library ieee;
use ieee.std_logic_1164.all;

entity prova is
port ( a : in std_logic;
		b : in std_logic;
		c : in std_logic;
		z : out std_logic);
end prova;

architecture beh of prova is

begin

z <= a and b;

end beh;
