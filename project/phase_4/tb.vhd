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
		  npc_en : in std_logic;
		  lmd_en : in std_logic;
		  ram_en : in std_logic; 
		  ram_res : in std_logic;
		  rw : in std_logic;
		  pc : out std_logic_vector ( nbit -1 downto 0 );
		  lmd : out std_logic_vector( nbit -1 downto 0);
		  aluout : out std_logic_vector ( nbit -1 downto 0));

end component;

signal alu_out_s,b_s,npc_s,pc_s,lmd_s,aluout_s : std_logic_vector( 32 -1 downto 0);
signal cond_s,j_en_s,npc_en_s,lmd_en_s,ram_en_s,ram_res_s,rw_s : std_logic;

begin

uut : phase_4 generic map ( 32 ) port map (alu_out_s,b_s,npc_s,cond_s,j_en_s,npc_en_s,lmd_en_s,ram_en_s,ram_res_s,rw_s,pc_s,lmd_s,aluout_s);
ram_res_s <= '1' , '0' after 5 ns;
alu_out_s(31 downto 4 ) <= (others=>'0');
alu_out_s(3 downto 0) <= "0000", "0010" after 21 ns; 
b_s(31 downto 4 ) <= (others => '0') ;
b_s(3 downto 0) <= "1111"; 
rw_s <= '0' after 5 ns,'1' after 11 ns;
ram_en_s <= '0' , '1' after 5 ns, '0' after 30 ns;
j_en_s <= '0','1' after 50 ns;
lmd_en_s <= '0', '1' after 19 ns , '0' after 20 ns, '1' after 29 ns , '0' after 30 ns;
npc_en_s <= '0' , '1' after 39 ns, '0' after 40 ns , '1' after 49 ns , '0' after 50 ns, '1' after 59 ns, '0' after 60 ns;
npc_s (31 downto 4 ) <= ( others => '0');
npc_s (3 downto 0 ) <= "0000" after 30 ns,"1100" after 40 ns;
cond_s <= '0' after 30 ns, '1' after 40 ns;

end tb1;

configuration cfg_tb of tb is
for tb1
end for;
end configuration;
