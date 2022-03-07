library ieee;
use ieee.std_logic_1164.all;

entity final_mux_sel is
	
	port ( a : in std_logic_vector(2 downto 0);
			sel : out std_logic_vector(1 downto 0));

end final_mux_sel;

architecture structural of final_mux_sel is
component or_1 is
	
	port ( x: in std_logic;
		   y: in std_logic;
		   z: out std_logic);
end component;

component and_1 is
	
	port ( x: in std_logic;
		   y: in std_logic;
		   z: out std_logic);
end component;
signal tmp1,tmp2,tmp3 : std_logic;
begin
and1 : and_1 port map (a(2),a(1),tmp1);
and2 : and_1 port map (a(2),a(1),tmp2);
and3 : and_1 port map (tmp2,a(0),tmp3);
or1  : or_1 port map (tmp1,tmp3,sel(0)); 
sel(1) <= a(2) and not(a(1));



end structural;
