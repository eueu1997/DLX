library ieee;
use ieee.std_logic_1164.all;

entity dec_tb is
end dec_tb;

architecture tb of dec_tb is

    component dec is 
	
	port ( opcode : in std_logic_vector(2 downto 0 );
		   add : out std_logic;
		   sub : out std_logic;
		   and_en : out std_logic;
		   or_en : out std_logic;
		   xor_en : out std_logic;
		   sl_en : out std_logic;
		   sr_en : out std_logic;
		   cmp : out std_logic);

end component; 

signal opcodes : std_logic_vector(2 downto 0);
signal adds,subs,ands,ors,xors,sls,srs,cmps : std_logic;

begin

uut : component port map (opcodes,adds,subs,ands,ors,xors,sls,srs,cmps);

opcodes <="000","001" after 10 ns,"010" after 20 ns,"011" after 30 ns,"100" after 40 ns,"101" after 50 ns,"110" after 60 ns,"111" after 70 ns