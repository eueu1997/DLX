library ieee;
use ieee.std_logic_1164.all;

entity dec is 

	port ( opcode : in std_logic_vector(2 downto 0 );
		   add : out std_logic;
		   sub : out std_logic;
		   and_en : out std_logic;
		   or_en : out std_logic;
		   xor_en : out std_logic;
		   sl_en : out std_logic;
		   sr_en : out std_logic;
		   cmp : out std_logic);

end dec;

architecture dataflow of dec is

begin
 
add <= '1' when opcode = "000" else
	   '0';
sub <= '1' when opcode = "010" else
	 	'0';
and_en <= '1' when opcode = "001" else
	 	'0' ;
or_en <= '1' when opcode = "111" else 
	 	'0' ;
xor_en <= '1' when opcode = "110" else
	 	'0' ;
sl_en <= '1' when opcode = "101" else
	 	'0' ;
sr_en <= '1' when opcode = "100" else
	 	'0';
cmp <= '1' when opcode = "011" else
	 	'0' ;
end dataflow;
