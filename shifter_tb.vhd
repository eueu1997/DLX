library ieee;
use ieee.std_logic_1164.all;

entity shifter_tb is
end shifter_tb;

architecture tb of shifter_tb is

component shifter  is

	generic ( nbit : integer );
	port ( input : in std_logic_vector(nbit -1 downto 0);
			sel : in std_logic_vector(integer(log2(real(nbit))) - 1 downto 0);
			lr : in std_logic; 
			output : out std_logic_vector(nbit-1 downto 0));

end  component;

signal _s input;
 signal 	sel_s in;
 signal 	lr_s in;
 signal _s ;
 