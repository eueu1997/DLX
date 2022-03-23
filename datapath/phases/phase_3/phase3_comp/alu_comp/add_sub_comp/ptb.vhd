library ieee;
use ieee.std_logic_1164.all;

entity ptb is
end ptb;

architecture tb of ptb is

component prova is
port ( a : in std_logic;
		b : in std_logic;
		c : in std_logic;
		z : out std_logic);
end component;
signal as,bs,cs,ds,zs : std_logic;
begin

uut : prova port map(as,bs,cs,zs);
as <= '0';
bs <= '1';
cs <= '0';
ds <= '0';
end tb;
