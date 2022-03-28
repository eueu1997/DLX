library ieee;
use ieee.std_logic_1164.all;
use ieee.math_real.all;

entity shifter is

	generic ( nbit : integer );
	port ( input : in std_logic_vector(nbit -1 downto 0);
			sel : in std_logic_vector(integer(log2(real(nbit))) - 1 downto 0);
			lr : in std_logic; -- o left,1 right
			en : in std_logic;
			output : out std_logic_vector(nbit-1 downto 0));

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
signal m0,m1,m2,m3,gshift : std_logic_vector(nbit + 7 downto 0);
signal yl,yr,as,bs : std_logic_vector(nbit - 1  downto 0);
signal ext1,ext2,ext3,ext4,ext5,ext6,ext7,ext8 : std_logic_vector(nbit + 7 downto 0);
begin
	process ( en,as,bs)
	begin
		if ( en = '1') then
			as <= a;
			bs <= b;
		end if;
	end process;
	
--1 stage
ext1 <=input & "00000000";
ext2 <= "00000000" & input;
M0_i : mux21 generic map ( nbit + 8 ) port map(ext1,ext2,lr,m0);

ext3 <= input(23 downto 0) & "0000000000000000";
ext4 <= "0000000000000000" & input(31 downto 8);
M8_i : mux21 generic map ( nbit + 8 ) port map(ext3,ext4,lr,m1);

ext5 <= input(15 downto 0) & "000000000000000000000000";
ext6 <= "000000000000000000000000" & input(31 downto 16);
M16_i : mux21 generic map ( nbit + 8 ) port map(ext5,ext6,lr,m2);

ext7 <= input(7 downto 0) & "00000000000000000000000000000000";
ext8 <= "00000000000000000000000000000000" & input(31 downto 24);
M24_i : mux21 generic map ( nbit + 8 ) port map(ext7,ext8,lr,m3);

--2 stage
mux2 : mux41 generic map(nbit + 8) port map(m0,m1,m2,m3,sel(4 downto 3),gshift);
--3 stage
mux3l : mux81 generic map( nbit) port map (gshift(39 downto 8),gshift(38 downto 7),gshift(37 downto 6),gshift(36 downto 5),gshift(35 downto 4),gshift(34 downto 3),gshift(33 downto 2),gshift(32 downto 1),sel(2 downto 0),yl);
mux3r : mux81 generic map( nbit) port map (gshift(31 downto 0),gshift(32 downto 1),gshift(33 downto 2),gshift(34 downto 3),gshift(35 downto 4),gshift(36 downto 5),gshift(37 downto 6),gshift(38 downto 7),sel(2 downto 0),yr);
muxfinal : mux21 generic map(nbit) port map ( yl,yr,lr,output);
end structural;

