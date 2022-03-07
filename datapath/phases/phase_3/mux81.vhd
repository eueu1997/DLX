library IEEE;
use IEEE.std_logic_1164.all;



entity MUX81 is
	Generic (NBIT: integer );
	Port (	A:	In	std_logic_vector(NBIT-1 downto 0) ;
		B:	In	std_logic_vector(NBIT-1 downto 0);
		C:	In	std_logic_vector(NBIT-1 downto 0);
		D:	In	std_logic_vector(NBIT-1 downto 0);
		E:	In	std_logic_vector(NBIT-1 downto 0);
		F:	In	std_logic_vector(NBIT-1 downto 0);
		G:	In	std_logic_vector(NBIT-1 downto 0);
		H:	In	std_logic_vector(NBIT-1 downto 0);
		SEL:In	std_logic_vector(2 downto 0);
		Y:	Out	std_logic_vector(NBIT-1 downto 0));
end MUX81;

architecture structural of MUX81 is
component MUX41 is
	Generic (NBIT: integer );
	Port (	A:	In	std_logic_vector(NBIT-1 downto 0) ;
		B:	In	std_logic_vector(NBIT-1 downto 0);
		C:	In	std_logic_vector(NBIT-1 downto 0);
		D:	In	std_logic_vector(NBIT-1 downto 0);
		SEL:In	std_logic_vector(1 downto 0);
		Y:	Out	std_logic_vector(NBIT-1 downto 0));
end component;
component MUX21 is
	Generic (NBIT: integer );
	Port (	A:	In	std_logic_vector(NBIT-1 downto 0) ;
		B:	In	std_logic_vector(NBIT-1 downto 0);
		SEL:	In	std_logic;
		Y:	Out	std_logic_vector(NBIT-1 downto 0));
end component;
signal s1,s2 : std_logic_vector(nbit-1 downto 0);
begin
mux1 : mux41 generic map(nbit) port map(a,b,c,d,sel(1 downto 0),s1);
mux2 : mux41 generic map(nbit) port map(e,f,g,h,sel(1 downto 0),s2);
mux3 : mux21 generic map(nbit) port map(s1,s2,sel(2),y);

end structural;
