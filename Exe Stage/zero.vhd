library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic.arith.all;
use ieee.numeric_std.all;

entity zero is
	generic(
			operand_width	:	integer 	:=32
			operation_type	: 	integer		:=5
			);

	port(
		zero_input		:	in		std_logic_vector(operand_width -1 downto 0);
		opcode			: 	in		std_logic_vector(operation_type -1 downto 0);
		zero_output		:	out		std_logic
		);

end zero;

architecture behavioral of zero is

begin

process(zero_input, opcode)
begin

	zero_output <= '0';

	--beqz
	if opcode = "" then
		
		if zero_input = to_unsigned(0, 32) then
			zero_output = '1';
		end if;
	end if;

	--bneqz
	if opcode = "" then
		zero_output = '0';
		if zero_input /= to_unsigned(0, 32) then
			zero_output = '1';
		end if;
	end if;

	--j or jal
	if opcode = "" or opcode = "" then
		zero_output = '1';
	end if;
	

end process;

end behavioral;
