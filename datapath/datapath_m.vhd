library ieee;
use ieee.std_logic_1164.all;
use work.constants.all;

entity datapath_m is
	generic ( bit_add : integer;
			  bit_data : integer);
	port (  reg_en : in std_logic;
			--phase 1 control signal
			imem_res : in std_logic;
			-- phase 2 control signal
			inst_type : in std_logic_vector ( 1 downto 0);
			RF_RESET : in std_logic; -- low active
			WR_EN : in std_logic;
			--phase 3 control signal
			npc_or_a : in std_logic;
			b_or_imm : in std_logic;
			branch_or_comp : in std_logic;
			be : in std_logic;
			alu_type : in std_logic_vector(3 downto 0);
			alu_en : in std_logic;
			cin : in std_logic;
			--phase4 control signal
			bj_en : in std_logic;
			j_en : in std_logic;
			ram_en : in std_logic;
			ram_res : in std_logic;
			rw : in std_logic;
			--phase5
			rf_we : in std_logic;
			wb_sel : in std_logic;
			--output
			inst: out std_logic_vector(bit_data-1 downto 0);

			-- regs_out
			--p1
			npc_out : out std_logic_vector(bit_add-1 downto 0);
			--p2
			regA_out : out std_logic_vector(bit_data-1 downto 0);
			regB_out : out std_logic_vector(bit_data-1 downto 0);
			regIMM_out : out std_logic_vector(bit_data-1 downto 0);
			RegRD_add_out : out std_logic_vector(bit_add-1 downto 0);
			--p3
			cond: out std_logic;
			c_out : out std_logic;
			RegAlu_out: out std_logic_vector(bit_data-1 downto 0);
			RegRD_add_out1: out std_logic_vector(bit_add-1 downto 0);
			--p4
			RegLMD_out: out std_logic_vector(bit_data-1 downto 0)
			);
end datapath_m;

architecture structural of datapath_m is

	component fetch is --PHASE 1
		port(
		  pc_s : in std_logic_vector(bit_add -1 downto 0);
		  en : in std_logic;
		  imem_res : in std_logic;
		  npc_r : out std_logic_vector(bit_add-1 downto 0);
		  pc_out : out std_logic_vector(bit_add-1  downto 0);
		  npc_d : out std_logic_vector(bit_add-1  downto 0);
		  ir_s : out std_logic_vector(bit_data-1 downto 0));
	end component;

	component phase_2 is --PHASE 2
	generic (bit_data: integer;
			 bit_add: integer);
	port (inst_type: in std_logic_vector (1 downto 0);
		  RF_RESET : in std_logic;
		  W_EN: in std_logic;
	      Reg_EN      : in std_logic;
		  ir_s: in std_logic_vector(bit_data-1 downto 0);
		  data_write_in: in std_logic_vector(bit_data-1 downto 0);
		  reg_write_add: in std_logic_vector(bit_add-1 downto 0);   
		  A_out: out std_logic_vector(bit_data-1 downto 0);
		  B_out: out std_logic_vector(bit_data-1 downto 0);
		  imm_out: out std_logic_vector(bit_data-1 downto 0);
		  RD_saved_out: out std_logic_vector(bit_add-1 downto 0));
	end component;

	component phase3 is --PHASE 3
	generic (bit_data : integer);
	port( npc : in std_logic_vector(bit_data-1 downto 0);
		 a : in std_logic_vector(bit_data-1 downto 0);
		 b : in std_logic_vector(bit_data-1 downto 0);
		 imm : in std_logic_vector(bit_data -1 downto 0);
		 npc_or_a : in std_logic;
		 b_or_imm : in std_logic;
		 branch_or_comp : in std_logic;
		 be : in std_logic;
		 alu_type : in std_logic_vector(3 downto 0);
		 alu_en : in std_logic;
		 c_out : out std_logic;
		 cin : in std_logic;
		 cond: out std_logic;
		 alu_out : out std_logic_vector(bit_data-1 downto 0);
		 en : in std_logic);
	end component;

	component phase_4 is --PHASE 4
		generic(bit_data : integer);
		port(alu_out : in std_logic_vector(bit_data-1  downto 0);
		b : in std_logic_vector(bit_data- 1 downto 0);
		npc : in std_logic_vector( bit_data - 1 downto 0);
		cond : in std_logic;
		j_en : in std_logic;
		bj_en : in std_logic;
		en : in std_logic;
		ram_en : in std_logic; 
		wb_sel : in std_logic;
		ram_res : in std_logic;
		rw : in std_logic;
		pc : out std_logic_vector ( bit_data -1 downto 0 );
		wb : out std_logic_vector ( bit_data -1 downto 0));
	end component;

	component register_1 is
		generic ( bit_data : integer);
		port (d_in : in std_logic_vector(bit_data-1 downto 0);
			  d_out : out std_logic_vector(bit_data-1 downto 0);
			  en : in std_logic);
	end component;

