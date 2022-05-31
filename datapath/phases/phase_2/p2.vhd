library ieee;
use ieee.std_logic_1164.all;
use work.constants.all;
-- modifica per jal : salvare il npc in R31
entity p2 is
	generic (bit_data: integer := 32;
			 bit_add: integer := 5);
	port (--Control signal
		  inst_type: in std_logic_vector (1 downto 0);
		  RF_EN : in std_logic;
		  RF_RESET : in std_logic; -- low active
		  W_EN: in std_logic;	 -- not directly from cu during decode phase 
			reg_en: in std_logic;
		
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
end p2;

architecture structural of p2 is
	component inst_decode
  generic (bit_data: integer := 32;
           bit_add: integer := 5);
  port(-- CU Control Signals
		inst_type : in std_logic_vector (1 downto 0); -- instruction type
													  -- 01 I; 10 R; 11 J
       -- Datapath signal input
       ir_s : in std_logic_vector(bit_data-1 downto 0);

	   -- output
	   reg_read_add_1 : out std_logic_vector(bit_add-1 downto 0);
	   reg_read_en_1 : out std_logic;
       reg_read_add_2 : out std_logic_vector(bit_add-1 downto 0);
       reg_read_en_2 : out std_logic;
	   reg_dest : out std_logic_vector(bit_add-1 downto 0);
	   IMM : out std_logic_vector(bit_data-1 downto 0));

	end component;

	component reg_fetch
	 generic (bit_data: integer := 32;
           bit_add: integer := 5);
  port(--Control Signals (sub CW)
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
	end component;

	
	signal reg_read_add_1s, reg_read_add_2s, reg_dest_add_s : std_logic_vector (bit_add-1 downto 0);
	signal reg_read_EN_1s, reg_read_EN_2s: std_logic;
	signal IMM_s : std_logic_vector(bit_data-1 downto 0);

begin

	-- cè un errore per me nel decode  : nel codice quando leggi l'istruzione setti subito a 1 il write, in realta andrebbe settato due cicli dopo, quando cè WB
	-- secondo me se fai gestire alla CU l'address e il timing dei wvari write ( nel caso di write back, nelcaso dei set etc) è meglio. qui gli fai solo fare read in base al ir_s,mentre quando ce una write da fare la fai fare in base ai sgnali in arrivo da fuori

	decode_u: inst_decode
			generic map(bit_data, bit_add)
			port map(inst_type,
					ir_s,
					reg_read_add_1s,
					reg_read_en_1s,
					reg_read_add_2s,
					reg_read_en_2s,
					reg_dest_add_s,
					IMM_s);

	reg_fetch_u: reg_fetch
			generic map(bit_data, bit_add)
			port map(       -------- CU
	   RF_RESET,
	   W_EN,
	   Reg_en,
       Reg_en,
       Reg_EN,
	   Reg_EN, -----------
	   reg_read_add_1s,
	   reg_read_EN_1s,
       reg_read_add_2s,
       reg_read_EN_2s,
	   reg_dest_add_s, -- in saved register
	   IMM_s,
	   data_write_in,
	   reg_write_add,
       A_out,
       B_out,
       imm_out,
	   rd_saved_out);

end structural;
