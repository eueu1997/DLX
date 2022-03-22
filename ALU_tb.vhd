library ieee;
use ieee.std_logic_1164.all;

entity ALU is
 end ALU;

architecture tb of ALUis

component  ALU is 
	generic(
		operand_width	: integer	:=32;
		operation_type	: integer	:=5
		);

	port(
	
		alu_input1	:	in	std_logic_vector(operand_width -1 downto 0);
		alu_input2	:	in	std_logic_vector(operand_width -1 downto 0);
		
		ALU_type	:	in	std_logic_vector(2 downto 0);
		alu_output	:	out	std_logic_vector(operand_width -1 downto 0);
		co 			: out std_logic
	);

end ALU;



architecture structural of ALU is


component add_sub is 
	
	generic ( nbit : integer );
	port 	(A: in std_logic_vector(NBIT-1 downto 0);
       		 B: in std_logic_vector(NBIT-1 downto 0);
       		 Cin: in std_logic;
			 as : in std_logic;
        	 S: out std_logic_vector(NBIT-1 downto 0);
        	 Co: out std_logic);

end component ; 

component logic is 
	
	generic(nbit : integer);
	port( a : in std_logic_vector(nbit-1 downto 0);
		  b : in std_logic_vector(nbit-1 downto 0);
		  sel : in std_logic_vector(3 downto 0);
		  o : out std_logic_vector(nbit-1 downto 0));

end component;


component shifter is

	generic ( nbit : integer );
	port ( input : std_logic_vector(nbit -1 downto 0);
			sel : std_logic_vector(integer(log2(real(nbit)))-1 downto 0);
			lr : std_logic; -- 0 per left, 1 per right
			output : std_logic_vector(nbit-1 downto 0));

end component;

component register_1 is

	generic ( n_bit : integer);
	port (d_in : in std_logic_vector(n_bit-1 downto 0);
		  d_out : out std_logic_vector(n_bit-1 downto 0);
		  en : in std_logic);

end component;


component dec is 
		
	port ( opcode : in std_logic_vector(2 downto 0 );
		   add : out std_logic;
		   sub : out std_logic;
		   and_en : out std_logic;
		   or_en : out std_logic;
		   xor_en : out std_logic;
		   sl_en : out std_logic;
		   sr_en : out std_logic;
		   cmp : out std_logic);

end component;

component MUX41 is
	Generic (NBIT: integer );
	Port (	A:	In	std_logic_vector(NBIT-1 downto 0) ;
		B:	In	std_logic_vector(NBIT-1 downto 0);
		C:	In	std_logic_vector(NBIT-1 downto 0);
		D:	In	std_logic_vector(NBIT-1 downto 0);
		SEL:In	std_logic_vector(1 downto 0);
		Y:	Out	std_logic_vector(NBIT-1 downto 0));
end component;

component or_1 is
	
	port ( x: in std_logic;
		   y: in std_logic;
		   z: out std_logic);
end component;

component final_mux_sel is
	
	port ( a : in std_logic_vector(2 downto 0);
			sel : out std_logic_vector(1 downto 0));

end component;

signal a_en,s_en,and_en,or_en,xor_en,sl_en,sr_en,cmp,a_or_s,logic_en,tmp1,shift_en : std_logic;
signal as_add,bs_add,as_logic,bs_logic,as_shift,bs_shift,as_out,logic_out,s_out : std_logic_vector(31 downto 0);
signal fm_sel : std_logic_vector(1 downto 0);
begin
aors : 		or_1 port map ( a_en,s_en,a_or_s);
and_or_or : or_1 port map ( and_en , or_en , tmp1);
andor_or_xor : or_1 port map ( tmp1 , xor_en , logic_en); --and_en or or_en or xor_en per logic_reg
shift_enable : or_1 port map ( sr_en , sl_en,shift_en);

reg_en_dec : dec port map(alu_type,a_en,s_en,and_en,or_en,xor_en,sl_en,sr_en,cmp);

as_reg_a :	  register_1 generic map(32) port map ( alu_input1,  as_add, a_or_s);
as_reg_b : 	  register_1 generic map(32) port map ( alu_input2,  bs_add, a_or_s);
logic_reg_a : register_1  generic map(32) port map ( alu_input1 ,  as_logic,logic_en);
logic_reg_b : register_1  generic map(32) port map ( alu_input2,  bs_logic,logic_en);
s_reg_a : 	  register_1  generic map(32) port map ( alu_input1, as_shift,shift_en);
s_reg_b : 	  register_1  generic map(32) port map ( alu_input2, bs_shift,shift_en);

add_sub1 : add_sub generic map(32) port map(as_add,bs_add,'0',s_en,as_out,co);
logic1 : logic generic map (32) port map ( a => as_logic  ,b => bs_logic ,sel(3) => '0',sel(2 downto 0) => alu_type,o => logic_out);
shifter1 : shifter generic map (32) port map( as_shift, bs_shift(integer(log2(real(32))) -1  downto 0) , sr_en,s_out);
fms : final_mux_sel port map ( alu_type,fm_sel);

final_mux : mux41 generic map (32) port map(as_out,logic_out,s_out,"00000000000000000000000000000000",fm_sel, alu_output); -- karnough 

end structural;

configuration cfg_alu_str of alu is
for structural
end for;
end configuration;
 component;