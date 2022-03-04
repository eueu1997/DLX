library ieee;
use ieee.std_logic_1164.all;

entity tb is 
end tb;

architecture tb1 of tb is
	
	component fetch is 

	generic ( bit_add : integer;
			  i_size : integer);
	port( pc_s : in std_logic_vector(bit_add -1 downto 0);
		  npc_en : in std_logic;
		  ir_en : in std_logic;
		  imem_res : in std_logic;
		  npc_s : out std_logic_vector(bit_add -1 downto 0);
		  ir_s : out std_logic_vector(i_size -1 downto 0));



	end component;
constant bit_add1 : integer := 32;
constant i_size1 : integer := 32;
signal npc_ss,pc_ss : std_logic_vector(bit_add1-1 downto 0);
signal ir_ss : std_logic_vector(i_size1-1 downto 0);
signal npc_ens,ir_ens,imem_ress : std_logic;

begin

UUT : fetch generic map (bit_add1,i_size1) port map ( pc_ss , npc_ens , ir_ens , imem_ress , npc_ss , ir_ss);

pc_ss <= "00000000000000000000000000000000" after 0.5 ns , "00000000000000000000000000000001" after 2.5 ns,"00000000000000000000000000000010" after 7.5 ns,"00000000000000000000000000000011" after 12.5 ns;
--pc_ss <="00000" after 0.5 ns , "00001" after 2.5 ns,"00010" after 7.5 ns,"00011" after 12.5 ns;
npc_ens <= '0', '1' after 2 ns , '0' after 2.5 ns, '1' after 7 ns , '0' after 7.5 ns,'1' after 12 ns , '0' after 12.5 ns,'1' after 17 ns , '0' after 17.5 ns;
ir_ens <= '0', '1' after 2 ns , '0' after 2.5 ns, '1' after 7 ns , '0' after 7.5 ns,'1' after 12 ns , '0' after 12.5 ns,'1' after 17 ns , '0' after 17.5 ns;
imem_ress <= '0' , '1' after 1 ns ;

--process ( npc_ss ) 
--begin
--pc_ss <= npc_ss;

--end process;

end tb1;

configuration cfg_tb of tb is
for tb1
end for;
end configuration;
