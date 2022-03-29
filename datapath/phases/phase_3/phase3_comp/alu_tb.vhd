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
		cin         :   in std_logic;
		ALU_type	:	in	std_logic_vector(0 to 3);
		alu_output	:	out	std_logic_vector(operand_width -1 downto 0);
		co 			:   out std_logic
	);

    end component;

    constant nbit :integer :=  32; 
    signal ai1,ai2,ao : std_logic_vector(nbit - 1 downto 0 );
    signal at : std_logic_vector(0 to 3);
    signal co,cin : std_logic;

     
    begin

    uut : alu generic map (nbit,5) port map ( ai1,ai2,cin,at,ao,co);
	cin <= '0';
    ai1 <= "00000000000000000000000000011010";
    ai2 <= "00000000000000000000000000000010";
    at <= "0000" , "0001" after 100 ns , "0010" after 200 ns, "0011" after 300 ns , "0100" after 400 ns , "0101" after 500 ns , "0110" after 600 ns, "0111" after 700 ns, "1000" after 800 ns, "1001" after 900 ns, "1010" after 1000 ns,"1011" after 1100 ns , "1100" after 1200 ns, "1101" after 1300 ns, "1110" after 1400 ns, "1111" after 1500 ns ;
end architecture;
