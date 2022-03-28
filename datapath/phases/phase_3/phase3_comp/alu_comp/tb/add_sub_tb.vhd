library ieee;
use ieee.std_logic_1164.all;

entity add_sub_tb is 
end add_sub_tb;

architecture tb of add_sub_tb is

component add_sub is 
	
	generic ( nbit : integer );
	port 	(A: in std_logic_vector(NBIT-1 downto 0);
       		 B: in std_logic_vector(NBIT-1 downto 0);
       		 Cin: in std_logic;
			 as : in std_logic;
        	 S: out std_logic_vector(NBIT-1 downto 0);
			 en : in std_logic;
        	 Co: out std_logic);

end component ; 

signal a_s , b_s , s_s: std_logic_vector (31 downto 0);
signal as_s,co_s,cis,ens : std_logic ;


begin 

UUT : add_sub generic map ( 32 ) port map (  a_s , b_s ,cis , as_s , s_s,ens ,co_s);
-
a_s <= "00000000000000000000000000000001" ,"00000000000000000000000000000111" after 20 ns,"00000000000000000000000000000011" after 40 ns ;
b_s <= "00000000000000000000000000000001" , "00000000000000000000000000010001" after 20 ns,"00000000000000000000000000000111" after 40 ns; 
as_s <= '0', '1' after 10 ns, '0' after 20 ns , '1' after 30 ns , '0' after 40 ns,'1' after 50 ns;
cis <= '1','0' after 10 ns, '1' after 20 ns;
ens <= '0', '1' after 10 ns, '0' after 15 ns, '1' after 25 ns;
end architecture ;

configuration cfg_tb1 of add_sub_tb is
for tb
end for;
end configuration;
