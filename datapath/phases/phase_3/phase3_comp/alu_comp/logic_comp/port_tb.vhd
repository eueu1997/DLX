library ieee;
use ieee.std_logic_1164.all;

entity port_tb is
end port_tb;

architecture tb of port_tb is

component and_32 is

	port(a : in std_logic_vector(31 downto 0);
		 b : in std_logic_vector(31 downto 0);
		 out32 : out std_logic_vector(31 downto 0));
end component;

component nand32 is

	port(a : in std_logic_vector(31 downto 0);
		 b : in std_logic_vector(31 downto 0);
		 sel : in std_logic;
		 out32 : out std_logic_vector(31 downto 0));
	
end component;

signal a_s,b_s,and_32_s,nand32_s : std_logic_vector(31 downto 0);
signal sels : std_logic;
begin

UUT : and_32 port map ( a_s,b_s,and_32_s);
UUT1 : nand32 port map ( a_s,b_s,sels,nand32_s);
sels <= '0', '1' after 10 ns;
a_s <= "00000000111100000000000011110000";
b_s <= "00000000111100000000000011111111";
end tb;

configuration cfg_port_tb of port_tb is
for tb
end for;
end configuration;
