library IEEE;
use IEEE.std_logic_1164.all;
use WORK.constants.all;

entity reg_fetch is
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
end reg_fetch;

architecture structural of reg_fetch is

  component register_file 
    generic(bit_add : integer := 5;
            bit_data : integer := 32);
    port(--CLK: 		IN std_logic;
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
    port map(--CLK,
         '0', --RESET --POTREBBE SERVIRCI UN SEGNALE DI RESET
	 '1', --ENABLE
	 RD1, --RD1
	 RD2, --RD2
	 WR, --WR
	 RD, --ADD_WR
	 RS1, --ADD_RD1
	 RS2, --ADD_RD2
	 WR_IN, --DATAIN
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

end structural;
