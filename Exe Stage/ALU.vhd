library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic.arith.all;
use ieee.numeric_std.all;

--I considered one signal for immediate. I am not sure whether I should have used another signal for immediate address in jump ins.


entity ALU is 
	generic(
		operand_width	: integer	:=32
		operation_type	: integer	:=5
		);

	port(
	
		alu_input1	:	in	std_logic_vector(operand_width -1 downto 0);
		alu_input2	:	in	std_logic_vector(operand_width -1 downto 0);
		
		ALU_type	:	in	std_logic_vector(operation_type -1 downto 0);
		alu_output	:	out	std_logic_vector(operation_width -1 downto 0)
		
	);

end ALU

architecture ALU_behavioral of ALU is

	signal alu_input1_int					:	signed(operand_width -1 downto 0);
	signal alu_input2_int					:	signed(operand_width -1 downto 0);
	signal alu_output_int1					:	signed(operand_width -1 downto 0);
	signal alu_output_int2					:	unsigned(operand_width -1 downto 0);


	
	
	
begin

	alu_input1_int <= alu_input1;
	alu_input2_int <= alu_input2;
	
	process(alu_input1,alu_input2, alu_type)
	begin
	
		--add
		if alu_type = "" then
			alu_output_int1		<= alu_input1_int + alu_input2_int;
			alu_output		<= std_logic_vector(alu_output_int1);
		end if;
		


		--or
		if alu_type = "" then
			alu_output_int2 	<= unsigned(alu_input1_int) or unsigned(alu_input2_int);
			alu_output	<= std_logic_vector(alu_output_int2);
		end if;


		--sge
		if alu_type = "" then
			alu_output_int1		<= to_signed(0, 32);
			alu_output		<= std_logic_vector(alu_output_int1);
			if (alu_input1_int >= alu_input2_int) then
				alu_output_int1 	<= to_signed(1, 32);
				alu_output			<= std_logic_vector(alu_output_int1);
			end if;
		end if;



		--sle
		if alu_type = "" then
			alu_output_int1		<= to_signed(0, 32);
			alu_output		<= std_logic_vector(alu_output_int1	);
			if (alu_input1_int <= alu_input2_int) then
				alu_output_int1 	<= to_signed(1, 32);
				alu_output			<= std_logic_vector(alu_output_int1);
			end if;
		end if;




		--//sll
		if alu_type = "" then
			alu_output_int2	<= shift_left(unsigned(alu_input1_int) ,to_integer(alu_input2_int));
			alu_output		<= std_logic_vector(alu_output_int2);
		end if;	



		--sne
		--sge
		if alu_type = "" then
			alu_output_int1		<= to_signed(0, 32);
			alu_output		<= std_logic_vector(alu_output_int1);
			if (alu_input1_int /= alu_input2_int) then
				alu_output_int1 	<= to_signed(1, 32);
				alu_output			<= std_logic_vector(alu_output_int1);
			end if;
		end if;



		--srl
		if alu_type = "" then
			alu_output_int2	<= shift_right(unsigned(alu_input1_int) ,to_integer(alu_input2_int));
			alu_output		<= std_logic_vector(alu_output_int2);
		end if;	



		--sub
		if alu_type = "" then
			alu_output_int1		<= alu_input1_int - alu_input2_int;
			alu_output		<= std_logic_vector(alu_output_int1);
		end if;

		--xor
		if alu_type = "" then
			alu_output_int2 	<= unsigned(alu_input1_int) xor unsigned(alu_input2_int);
			alu_output			<= std_logic_vector(alu_output_int2);
		end if;

		--and
		--or
		if alu_type = "" then
			alu_output_int2 	<= unsigned(alu_input1_int) and unsigned(alu_input2_int);
			alu_output			<= std_logic_vector(alu_output_int2);
		end if;

	end process;

end ALU_behavioral

