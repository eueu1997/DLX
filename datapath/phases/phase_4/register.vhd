library IEEE;
use IEEE.std_logic_1164.all;

entity register_1 is

	generic ( n_bit : integer);
	port (d_in : in std_logic_vector(n_bit-1 downto 0);
		  d_out : out std_logic_vector(n_bit-1 downto 0);
		  en : in std_logic);

end register_1;

architecture beh of register_1 is

 	begin
	
	d_out <= d_in when en = '1';
 	

end beh;
