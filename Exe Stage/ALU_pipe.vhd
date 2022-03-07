library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic.arith.all;
use work.mytypes.all;

entity ALU is 
	generic(
		operand_width	: integer	:=32
		operation_type	: integer	:=5
		)

	port(
	
		clock		:	in	: std_logic;
		enable2		: 	in  : std_logic;
		ALU_input	:	in	: std_logic_vector(operation_width -1 downto 0);
		ALU_output	:	out	: std_logic_vector(operation_width -1 downto 0)	
		);

end ALU

architecture ALU_behavioral of ALU is

	signal immediate	:	std_logic_vector(operand_width -1 downto 0);
	signal program_coutner	:	std_logic_vector(operand_width -1 downto 0);
	signal label_address	:	std_logic_vector(operand_width -1 downto 0);
	
begin

	process(clock)
	begin
	if rising_edge(clock) then

		if enable ='1' then
				
			ALU_output <= ALU_input;
	
		end if;
	end if;


	end if;
	end process;			
end ALU_behavioral
