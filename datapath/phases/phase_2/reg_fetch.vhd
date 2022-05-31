library IEEE;
use IEEE.std_logic_1164.all;
use WORK.constants.all;

entity reg_fetch is
  generic (bit_data: integer := 32;
           bit_add: integer := 5);
  port(--Control Signals (sub CW)
		RF_en : in std_logic;
	   RF_RESET: in std_logic;
	   W_EN	: in std_logic;
	   RegA_LATCH_EN      : in std_logic;  -- Register A Latch Enable
       RegB_LATCH_EN      : in std_logic;  -- Register B Latch Enable
       RegIMM_LATCH_EN    : in std_logic;  -- Immediate Register Latch Enable
	   RegRD_ADD_EN	: in std_logic;
	   --cw_reg_fetch : in std_logic_vector (6 downto 0);

	   -- Input signal from instruction decode phase
	   reg_read_add_1 : in std_logic_vector(bit_add-1 downto 0);
	   reg_read_EN_1 : in std_logic;
       reg_read_add_2: in std_logic_vector(bit_add-1 downto 0);
       reg_read_EN_2 : in std_logic;
	   reg_write_save_add : in std_logic_vector(bit_add-1 downto 0);
	   IMM : in std_logic_vector(bit_data-1 downto 0);
			--external input
	   data_write_in : in std_logic_vector(bit_data-1 downto 0);
	   reg_write_add : in std_logic_vector(bit_add-1 downto 0);
			--output
       A_out : out std_logic_vector(bit_data-1 downto 0);
       B_out : out std_logic_vector(bit_data-1 downto 0);
       imm_out : out std_logic_vector(bit_data-1 downto 0);
	   rd_saved_out : out std_logic_vector(bit_add-1 downto 0)
      );
end reg_fetch;

architecture structural of reg_fetch is

  component register_file 
    generic(bit_add : integer := 5;
            bit_data : integer := 32);
    port(
     RESET: 	IN std_logic;
	 ENABLE: 	IN std_logic;
	 RD1: 		IN std_logic;
	 RD2: 		IN std_logic;
	 WR: 		IN std_logic;
	 ADD_WR: 	IN std_logic_vector(bit_add -1 downto 0);
	 ADD_RD1: 	IN std_logic_vector(bit_add -1 downto 0);
	 ADD_RD2: 	IN std_logic_vector(bit_add -1 downto 0);
	 DATAIN: 	IN std_logic_vector(bit_data -1 downto 0);
     OUT1: 		OUT std_logic_vector(bit_data -1 downto 0);
	 OUT2: 		OUT std_logic_vector(bit_data -1 downto 0));
  end component;

  component register_1 
     generic ( bit_data : integer);
     port (d_in : in std_logic_vector(bit_data-1 downto 0);
           d_out : out std_logic_vector(bit_data-1 downto 0);
       	   en : in std_logic);
  end component;

  signal rf_to_a, rf_to_b : std_logic_vector(bit_data-1 downto 0);
-------------------------------------
begin

  REG_FILE : register_file
    generic map(bit_add, bit_data)
    port map(
     RF_RESET, --RESET
	 rf_en,
	 reg_read_en_1, --RD1
	 reg_read_en_2, --RD2
	 W_EN, -- WR_EN
	 reg_write_add, --ADD_WR
	 reg_read_add_1, --ADD_RD1
	 reg_read_add_2, --ADD_RD2
	 data_write_in, --DATAIN
     rf_to_a, --OUT1
	 rf_to_b); --OUT2
	
	REG_A : register_1 
     generic map(bit_data)
     port map(rf_to_a,--d_in
           A_OUT,--d_out
       	   RegA_LATCH_EN  );--en

	REG_B : register_1 
     generic map(bit_data)
     port map(rf_to_b,--d_in
           B_OUT,--d_out
       	   RegB_LATCH_EN  );--en

	REG_IMM : register_1
	 generic map(bit_data)
     port map(IMM,
			  imm_out,
			  RegIMM_LATCH_EN);

	REG_RD_ADD : register_1
	 generic map(bit_add)
	 port map(reg_write_save_add,
			  rd_saved_out,
			  RegRD_ADD_EN);

end structural;
