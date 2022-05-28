library ieee;
use ieee.std_logic_1164.all;

entity tb is 
end tb;

architecture tb1 of tb is
	
	component fetch is 

	generic ( bit_add : integer;
			  i_size : integer);
	port( 	pc_s : in std_logic_vector(bit_add -1 downto 0);
			en : in std_logic;
			imem_res : in std_logic;
			npc_r : out std_logic_vector(bit_add-1  downto 0);
			pc_out : out std_logic_vector(bit_add-1  downto 0);
			npc_d : out std_logic_vector(bit_add-1  downto 0);
			ir_s : out std_logic_vector(i_size -1 downto 0));


	end component;
constant bit_add1 : integer := 32;
constant i_size1 : integer := 32;
signal pc_s,npc_r,pc_out,npc_d : std_logic_vector(bit_add1-1 downto 0);
signal ir_s : std_logic_vector(i_size1-1 downto 0);
signal en,imem_res : std_logic;

begin

UUT : fetch generic map (bit_add1,i_size1) port map ( pc_s , en , imem_res , npc_r ,pc_out,  npc_d , ir_s);

pc_s <= "00000000000000000000000000000000" after 0.5 ns , "00000000000000000000000000000001" after 2.5 ns,"00000000000000000000000000000010" after 7.5 ns,"00000000000000000000000000000011" after 12.5 ns,"00000000000000000000000000000000" after 17.5 ns,"00010011100000111000000001111111" after 22.5 ns;

en <= '0', '1' after 2 ns , '0' after 2.5 ns, '1' after 7 ns , '0' after 7.5 ns,'1' after 12 ns , '0' after 12.5 ns,'1' after 17 ns , '0' after 17.5 ns,'1' after 22 ns, '0' after 22.5 ns,'1' after 27 ns, '0' after 27.5 ns;
imem_res <= '0' , '1' after 1 ns ;



end tb1;

configuration cfg_tb of tb is
for tb1
end for;
end configuration;
