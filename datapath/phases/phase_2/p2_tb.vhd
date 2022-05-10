library ieee;
use ieee.std_logic_1164.all;
entity p2_tb is
    end p2_tb;

architecture tb of p2_tb is
component phase_2 is 
	generic (bit_data: integer := 32;
			 bit_add: integer := 5);
	port (inst_type: in std_logic_vector (1 downto 0);
		  ir_s: in std_logic_vector(bit_data-1 downto 0);
		  WR_in: in std_logic_vector(bit_data-1 downto 0);
		  en : in std_logic;                              
		  A_out: out std_logic_vector(bit_data-1 downto 0);
		  B_out: out std_logic_vector(bit_data-1 downto 0);
		  imm_out: out std_logic_vector(bit_data-1 downto 0)
		 );
end component;

constant bit_data : integer := 32;
constant bit_add : integer := 5;
signal inst_type : std_logic_vector (1 downto 0);
signal ir_s, WR_in, A_out, B_out, imm_out : std_logic_vector(bit_data-1 downto 0);
signal en : std_logic;


--I 01-- OP_CODE -- RS1 -- RD -- IMM
--		6			5	  5		16

--R 10-- OP_CODE -- RS1 -- RS2 -- RD -- FUNC
--		6			5	  5		5		11

--J 11-- OP_CODE -- IMM
--		6			26
begin
	U : phase_2 generic map (bit_data,bit_add)
			port map (inst_type,ir_s,WR_in,en,A_out,B_out,imm_out);

process
	begin
	en <= '1';


--add --10 --FUNC_CODE 0x20
--R[ regc ] <-- R[ rega ] + R[ regb ]
	inst_type <= "10";
	ir_s <= "000001"&"00001"&"00010"&"00011"&"00000010100";
wait for 100 ns;

--addi --01 --OP_CODE 0x08
--R[ regb ] <-- R[ rega ] + imm16
	inst_type <= "01";
	ir_s <= "001000"&"000001"&"00010"&"001000100010001";
wait for 100 ns;

--and --10 --FUNC_CODE 0x24
--R[regc] <-- R[rega] & R[regb]
	inst_type <= "10";
	ir_s <= "000001"&"00001"&"00010"&"00011"&"00000110000";
wait for 100 ns;

--beqz --01 --OP_CODE 0x04
--if(R[rega] == 0) PC <-- PC + imm16
	inst_type <= "01";
	ir_s <= "00100"&"000001"&"00010"&"0001000100010001";
wait for 100 ns;

--j --11 --OP_CODE 0x02
--PC <-- PC + imm16
	inst_type <= "11";
	ir_s <= "000010"& "00000000000000000000010000";
wait for 20 ns;
	end process;
end tb;

