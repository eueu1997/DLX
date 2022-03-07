library ieee;
use ieee.std_logic_1164.all;
use work.constants.all;

entity decode is
	generic (bit_data: integer := 32;
			 bit_add: integer := 5);
	port (inst_type: in std_logic_vector (1 downto 0);
		  ir_s: in std_logic_vector(bit_data-1 downto 0);
		  WR_in: in std_logic_vector(bit_data-1 downto 0);

		  A_out: out std_logic_vector(bit_data-1 downto 0);
		  B_out: out std_logic_vector(bit_data-1 downto 0);
		  imm_out: out std_logic_vector(bit_data-1 downto 0)
		 );
end decode;

architecture structural of decode is
	component inst_decode
		generic (bit_data: integer := 32;
				bit_add: integer := 5);
 		port(inst_type : in std_logic_vector (1 downto 0);
    	   ir_s : in std_logic_vector(bit_data-1 downto 0);
		   RS1 : out std_logic_vector(bit_add-1 downto 0);
		   RD1 : out std_logic;
    	   RS2 : out std_logic_vector(bit_add-1 downto 0);
    	   RD2 : out std_logic;
		   RD : out std_logic_vector(bit_add-1 downto 0);
		   WR : out std_logic;
		   IMM : out std_logic_vector(bit_data-1 downto 0));
	end component;

	component reg_fetch
	generic (bit_data: integer := 32;
           bit_add: integer := 5);
  port(RegA_LATCH_EN      : in std_logic;
       RegB_LATCH_EN      : in std_logic;
       RegIMM_LATCH_EN    : in std_logic;
	   CLK : in std_logic;
	   RS1 : in std_logic_vector(bit_add-1 downto 0);
	   RD1 : in std_logic;
       RS2 : in std_logic_vector(bit_add-1 downto 0);
       RD2 : in std_logic;
	   RD : in std_logic_vector(bit_add-1 downto 0);
	   WR : in std_logic;
	   IMM : in std_logic_vector(bit_data-1 downto 0);
	   WR_in : in std_logic_vector(bit_data-1 downto 0);
       A_out : out std_logic_vector(bit_data-1 downto 0);
       B_out : out std_logic_vector(bit_data-1 downto 0);
       imm_out : out std_logic_vector(bit_data-1 downto 0)
      );
	end component;

	signal RS1_s, RS2_s, RD_s : std_logic_vector (dit_add-1 downto 0);
	signal RD1_s, RD2_s, WR_s : std_logic;
	signal IMM_s : std_logic_vector(bit_data-1 downto 0);

begin
	decode_u: inst_decode
			generic map(bit_data, bit_add)
			port map(inst_type, ir_s, RS1_s, RS1_s, RS2_s, RD2_s, RD_s, WR_s, IMM_s);

	reg_fetch_u: reg_fetch
			generic map(bit_data, bit_add)
			port map(RegA_LATCH_EN, RegB_LATCH_EN, RegIMM_LATCH_EN, CLK, RS1_s, RD1_s, RS2_s, RD2_s, RD_s, WR_s, IMM_s, WR_in);

end behavioral;
