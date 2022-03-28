library ieee;
use ieee.std_logic_1164.all;

entity logic is 
	
	generic(nbit : integer);
	port( a : in std_logic_vector(nbit-1 downto 0);
		  b : in std_logic_vector(nbit-1 downto 0);
		  sel : in std_logic_vector(0 to 3);
		  en : in std_logic;
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

	component and_32 is

	port(a : in std_logic_vector(31 downto 0);
		 b : in std_logic_vector(31 downto 0);
		 out32 : out std_logic_vector(31 downto 0));

	end component;

	signal l0,l1,l2,l3,nota,notb,notl0,notl1,notl2,notl3,tmp1,tmp2,tmp3,as,bs : std_logic_vector(31 downto 0);
	signal sels : std_logic_vector ( 0 to 3);
	begin 
	process (en,a,b,sel)
	begin
		if ( en = '1') then
			as <=a ;
			bs <=b;
			sels <= sel;
		end if;
	end process;

	not_a : not_32 port map ( as,nota);
	not_b : not_32 port map ( bs,notb);
	s0 : nand32 port map(nota,notb,sels(0),l0);
	s1 : nand32 port map(nota,bs,sels(1),l1);
	s2 : nand32 port map(as,notb,sels(2),l2);
	s3 : nand32 port map(as,bs,sels(3),l3);
	
	n1 : and_32 port map(l0,l1,tmp1);
	n2 : and_32 port map(l2,l3,tmp2);
	n3 : and_32 port map(tmp1,tmp2,tmp3);
	final : not_32 port map ( tmp3,o);
	
	
end structural;
