library ieee;
use ieee.std_logic_1164.all;

entity logic_tb is
end logic_tb;

architecture tb of logic_tb is

component logic is 
	
	generic(nbit : integer);
	port( a : in std_logic_vector(nbit-1 downto 0);
		  b : in std_logic_vector(nbit-1 downto 0);
		  sel : in std_logic_vector(0 to 3);
		  en : in std_logic;
		  o : out std_logic_vector(nbit-1 downto 0));

end component;

signal a_s,b_s,o_s : std_logic_vector(31 downto 0);
signal sel_s : std_logic_vector(3 downto 0);
signal en : std_logic;

begin

UUT : logic generic map (32) port map ( a_s,b_s,sel_s,en,o_s);

a_s <="00000000000000000000000000001101";
b_s <= "00000000000000000000000000101011";
sel_s <="0000", "0001" after 10 ns,"0010" after 20 ns, "0011" after 30 ns , "0100" after 40 ns,
        "0101" after 50 ns, "0110" after 60 ns, "0111" after 70 ns,"1000" after 80 ns, "1001" after 90 ns,"1010" after 100 ns, "1011" after 110 ns , "1100" after 120 ns,
        "1101" after 130 ns, "1110" after 140 ns, "1111" after 150 ns;
process 
begin
en <= '0';
wait for 5 ns;
en <='1';
wait for 5 ns;
end process;
end tb;

configuration cfg_logic_tb of logic_tb is
for tb
end for;
end configuration;
     
