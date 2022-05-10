library ieee;
use ieee.std_logic_1164.all;
entity r_fetch_tb is
    end r_fetch_tb;

architecture tb of r_fetch_tb is
component reg_fetch is 
  generic (bit_data: integer := 32;
           bit_add: integer := 5);
  port(-- ID Control Signals
	   --CLK : in std_logic;
	   -- Datapath signal
       		--input from decode
       RegA_LATCH_EN      : in std_logic;  -- Register A Latch Enable
       RegB_LATCH_EN      : in std_logic;  -- Register B Latch Enable
       RegIMM_LATCH_EN    : in std_logic;  -- Immediate Register Latch Enable
	   RS1 : in std_logic_vector(bit_add-1 downto 0);
	   RD1 : in std_logic;
       RS2 : in std_logic_vector(bit_add-1 downto 0);
       RD2 : in std_logic;
	   RD : in std_logic_vector(bit_add-1 downto 0);
	   WR : in std_logic;
	   IMM : in std_logic_vector(bit_data-1 downto 0);
			--external input
	   WR_in : in std_logic_vector(bit_data-1 downto 0);
			--output
       A_out : out std_logic_vector(bit_data-1 downto 0);
       B_out : out std_logic_vector(bit_data-1 downto 0);
       imm_out : out std_logic_vector(bit_data-1 downto 0)
      );
end component;

constant bit_data : integer := 32;
constant bit_add : integer := 5;

signal RegA_LATCH_EN, RegB_LATCH_EN, RegIMM_LATCH_EN, RD1, RD2, WR: std_logic;
signal RS1, RS2, RD: std_logic_vector(bit_add-1 downto 0);
signal IMM, WR_in, A_out, B_out, imm_out: std_logic_vector(bit_data-1 downto 0);


--I 01-- OP_CODE -- RS1 -- RD -- IMM
--		6			5	  5		16

--R 10-- OP_CODE -- RS1 -- RS2 -- RD -- FUNC
--		6			5	  5		5		11

--J 11-- OP_CODE -- IMM
--		6			26
begin
	U : reg_fetch generic map (bit_data,bit_add)
			port map (RegA_LATCH_EN, RegB_LATCH_EN, RegIMM_LATCH_EN, RS1, RD1, RS2, RD2, RD, WR, IMM, WR_in, A_out, B_out, imm_out);

process
	begin

--add --10 --FUNC_CODE 0x20
--R[ regc ] <-- R[ rega ] + R[ regb ]
--	inst_type <= "10";
--	ir_s <= "000001"&"00001"&"00010"&"00011"&"00000010100";
RegA_LATCH_EN <= '1';
RegB_LATCH_EN <= '1';
RegIMM_LATCH_EN <= '0';
RS1 <= "00001";
RD1 <= '1';
RS2 <= "00010";
RD2 <= '1';
RD <= "00011";
WR <= '0';

wait for 100 ns;

--addi --01 --OP_CODE 0x08
--R[ regb ] <-- R[ rega ] + imm16
--	inst_type <= "01";
--	ir_s <= "001000"&"000001"&"00010"&"001000100010001";

RegA_LATCH_EN <= '1';
RegB_LATCH_EN <= '1';
RegIMM_LATCH_EN <= '0';
RS1 <= "00001";
RD1 <= '1';
RD2 <= '0';
RD <= "00010";
WR <= '0';
IMM <= "00000000000000000"&"001000100010001";
wait for 100 ns;

	end process;
end tb;
