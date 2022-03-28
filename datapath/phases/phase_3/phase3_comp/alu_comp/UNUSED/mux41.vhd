library IEEE;
use IEEE.std_logic_1164.all;



entity MUX41 is
	Generic (NBIT: integer );
	Port (	A:	In	std_logic_vector(NBIT-1 downto 0) ;
		B:	In	std_logic_vector(NBIT-1 downto 0);
		C:	In	std_logic_vector(NBIT-1 downto 0);
		D:	In	std_logic_vector(NBIT-1 downto 0);
		SEL:In	std_logic_vector(1 downto 0);
		Y:	Out	std_logic_vector(NBIT-1 downto 0));
end MUX41;

architecture structural of MUX41 is
component MUX21 is
	Generic (NBIT: integer );
	Port (	A:	In	std_logic_vector(NBIT-1 downto 0) ;
		B:	In	std_logic_vector(NBIT-1 downto 0);
		SEL:	In	std_logic;
		Y:	Out	std_logic_vector(NBIT-1 downto 0));
end component;
signal s1,s2 : std_logic_vector(nbit-1 downto 0);
begin
mux1 : mux21 generic map(nbit) port map(a,b,sel(0),s1);
mux2 : mux21 generic map(nbit) port map(c,d,sel(0),s2);
mux3 : mux21 generic map(nbit) port map(s1,s2,sel(1),y);

end structural;



