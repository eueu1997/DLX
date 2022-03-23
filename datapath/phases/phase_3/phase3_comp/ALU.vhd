library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

--I considered one signal for immediate. I am not sure whether I should have used another signal for immediate address in jump ins.


entity ALU is 
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
	port ( input : in std_logic_vector(nbit -1 downto 0);
			sel : in std_logic_vector(integer(log2(real(nbit)))-1 downto 0);
			lr : in std_logic; -- 0 per left, 1 per right
			output : out std_logic_vector(nbit-1 downto 0));

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
-- TODO ACTUALLY IS NOT IMPLEMENTING COMPARING
signal a_en,s_en,and_en,or_en,xor_en,sl_en,sr_en,cmp,a_or_s,logic_en,tmp1,tmp2,shift_en : std_logic;
signal as_add,bs_add,as_logic,bs_logic,as_shift,bs_shift,as_out,logic_out,s_out : std_logic_vector(31 downto 0);
signal fm_sel : std_logic_vector(1 downto 0);

begin
-- add 000
-- sub 010 26-2 = 23 non carica il crry in. il problema è in add_sub
-- and 001 wrong
-- or 111 xxxxx
-- xor 110 xxxx
-- sl 101 corretto
-- sr 100 corrett
--cmp 011

tmp2 <= not(a_en) and s_en; -- A + B' + 1 is logic function for add/sub
add_sub1 : add_sub generic map(32) port map(as_add,bs_add,tmp2,tmp2,as_out,co);

logic1 : logic generic map (32) port map ( a => as_logic  ,b => bs_logic ,sel(3) => '0',sel(2 downto 0) => alu_type,o => logic_out);
shifter1 : shifter generic map (32) port map( as_shift, bs_shift(4 downto 0) , sr_en,s_out);
fms : final_mux_sel port map ( alu_type,fm_sel);

final_mux : mux41 generic map (32) port map(as_out,logic_out,s_out,"00000000000000000000000000000000",fm_sel, alu_output); -- karnough 

mux : process (alu_input1,alu_input2,alu_type)
begin
	case alu_type is
		when "000" => 
			as_add <= alu_input1;
			bs_add <= alu_input2;
			a_en <= '1';
			s_en <= '0';
			and_en <= '0';
			or_en <= '0';
			xor_en <= '0';
			sr_en <='0' ;
			cmp <= '0';
		when "010" => 
			as_add <= alu_input1;
			bs_add <= alu_input2;
			a_en <= '0';
			s_en <= '1';
			and_en <= '0';
			or_en <= '0';
			xor_en <= '0';
			sr_en <='0' ;
			cmp <= '0';
		when "001" => 
			as_logic <= alu_input1;
			bs_logic <= alu_input2;
			a_en <= '0';
			s_en <= '0';
			and_en <= '1';
			or_en <= '0';
			xor_en <= '0';
			sr_en <='0' ;
			cmp <= '0';
		when "111" => 
			as_logic <= alu_input1;
			bs_logic <= alu_input2;
			a_en <= '0';
			s_en <= '0';
			and_en <= '0';
			or_en <= '1';
			xor_en <= '0';
			sr_en <='0' ;
			cmp <= '0';
		when "110" => 
			as_logic <= alu_input1;
			bs_logic <= alu_input2;
			a_en <= '0';
			s_en <= '0';
			and_en <= '0';
			or_en <= '0';
			xor_en <= '1';
			sr_en <='0' ;
			cmp <= '0';
		when "101" => 
			as_shift <= alu_input1;
			bs_shift <= alu_input2;
			a_en <= '0';
			s_en <= '0';
			and_en <= '0';
			or_en <= '0';
			xor_en <= '0';
			sr_en <='0' ;
			cmp <= '0';
		when "100" => 
			as_shift <= alu_input1;
			bs_shift <= alu_input2;
			a_en <= '0';
			s_en <= '0';
			and_en <= '0';
			or_en <= '0';
			xor_en <= '0';
			sr_en <='1' ;
			cmp <= '0';	
		when others =>
			
	end case;
	end process;				  
end structural;

