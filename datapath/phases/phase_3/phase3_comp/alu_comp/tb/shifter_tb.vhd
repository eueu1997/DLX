library ieee;
use ieee.std_logic_1164.all;
use ieee.math_real.all;

entity shifter_tb is
end shifter_tb;

architecture tb of shifter_tb is

    component shifter is
    generic ( nbit : integer );
	port ( input : in std_logic_vector(nbit -1 downto 0);
			sel : in std_logic_vector(integer(log2(real(nbit))) - 1 downto 0);
			lr : in std_logic; -- 0 per left, 1 per right
            en : in std_logic;
			output : out std_logic_vector(nbit-1 downto 0));

    end component;
    
    constant nb : integer := 32;
    signal inputs : std_logic_vector(nb -1 downto 0);
    signal sels : std_logic_vector(integer(log2(real(nb)))-1 downto 0);
    signal lrs,ens: std_logic;
    signal outputs :  std_logic_vector(nb-1 downto 0);

    begin 

    uut : shifter generic map(nb) port map(inputs,sels,lrs,ens,outputs);

    inputs <= "00000000100000100000000000011000","00000000000111000000001010000110" after 120 ns;
    sels <= "00000","00001" after 20 ns,"00010" after 40 ns,"00011" after 60 ns,"00111" after 80 ns,"11111" after 100 ns,"00000" after 120 ns,"00001" after 140 ns,"00010" after 160 ns,"00011" after 180 ns,"00111" after 200 ns,"11111" after 220 ns;
    proc : process is
    begin
    lrs <= '0';
    ens <= '0';
    wait for 10 ns;
    lrs <= '1' ;
    ens <= '1';
    wait for 10 ns;
    end process;

    end tb;
