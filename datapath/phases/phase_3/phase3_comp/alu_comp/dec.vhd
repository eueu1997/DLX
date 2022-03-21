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

add <= '1' when opcode = "000";
	 	'0' when others
sub <= '1' when opcode = "010";
	 	'0' when others
and_en <= '1' when opcode = "001";
	 	'0' when others
or_en <= '1' when opcode = "111";
	 	'0' when others
xor_en <= '1' when opcode = "110";
	 	'0' when others
sl_en <= '1' when opcode = "101";
	 	'0' when others
sr_en <= '1' when opcode = "100";
	 	'0' when others
cmp <= '1' when opcode = "011";
	 	'0' when others
end dataflow;
