library ieee;
use ieee.std_logic_1164.all;

entity phase3 is 

	generic ( nbit : integer);
	port( npc : in std_logic_vector(nbit-1 downto 0);
		 a : in std_logic_vector(nbit-1 downto 0);
		 b : in std_logic_vector(nbit-1 downto 0);
		 imm : in std_logic_vector(nbit -1 downto 0);
		 npc_or_a : in std_logic;
		 b_or_imm : in std_logic;
		 alu_type : in std_logic_vector(2 downto 0);
		 c_out : out std_logic;
		 branch_or_comp : in std_logic;
		 cond: out std_logic_vector(0 downto 0);
		 alu_out : out std_logic_vector(nbit-1 downto 0);
		 cond_en : in std_logic;
		 alu_out_en : in std_logic);



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
		
		ALU_type	:	in	std_logic_vector(2 downto 0);
		alu_output	:	out	std_logic_vector(operand_width -1 downto 0);
		co 			: out std_logic	);

end component;

component register_1 is

	generic ( n_bit : integer);
	port (d_in : in std_logic_vector(n_bit-1 downto 0);
		  d_out : out std_logic_vector(n_bit-1 downto 0);
		  en : in std_logic);

end component;

component zero is
	generic(
			nbit	:	integer 	:=32
			);

	port(
		zero_input		:	in		std_logic_vector(nbit -1 downto 0);
		opcode			: 	in		std_logic; -- 0 for beq, 1 for bneq
		zero_output		:	out		std_logic_vector(0 downto 0)
		);

end component;

signal alu_1,alu_2,alu_outs,zero_in : std_logic_vector(nbit - 1 downto 0);
signal zero_out : std_logic_vector(0 downto 0);

begin 

muxA : mux21 generic map (nbit) port map ( npc,a,npc_or_a,alu_1);
muxB : mux21 generic map (nbit) port map ( b,imm ,b_or_imm,alu_2);
muxBranchOrComp : mux21 generic map (nbit) port map ( a,alu_outs,branch_or_comp,zero_in);

zero_reg : register_1 generic map ( 1) port map (zero_out,cond,cond_en);
alu_reg  : register_1 generic map (nbit ) port map (alu_outs,alu_out,alu_out_en);


alu1 : alu generic map ( 32,3) port map (alu_1,alu_2,alu_type,alu_out,c_out);

zero1 : zero port map ( zero_in,'0',zero_out);
end structural;


 
