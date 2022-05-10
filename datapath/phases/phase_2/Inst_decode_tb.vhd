library ieee;
use ieee.std_logic_1164.all;
entity Inst_decode_tb is
    end Inst_decode_tb;

architecture tb of Inst_decode_tb is
component inst_decode is 
	generic (bit_data: integer := 32;
			 bit_add: integer := 5);
	port (-- ID Control Signals
		inst_type : in std_logic_vector (1 downto 0); -- instruction type
													  -- 01 I; 10 R; 11 J
       -- Datapath signal
       ir_s : in std_logic_vector(bit_data-1 downto 0);
	   RS1 : out std_logic_vector(bit_add-1 downto 0);
	   RD1 : out std_logic;
       RS2 : out std_logic_vector(bit_add-1 downto 0);
       RD2 : out std_logic;
	   RD : out std_logic_vector(bit_add-1 downto 0);
	   --WR : out std_logic;
	   IMM : out std_logic_vector(bit_data-1 downto 0);
	   RegA_LATCH_EN      : out std_logic;
       RegB_LATCH_EN      : out std_logic;
       RegIMM_LATCH_EN    : out std_logic);
end component;

constant bit_data : integer := 32;
constant bit_add : integer := 5;
signal inst_type : std_logic_vector (1 downto 0);
signal ir_s, WR_in, A_out, B_out, imm_out, IMM : std_logic_vector(bit_data-1 downto 0);
signal en : std_logic;
signal RS1, RS2, RD: std_logic_vector(bit_add-1 downto 0);
signal RD1, RD2, RegA_LATCH_EN, RegB_LATCH_EN, RegIMM_LATCH_EN: std_logic;


--I 01-- OP_CODE -- RS1 -- RD -- IMM
--		6			5	  5		16

--R 10-- OP_CODE -- RS1 -- RS2 -- RD -- FUNC
--		6			5	  5		5		11

--J 11-- OP_CODE -- IMM
--		6			26
begin
	U : inst_decode generic map (bit_data,bit_add)
			port map (inst_type, ir_s, RS1, RD1, RS2, RD2, RD, IMM, RegA_LATCH_EN, RegB_LATCH_EN, RegIMM_LATCH_EN);

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
