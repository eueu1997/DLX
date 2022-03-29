library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

--I considered one signal for immediate. I am not sure whether I should have used another signal for immediate address in jump ins.

--
entity ALU is 
	generic(
		operand_width	: integer	:=32;
		operation_type	: integer	:=5
		);

	port(
	
		alu_input1	:	in	std_logic_vector(operand_width -1 downto 0);
		alu_input2	:	in	std_logic_vector(operand_width -1 downto 0);
		cin 		: 	in std_logic;
		ALU_type	:	in	std_logic_vector(0 to 3);
		alu_output	:	out	std_logic_vector(operand_width -1 downto 0);
		co 			:   out std_logic
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
			 en : in std_logic;
        	 Co: out std_logic);

end component ; 

component logic is 
	
	generic(nbit : integer);
	port( a : in std_logic_vector(nbit-1 downto 0);
		  b : in std_logic_vector(nbit-1 downto 0);
		  sel : in std_logic_vector(0 to 3);
		  en : in std_logic;
		  o : out std_logic_vector(nbit-1 downto 0));

end component;


component shifter is

	generic ( nbit : integer );
	port ( input : in std_logic_vector(nbit -1 downto 0);
			sel : in std_logic_vector(integer(log2(real(nbit)))-1 downto 0);
			lr : in std_logic; -- 0 per left, 1 per right
			en : in std_logic;
			output : out std_logic_vector(nbit-1 downto 0));

end component;




signal logic_en,add_en,shift_en,mul_en,tmp1,tmp2,lr,a_en,s_en : std_logic;
signal as_add,bs_add,as_mul,bs_mul,as_logic,bs_logic,as_shift,bs_shift,as_out,logic_out,s_out : std_logic_vector(31 downto 0);


begin
-- add  0000
-- and  0001  
-- sub  0010 beh work . struct non legge carri in
-- mul  0011 attualmente non implementata. 
-- sl   0100
-- sr   0101
-- xor  0110
-- or   0111 
-- nor  1000
-- xnor 1001
--      1010
-- cmp  1011 implementato tramite adder. se cout allora a>b. se zero allora a=b. 
--      1100
--      1101
-- nand 1110
--      1111

tmp1 <= not(a_en) and s_en; -- A + B' + 1 is logic function for add/sub
tmp2 <= tmp1 or cin;  -- il carry in del add sub viene or'ed con il segnale che va a 1 se cè sub

add_sub1 : add_sub generic map(32) port map(as_add,bs_add,tmp2,tmp1,as_out,add_en,co);
logic1 : logic generic map (32) port map ( as_logic  , bs_logic ,alu_type , logic_en, logic_out);
shifter1 : shifter generic map (32) port map( as_shift, bs_shift(4 downto 0) ,lr , shift_en,s_out);

mux : process (alu_input1,alu_input2,alu_type,as_out,logic_out,s_out)
begin
	case alu_type is
		when "0000" => 
			as_add <= alu_input1;
			bs_add <= alu_input2;
			add_en <= '1';
			a_en <= '1';
			s_en <= '0';
			mul_en <= '0';
			logic_en <= '0'; -- enabling solo del blocco, poi tramite  alu_type fa automaticamente funz logica
			shift_en <= '0';
			lr <='0' ; -- se 1 fa right, se 0 fa left
			alu_output <=  as_out;
		when "0010" => 
			as_add <= alu_input1;
			bs_add <= alu_input2;
			add_en <= '1';
			a_en <= '0';
			s_en <= '1';
			mul_en <= '0';
			logic_en <= '0';
			shift_en <= '0';
			lr <='0' ;
			alu_output <=  as_out;
		when "0001" | "0110" | "0111" | "1000" | "1001" | "1110" => 
			as_logic <= alu_input1;
			bs_logic <= alu_input2;
			add_en <= '0';
			a_en <= '0';
			s_en <= '0';
			mul_en <= '0';
			logic_en <= '1';
			shift_en <= '0';
			lr <='0' ;
			alu_output <=  logic_out;
		when "0011" => 
			as_mul <= alu_input1;
			bs_mul <= alu_input2;
			add_en <= '0';
			a_en <= '0';
			s_en <= '0';
			mul_en <= '1';
			logic_en <= '0';
			shift_en <= '0';
			lr <='0' ;
			alu_output <=  "00000000000000000000000000000000"; -- verra sostituito dal output del mul
		when "0100" => 
			as_shift <= alu_input1;
			bs_shift <= alu_input2;
			add_en <= '0';
			a_en <= '0';
			s_en <= '0';
			mul_en <= '0';
			logic_en <= '0';
			shift_en <= '1';
			lr <='0' ;
			alu_output <=  s_out;
		when "0101" => 
			as_shift <= alu_input1;
			bs_shift <= alu_input2;
			add_en <= '0';
			a_en <= '0';
			s_en <= '0';
			mul_en <= '0';
			logic_en <= '0';
			shift_en <= '1';
			lr <='1' ;
			alu_output <=  s_out;
		when "1011" => -- when compare perform an sub and get cout and zero in outer block
			as_add <= alu_input1;
			bs_add <= alu_input2;
			add_en <= '1';
			a_en <= '0';
			s_en <= '1';
			mul_en <= '0';
			logic_en <= '0';
			shift_en <= '0';
			lr <='0' ;
			alu_output <=  as_out;
		when others =>
			add_en <= '0';
			a_en <= '0';
			s_en <= '0';
			mul_en <= '0';
			logic_en <= '0';
			shift_en <= '0';
			lr <='0' ;
			
	end case;
	end process;				  
end structural;

