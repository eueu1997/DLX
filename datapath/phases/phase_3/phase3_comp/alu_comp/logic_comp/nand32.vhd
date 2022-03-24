library ieee;
use ieee.std_logic_1164.all;

entity nand32 is

	port(a : in std_logic_vector(31 downto 0);
		 b : in std_logic_vector(31 downto 0);
		 sel : in std_logic;
		 out32 : out std_logic_vector(31 downto 0));
	
	end nand32;

architecture structural of nand32 is
begin
process(a,b,sel)
begin
case sel is
when '1' => out32 <= a nand b;
when others => out32 <="11111111111111111111111111111111";
end case;
end process;
end structural;

