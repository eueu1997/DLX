library ieee;
use ieee.std_logic_1164.all;

entity alu_tb is
end alu_tb;

architecture tb of alu_tb is

    component ALU is 
	generic(
		operand_width	: integer	:=32;
		operation_type	: integer	:=5
		);

	port(
	
		alu_input1	:	in	std_logic_vector(operand_width -1 downto 0);
		alu_input2	:	in	std_logic_vector(operand_width -1 downto 0);
		
		ALU_type	:	in	std_logic_vector(2 downto 0);
		alu_output	:	out	std_logic_vector(operand_width -1 downto 0);
		co 			:   out std_logic
	);

    end component;

    constant nbit :integer :=  32; 
    signal ai1,ai2,ao : std_logic_vector(nbit - 1 downto 0 );
    signal at : std_logic_vector(2 downto 0);
    signal co : std_logic;

     
    begin

    uut : alu generic map (nbit,5) port map ( ai1,ai2,at,ao,co);

    ai1 <= "00000000000000000000000000011010"
    ai2 <= "00000000000000000000000000000010"
    at <= "000" , "010" after 100 ns , "001" after 200 ns, "111" after 300 ns , "110" after 400 ns , "101" after 500 ns , "100" after 600 ns;
