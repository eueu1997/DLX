library ieee;
use ieee.std_logic_1164.all;
entity p2tb is
    end p2tb;

architecture tb of p2tb is
component p2 is 
	generic (bit_data: integer := 32;
			 bit_add: integer := 5);
	port (--Control signal
		  inst_type: in std_logic_vector (1 downto 0);
		  RF_EN : in std_logic;
		  RF_RESET : in std_logic;
		  W_EN: in std_logic;	 -- not directly from cu during decode phase 
	      reg_en : in std_logic;
		
		--input from phase 1
		  ir_s: in std_logic_vector(bit_data-1 downto 0);
		--input for write
		  data_write_in: in std_logic_vector(bit_data-1 downto 0);
		  reg_write_add: in std_logic_vector(bit_add-1 downto 0);
		--npc input
		  npc_in : in std_logic_vector(bit_data-1 downto 0);
		--output  
		  npc_out : out std_logic_vector(bit_data-1 downto 0);  
		--output                              
		  A_out: out std_logic_vector(bit_data-1 downto 0);
		  B_out: out std_logic_vector(bit_data-1 downto 0);
		  imm_out: out std_logic_vector(bit_data-1 downto 0);
		  RD_saved_out: out std_logic_vector(bit_add-1 downto 0);
		-- setter
		  set : in std_logic;
		-- jal signal to save npc on r31
          jal : in std_logic
		 );
end component;

constant bit_data : integer := 32;
constant bit_add : integer := 5;
signal inst_type : std_logic_vector (1 downto 0);
signal  RF_EN, RF_RESET, W_EN, reg_en,jal,set: std_logic;
signal ir_s : std_logic_vector (bit_data-1 downto 0);
signal data_write_in : std_logic_vector (bit_data-1 downto 0);
signal reg_write_add : std_logic_vector (bit_add-1 downto 0);

signal A_out, B_out, IMM_out , npc_in,npc_out : std_logic_vector (bit_data-1 downto 0);
signal rd_saved_out : std_logic_vector (bit_add-1 downto 0);


--I 01-- OP_CODE -- RS1 -- RD -- IMM
--		6			5	  5		16

--R 10-- OP_CODE -- RS1 -- RS2 -- RD -- FUNC
--		6			5	  5		5		11

--J 11-- OP_CODE -- IMM
--		6			26
begin
	U : p2 generic map (bit_data,bit_add)
			port map (--Control signal
		  inst_type,
		  RF_EN,
		  RF_RESET,
		  W_EN,
	      reg_en,
		--input from phase 1
		  ir_s,
		--input for write
		  data_write_in,
		  reg_write_add,
		  npc_in,
		  npc_out,
		--output                              
		  A_out,
		  B_out,
		  imm_out,
		  RD_saved_out,
          set,
			jal
		 );

process
	begin
--enable reg_file
	RF_EN <= '1';
	RF_RESET <=  '0';
	reg_en<='0';
--fill registers 1 and 2
	W_EN <= '1';
	reg_write_add <= "00001";
	data_write_in <= "00000000"&"00000000"&"00000000"&"11000001";
wait for 2 ns;
	W_EN <= '1';
	reg_write_add <= "00010";
	data_write_in <= "00000000"&"00000000"&"00000000"&"00100110";
wait for 2 ns;
	W_EN <= '0';

-------Instructions

--add --10 --FUNC_CODE 0x20
--R[ regc ] <-- R[ rega ] + R[ regb ]
	inst_type <= "10";
	ir_s <= "000001"&"00001"&"00010"&"00011"&"00000010100";
wait for 2 ns;
	reg_en<='1';
wait for 0 ns;
	reg_en<= '0';
		

wait for 50 ns;

--addi --01 --OP_CODE 0x08
--R[ regb ] <-- R[ rega ] + imm16
	inst_type <= "01";
	ir_s <= "001000"&"00001"&"00010"&"0001000100010001";
wait for 2 ns;
	reg_en<='1';
wait for 2 ns ;
	reg_en <='0';

wait for 50 ns;

--and --10 --FUNC_CODE 0x24
--R[regc] <-- R[rega] & R[regb]
	inst_type <= "10";
	ir_s <= "000001"&"00001"&"00010"&"00011"&"00000110000";
wait for 2 ns;
	reg_en<='1';
wait for 2 ns ;
	reg_en <='0';


wait for 50 ns;

--beqz --01 --OP_CODE 0x04
--if(R[rega] == 0) PC <-- PC + imm16
	inst_type <= "01";
	ir_s <= "00100"&"000001"&"00010"&"0001000100010001";
wait for 2 ns;
	reg_en<='1';
wait for 2 ns ;
	reg_en <='0';

wait for 50 ns;

--j --11 --OP_CODE 0x02
--PC <-- PC + imm16
	inst_type <= "11";
	ir_s <= "000010"& "00000000000000000000010000";
wait for 2 ns;
	reg_en<='1';
wait for 2 ns ;
	reg_en <='0';

wait for 50 ns;
jal<= '1';
npc_in<= "00001010101001010000101010100101";
wait for 2 ns;
jal<='0';

--and --10 --FUNC_CODE 0x24
--R[regc] <-- R[rega] & R[regb]
	inst_type <= "10";
	ir_s <= "000001"&"11111"&"00001"&"00011"&"00000110000";
wait for 2 ns;
	reg_en<='1';
wait for 2 ns ;
	reg_en <='0';
wait for 50 ns;
	inst_type <= "10";
	ir_s <= "000001"&"00010"&"00001"&"00011"&"00000110000";
wait for 2 ns;
	reg_en<='1';
wait for 2 ns ;
	reg_en <='0';
wait for 50 ns;
	inst_type <= "10";
	ir_s <= "000001"&"00011"&"00001"&"00011"&"00000110000";
wait for 2 ns;
	reg_en<='1';
wait for 2 ns ;
	reg_en <='0';
wait;
end process;
end tb;

