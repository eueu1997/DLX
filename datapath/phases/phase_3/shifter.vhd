library ieee;
use ieee.std_logic_1164.all;
use ieee.math_real.all;

entity shifter is

	generic ( nbit : integer );
	port ( input : std_logic_vector(nbit -1 downto 0);
			sel : std_logic_vector(integer(log2(real(nbit))) - 1 downto 0);
			lr : std_logic; -- 0 per left, 1 per right
			output : std_logic_vector(nbit-1 downto 0));

end shifter;

architecture structural of shifter is 

	component MUX21 is
	Generic (NBIT: integer );
	Port (	A:	In	std_logic_vector(NBIT-1 downto 0) ;
		B:	In	std_logic_vector(NBIT-1 downto 0);
		SEL:	In	std_logic;
		Y:	Out	std_logic_vector(NBIT-1 downto 0));
	end component;

	component MUX41 is
	Generic (NBIT: integer );
	Port (	A:	In	std_logic_vector(NBIT-1 downto 0) ;
		B:	In	std_logic_vector(NBIT-1 downto 0);
		C:	In	std_logic_vector(NBIT-1 downto 0);
		D:	In	std_logic_vector(NBIT-1 downto 0);
		SEL:In	std_logic_vector(1 downto 0);
		Y:	Out	std_logic_vector(NBIT-1 downto 0));
	end component;

	
	component MUX81 is
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
	end component;
signal m0,m1,m2,m3,gshift : std_logic_vector(nbit + 8 downto 0);
signal yl,yr : std_logic_vector(nbit downto 0);

begin
--1 stage
M0 : mux21 generic map ( nbit + 8 ) port map(input & std_logic_vector(to_unsigned(0,8)),std_logic_vector(to_unsigned(0,8)) & input,lr,m0);
M8 : mux21 generic map ( nbit + 8 ) port map(input(23 downto 0) & std_logic_vector(to_unsigned(0,16)),std_logic_vector(to_unsigned(0,16)) & input(31 downto 8),lr,m1);
M16 : mux21 generic map ( nbit + 8 ) port map(input(15 downto 0) & std_logic_vector(to_unsigned(0,24)),std_logic_vector(to_unsigned(0,24)) & input(31 downto 16),lr,m2);
M24 : mux21 generic map ( nbit + 8 ) port map(input(7 downto 0) & std_logic_vector(to_unsigned(0,32)),std_logic_vector(to_unsigned(0,32)) & input(31 downto 24),lr,m3);
--2 stage
mux2 : mux41 generic map(nbit + 8) port map(m0,m1,m2,m3,sel(4 downto 3),gshift);
--3 stage
mux3l : mux81 generic map( nbit) port map (gshift(39 downto 8),gshift(38 downto 7),gshift(37 downto 6),gshift(36 downto 5),gshift(35 downto 4),gshift(34 downto 3),gshift(33 downto 2),gshift(32 downto 1),gshift(31 downto 0),sel(2 downto 0),yl);
mux3r : mux81 generic map( nbit) port map (gshift(31 downto 0),gshift(32 downto 1),gshift(33 downto 2),gshift(34 downto 3),gshift(35 downto 4),gshift(36 downto 5),gshift(37 downto 6),gshift(38 downto 7),gshift(39 downto 8),sel(2 downto 0),yr);
muxfinal : mux21 generic map(nbit) port map ( yl,yr,lr,y);
