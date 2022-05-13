library ieee;
use ieee.std_logic_1164.all;
entity p2_tb is
    end p2_tb;

architecture tb of p2_tb is
component phase_2 is 
	generic (bit_data: integer := 32;
			 bit_add: integer := 5);
	port (--Control signal
		  inst_type: in std_logic_vector (1 downto 0);
		  RF_EN : in std_logic;
		  RF_RESET : in std_logic;
		  W_EN: in std_logic;	 -- not directly from cu during decode phase 
	      RegA_LATCH_EN      : in std_logic;  -- Register A Latch Enable
          RegB_LATCH_EN      : in std_logic;  -- Register B Latch Enable
          RegIMM_LATCH_EN    : in std_logic;  -- Immediate Register Latch
		  RegRD_ADD_EN		 : in std_logic;
		
		--input from phase 1
		  ir_s: in std_logic_vector(bit_data-1 downto 0);
		--input for write
		  data_write_in: in std_logic_vector(bit_data-1 downto 0);
		  reg_write_add: in std_logic_vector(bit_add-1 downto 0);

		--output                              
		  A_out: out std_logic_vector(bit_data-1 downto 0);
		  B_out: out std_logic_vector(bit_data-1 downto 0);
		  imm_out: out std_logic_vector(bit_data-1 downto 0);
		  RD_saved_out: out std_logic_vector(bit_add-1 downto 0)
          --jal : in std_logic;
		 );
end component;

constant bit_data : integer := 32;
constant bit_add : integer := 5;
signal inst_type : std_logic_vector (1 downto 0);
signal  RF_EN, RF_RESET, W_EN, RegA_LATCH_EN, RegB_LATCH_EN, RegIMM_LATCH_EN, RegRD_ADD_EN : std_logic;
signal ir_s : std_logic_vector (bit_data-1 downto 0);
signal data_write_in : std_logic_vector (bit_data-1 downto 0);
signal reg_write_add : std_logic_vector (bit_add-1 downto 0);

signal A_out, B_out, IMM_out : std_logic_vector (bit_data-1 downto 0);
signal rd_saved_out : std_logic_vector (bit_add-1 downto 0);


--I 01-- OP_CODE -- RS1 -- RD -- IMM
--		6			5	  5		16

--R 10-- OP_CODE -- RS1 -- RS2 -- RD -- FUNC
--		6			5	  5		5		11

--J 11-- OP_CODE -- IMM
--		6			26
begin
	U : phase_2 generic map (bit_data,bit_add)
			port map (--Control signal
		  inst_type,
		  RF_EN,
		  RF_RESET,
		  W_EN,
	      RegA_LATCH_EN,
          RegB_LATCH_EN,
          RegIMM_LATCH_EN,
		  RegRD_ADD_EN,
		--input from phase 1
		  ir_s,
		--input for write
		  data_write_in,
		  reg_write_add,
		--output                              
		  A_out,
		  B_out,
		  imm_out,
		  RD_saved_out
          --jal : in std_logic;
		 );

process
	begin
--enable reg_file
	RF_EN <= '1';
	RF_RESET <=  '0';

--fill registers 1 and 2
	W_EN <= '1';
	reg_write_add <= "00001";
	data_write_in <= "00000000"&"00000000"&"00000000"&"00000001";
wait for 2 ns;
	W_EN <= '1';
	reg_write_add <= "00010";
	data_write_in <= "00000000"&"00000000"&"00000000"&"00000010";
wait for 2 ns;
	W_EN <= '0';

-------Instructions

--add --10 --FUNC_CODE 0x20
--R[ regc ] <-- R[ rega ] + R[ regb ]
	inst_type <= "10";
	ir_s <= "000001"&"00001"&"00010"&"00011"&"00000010100";
wait for 2 ns;
	RegA_LATCH_EN <= '1';
    RegB_LATCH_EN <= '1';
    RegIMM_LATCH_EN <= '0';
    RegRD_ADD_EN <= '1';
		

wait for 50 ns;

--addi --01 --OP_CODE 0x08
--R[ regb ] <-- R[ rega ] + imm16
	inst_type <= "01";
	ir_s <= "001000"&"000001"&"00010"&"001000100010001";
wait for 2 ns;
	RegA_LATCH_EN <= '1';
    RegB_LATCH_EN <= '0';
    RegIMM_LATCH_EN <= '1';
    RegRD_ADD_EN <= '1';

wait for 50 ns;

--and --10 --FUNC_CODE 0x24
--R[regc] <-- R[rega] & R[regb]
	inst_type <= "10";
	ir_s <= "000001"&"00001"&"00010"&"00011"&"00000110000";
wait for 2 ns;
	RegA_LATCH_EN <= '1';
    RegB_LATCH_EN <= '1';
    RegIMM_LATCH_EN <= '0';
    RegRD_ADD_EN <= '1';

wait for 50 ns;

--beqz --01 --OP_CODE 0x04
--if(R[rega] == 0) PC <-- PC + imm16
	inst_type <= "01";
	ir_s <= "00100"&"000001"&"00010"&"0001000100010001";
wait for 2 ns;
	RegA_LATCH_EN <= '1';
    RegB_LATCH_EN <= '0';
    RegIMM_LATCH_EN <= '1';
    RegRD_ADD_EN <= '0';

wait for 50 ns;

--j --11 --OP_CODE 0x02
--PC <-- PC + imm16
	inst_type <= "11";
	ir_s <= "000010"& "00000000000000000000010000";
wait for 2 ns;
	RegA_LATCH_EN <= '0';
    RegB_LATCH_EN <= '0';
    RegIMM_LATCH_EN <= '1';
    RegRD_ADD_EN <= '0';

wait for 50 ns;
	end process;
end tb;

