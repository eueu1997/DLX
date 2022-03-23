library ieee;
use ieee.std_logic_1164.all;

entity xor32_tb is 
end xor32_tb;

architecture tb of xor32_tb is

component xor_32 is

port ( 		x: in std_logic_vector(31 downto 0);
		   y: in std_logic;
		   z: out std_logic_vector(31 downto 0));

end component;

signal xs,zs : std_logic_vector(31 downto 0);
signal ys,suca,cazzo : std_logic;

begin

uut : xor_32 port map (xs,ys,zs);

xs <= "00000010000010000000100000000000";
ys <= '0', '1' after 10 ns;
cazzo <= '1';
end tb;
