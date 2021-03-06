library ieee;
use ieee.std_logic_1164.all;

entity logic is 
	
	generic(nbit : integer);
	port( a : in std_logic_vector(nbit-1 downto 0);
		  b : in std_logic_vector(nbit-1 downto 0);
		  sel : in std_logic_vector(3 downto 0);
		  o : out std_logic_vector(nbit-1 downto 0));

end logic;

architecture structural of logic is
	
	component nand32 is

	port(a : in std_logic_vector(31 downto 0);
		 b : in std_logic_vector(31 downto 0);
		 sel : in std_logic;
		 out32 : out std_logic_vector(31 downto 0));
	
	end component;

component or_32 is

	port(x : in std_logic_vector(31 downto 0);
		 y : in std_logic_vector(31 downto 0);
		 z : out std_logic_vector(31 downto 0));
	
	end component;

	component not_32 is 
	
	port (a : in std_logic_vector(31 downto 0);
		  output : out std_logic_vector(31 downto 0));

	end component;

	signal l0,l1,l2,l3,nota,notb,notl0,notl1,notl2,notl3,tmp1,tmp2 : std_logic_vector(nbit-1 downto 0);
	
	begin 
	not_a : not_32 port map ( a,nota);
	not_b : not_32 port map ( b,notb);
	s0 : nand32 port map(nota,notb,sel(0),l0);
	s1 : nand32 port map(nota,b,sel(1),l1);
	s2 : nand32 port map(a,notb,sel(2),l2);
	s3 : nand32 port map(a,b,sel(3),l3);
	nl0 : not_32 port map ( l0,notl0);
	nl1 : not_32 port map ( l1,notl1);
	nl2 : not_32 port map ( l2,notl2);
	nl3 : not_32 port map ( l3,notl3);
	or1 : or_32 port map(notl0,notl1,tmp1);
	or2 : or_32 port map(notl2,notl3,tmp2);
	or3 : or_32 port map(tmp1,tmp2,o);
	
	
end structural;