--phase 1 signal 
signal pc_s,pc_out,pc_out2,npc_s,npc_d : std_logic_vector(bit_add -1 downto 0);
signal ir_s : std_logic_vector(bit_data -1 downto 0);

--phase 2 signals
signal A_out_s,B_out_s,imm_out_s,WR_in_s : std_logic_vector (bit_data -1 downto 0);
signal RD_saved_out_s, write_add_s : std_logic_vector (bit_add-1 downto 0);
signal WR_EN_s : std_logic;

--phase 3 signal
signal ALU_out,B1 : std_logic_vector(bit_data - 1 downto 0);
signal cond_s : std_logic;
signal rd_saved_s1: std_logic_vector(bit_add-1 downto 0);

--phase 4 signal


begin
	cond <= cond_s;
	phase_1 : fetch generic map ( bit_add, bit_data ) 
						port map (pc_s,
									reg_en,
									imem_res,
									npc_s,
									pc_out,
									npc_d,
									ir_s);

	phase_2_u : phase_2 generic map (bit_data, bit_add)	
						port map (inst_type,
		  							RF_RESET,
		  							WR_EN,
	      							Reg_en,
									ir_s,
									WR_in_s,
		  							write_add_s,                  
		  							A_out_s,
		  							B_out_s,
		  							imm_out_s,
		  							RD_saved_out_s);

	reg_npc : register_1 generic map (bit_add)
							port map (pc_out,
										pc_out2,
										reg_en);

	phase_3 : phase3 generic map (bit_data)
						port map (pc_out2,
									A_out_s,
									B_out_s,
									imm_out_s,
									npc_or_a,
									b_or_imm,
									branch_or_comp,
									be,
									alu_type,
									alu_en,
									c_out,
									cin,
									cond_s,
									ALU_out,
									reg_en);

	reg_B : register_1 generic map (bit_data) 
						  port map (B_out_s,
									B1,
									reg_en);

	reg_rd_saved_p3: register_1 generic map (bit_add)
								port map (rd_saved_out_s,
										rd_saved_s1,
										reg_en);

	phase_4_u : phase_4 generic map (bit_data)
						 port map (ALU_out,
									B1,
									npc_d,
									cond_s,
									j_en,
									bj_en,
									reg_en,
									ram_en,
									wb_sel,
									ram_res,
									rw,
									pc_s,
									WR_in_s);

	reg_rd_saved_p4: register_1 generic map (bit_add)
								port map (rd_saved_s1,
									write_add_s,
									reg_en);

			-- regs_out
			--p1
			npc_out <= pc_out;
			--p2
			regA_out <= A_out_s;
			regB_out <= B_out_s;
			regIMM_out <= IMM_out_s;
			RegRD_add_out <= rd_saved_out_s;
			--p3
			RegAlu_out <= alu_out;
			RegRD_add_out1 <= rd_saved_s1;
			--p4
			RegLMD_out <= wr_in_s ;
end structural;
