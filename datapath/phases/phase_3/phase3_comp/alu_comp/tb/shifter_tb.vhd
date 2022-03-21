library ieee;
use ieee.std_logic_1164.all;

entity shifter_tb is
end shifter_tb;

architecture tb of shifter_tb is

    component shifter is
    generic ( nbit : integer );
	port ( input : in std_logic_vector(nbit -1 downto 0);
			sel : in std_logic_vector(integer(log2(real(nbit))) - 1 downto 0);
			lr : in std_logic; -- 0 per left, 1 per right
			output : out std_logic_vector(nbit-1 downto 0));

    end component;
    
    constant nb : integer := 32;
    signal inputs : std_logic_vector(nb -1 downto 0);
    signal sels : std_logic_vector(integer(log2(real(nb)))-1 downto 0);
    signal lrs: std_logic;
    signal outputs :  std_logic_vector(nb-1 downto 0);

    begin 

    uut : shifter generic map(nb) port map(inputs,sels,lrs,outputs);

    inputs <= "00000000000000000000000011110000","0000000000001111000000000000000" after ns;
    sels <= "00000","00001" after 20 ns,"00010" after 40 ns,"00011" after 60 ns,"00111" after 80 ns,"11111" after 100 ns;

    process()
    begin
    lrs <= '0';
    wait for 10 ns;
    lrs <= '1' ;
    wait for 10 ns;
    end process;

    end tb;