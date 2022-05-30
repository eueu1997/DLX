library ieee;
use IEEE.std_logic_1164.all;

entity tb is
end tb;

architecture tb1 of tb is
	
component phase_4 is
	generic (nbit : integer);
	port (alu_out : in std_logic_vector(nbit -1  downto 0);
		  b : in std_logic_vector(nbit - 1 downto 0);
		  npc : in std_logic_vector( nbit - 1 downto 0);
		  cond : in std_logic;
		  j_en : in std_logic;
		  bj_en : in std_logic;
		  en : in std_logic;
		  ram_en : in std_logic; 
		  wb_sel : in std_logic;
		  ram_res : in std_logic;
		  rw : in std_logic; -- 1 for read 0 for write
		  pc : out std_logic_vector ( nbit -1 downto 0 );
		  wb : out std_logic_vector ( nbit -1 downto 0));

end component;

signal alu_out,b,npc,pc,wb : std_logic_vector( 32 -1 downto 0);
signal cond,j_en,bj_en,ram_en,wb_sel,ram_res,rw,en : std_logic;

begin

uut : phase_4 generic map ( 32 ) port map (alu_out,b,npc,cond,j_en,bj_en,en,ram_en,wb_sel,ram_res,rw,pc,wb);


alu_out(31 downto 4 ) <= (others=>'0');
alu_out(3 downto 0) <=  "0010" ; 
npc <= "00000000000000000000000000100110";
-------- npc--npc------------npc------------npc--------------npc--------------alu_out----------alu_out--------npc-------------alu_out		
bj_en <= '0',																'1' after 20 ns;												
cond <= '0',				'1' after 5 ns, '0' after 10 ns,'1' after 15 ns,                '0' after 25 ns					,'1' after 35 ns;			
j_en <= '0',								'1' after 10 ns,												'0' after 30 ns;

b(31 downto 4 ) <= (others => '0') ;
b(3 downto 0) <= "1111"; 

ram_en <= '0',			     '1' after 10 ns;
rw <= 	  '0','1' after 5 ns,				 '0' after 15 ns,'1' after 20 ns,                '0' after 30 ns,'1' after 35 ns;
ram_res <= '1' , '0' after 1 ns,                                             '1' after 25 ns,'0' after 26 ns;
wb_sel <= '0';

process
begin
en<='0';
wait for 2.5 ns;
en<='1';
wait for 2.5 ns;
end process;
end tb1;

configuration cfg_tb of tb is
for tb1
end for;
end configuration;
