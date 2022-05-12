library ieee;
use ieee.std_logic_1164.all;
-------------------------------BEHAVIOR-------------------
-- in the ALU can go as INPUT: -- NPC : in case of jump or branch, to add the NPC to the offset
							   -- A   : in case of register operation 
							   -- B   : in case of register operation
							   -- IMM : in case of register-immediate operation or in case of jump or branch ( it contains the offset of 16(branch) or 26(jump) bit in this case)
-- in case of normal aritmetich operation , the output is given as output
-- in case of branch operation(beqz bnez) , the output is the npc+imm16 ( the new NPC in case ) and the A input is checked if it is zero(as condition) ( b r1,imm)
-- in case of comparision operation(sg sb), the output of a SUB( used to perform the comparison) is not needed as aoutput, we to check if it =0 ( the two operand are equal), if != 0 we see the cout to undestand if a>b or a<b ( send the 2 signal  in CU)
entity phase3 is 

	generic ( nbit : integer);
	port( npc : in std_logic_vector(nbit-1 downto 0);
		 a : in std_logic_vector(nbit-1 downto 0);
		 b : in std_logic_vector(nbit-1 downto 0);
		 imm : in std_logic_vector(nbit -1 downto 0);

		 npc_or_a : in std_logic; -- '0' for npc
		 b_or_imm : in std_logic; -- '0' for b
		 branch_or_comp : in std_logic; -- branching means we get a, comparing means we need the result of a+b so we can check if it is zero to say that are equalt
		 be : in std_logic; -- 0 be , 1 bne
		 alu_type : in std_logic_vector(3 downto 0);
		 alu_en : in std_logic;
		 c_out : out std_logic;
		 cin : in std_logic;
		 -- output of the condition
		 cond: out std_logic;
		 -- aoutput of the block
		 alu_out : out std_logic_vector(nbit-1 downto 0);
		 -- register output enable
		 en : in std_logic);



end phase3;

architecture structural of phase3 is 

component MUX21 is
	Generic (NBIT: integer);
	Port (	A:	In	std_logic_vector(NBIT-1 downto 0) ;
		B:	In	std_logic_vector(NBIT-1 downto 0);
		SEL:	In	std_logic;
		Y:	Out	std_logic_vector(NBIT-1 downto 0));
end component;

component ALU is 
	generic(
		operand_width	: integer	:=32;
		operation_type	: integer	:=5
		);

	port(
	
		alu_input1	:	in	std_logic_vector(operand_width -1 downto 0);
		alu_input2	:	in	std_logic_vector(operand_width -1 downto 0);
		cin 		: 	in std_logic;
		alu_en		:   in std_logic;
		ALU_type	:	in	std_logic_vector(0 to 3);
		alu_output	:	out	std_logic_vector(operand_width -1 downto 0);
		co 			:   out std_logic
	);
end component;

component register_1 is

	generic ( n_bit : integer);
	port (d_in : in std_logic_vector(n_bit-1 downto 0);
		  d_out : out std_logic_vector(n_bit-1 downto 0);
		  en : in std_logic);

end component;

component zero is
	generic(nbit	:	integer 	:=32);

	port(
		x		:	in		std_logic_vector(nbit -1 downto 0);
		opcode	: 	in		std_logic; -- 0 for beq, 1 for bneq
		z		:	out		std_logic);

end component;

signal alu_1,alu_2,alu_outs,zero_in : std_logic_vector(nbit - 1 downto 0);
signal zero_out,c_outs : std_logic;

begin 
-- muxes
muxA : mux21 generic map (nbit) port map ( npc,a,npc_or_a,alu_1);
muxB : mux21 generic map (nbit) port map ( b,imm ,b_or_imm,alu_2);
muxBranchOrComp : mux21 generic map (nbit) port map ( a,alu_outs,branch_or_comp,zero_in);
-- edge registers
zero_reg : process(zero_out,en,c_outs)
begin
if(en = '1') then
cond<=zero_out;
c_out<=c_outs;
end if;
end process;

--zero_reg : register_1 generic map ( 1) port map (zero_out,cond,cond_en);
alu_reg  : register_1 generic map (nbit ) port map (alu_outs,alu_out,en);
--ALU
alu1 : alu generic map ( 32,4) port map (alu_1,alu_2,cin,alu_en,alu_type,alu_outs,c_outs);
-- zero check block
zero1 : zero port map ( zero_in,be,zero_out);
end structural;

 
