library ieee;
use ieee.std_logic_1164.all;
use work.constants.all;

entity datapath is
	generic ( bit_add : integer;
			  bit_data : integer;
			  cw_size : integer);
	port (  reg_en : in std_logic; -- uso un solo en per tutti i registri di tutto il datapath
			--phase 1 control signal
			imem_res : in std_logic;
			-- phase 2 control signal
			inst_type : in std_logic_vector ( 1 downto 0);
			--phase 3 control signal
			npc_or_a : in std_logic; 
			b_or_imm : in std_logic; 
			branch_or_comp : in std_logic; 
			be : in std_logic; 
			alu_type : in std_logic_vector(3 downto 0);
			c_out : out std_logic;
			cin : in std_logic;
			cond: out std_logic;
			--phase4 control signal
			j_en : in std_logic;
			ram_en : in std_logic;
			wb_sel : in std_logic;
			ram_res : in std_logic;
			rw : in std_logic);
end datapath;

architecture structural of datapath is

	component fetch is --PHASE 1
		port(
		-- new program counter  coming from phase 4
		  pc_s : in std_logic_vector(bit_add -1 downto 0);
		-- out register en
		  en : in std_logic;
		-- memory reset
		  imem_res : in std_logic;
		-- npc out from register
		  npc_s : out std_logic_vector(bit_add-1  downto 0);
		--npc out with no register
		  npc_d : out std_logic_vector(bit_add-1  downto 0);
		  ir_s : out std_logic_vector(i_size -1 downto 0));
	end component;

	component decode is --PHASE 2
		port(
		-- I,R or J type of instruction  
		  inst_type: in std_logic_vector (1 downto 0);
		--signals from phase 1
		  ir_s: in std_logic_vector(bit_data-1 downto 0);
		  WR_in: in std_logic_vector(bit_data-1 downto 0);
		  en : in std_logic;
		-- signal to phase 3
		  A_out: out std_logic_vector(bit_data-1 downto 0);
		  B_out: out std_logic_vector(bit_data-1 downto 0);
		  imm_out: out std_logic_vector(bit_data-1 downto 0));
	end component;

	component phase3 is --PHASE 3

	generic ( nbit : integer);
	port( npc : in std_logic_vector(nbit-1 downto 0);
		 a : in std_logic_vector(nbit-1 downto 0);
		 b : in std_logic_vector(nbit-1 downto 0);
		 imm : in std_logic_vector(nbit -1 downto 0);

		 npc_or_a : in std_logic; -- '0' for npc
		 b_or_imm : in std_logic; -- '0' for b
		 branch_or_comp : in std_logic; -- branching means we get a, comparing means we need the result of a+b so we can check if it is zero to say that are equalt
		 be : in std_logic; -- 0 be , 1 bne
		 alu_type : in std_logic_vector(3 downto 0);
		 c_out : out std_logic;
		 cin : in std_logic;
		 -- output of the condition
		 cond: out std_logic;
		 -- aoutput of the block
		 alu_out : out std_logic_vector(nbit-1 downto 0);
		 -- register output enable
		 en : in std_logic);

	end component;

	component phase_4 is --PHASE 4
		port(alu_out : in std_logic_vector(nbit -1  downto 0);
		b : in std_logic_vector(nbit - 1 downto 0);
		npc : in std_logic_vector( nbit - 1 downto 0);
		cond : in std_logic;
		j_en : in std_logic;
		en : in std_logic;
		ram_en : in std_logic; 
		wb_sel : in std_logic;
		ram_res : in std_logic;
		rw : in std_logic;
		pc : out std_logic_vector ( nbit -1 downto 0 );
		wb : out std_logic_vector ( nbit -1 downto 0)););
	end component;

	component register_1 is

		generic ( n_bit : integer);
		port (d_in : in std_logic_vector(n_bit-1 downto 0);
			  d_out : out std_logic_vector(n_bit-1 downto 0);
			  en : in std_logic);
	
	end component;

constant bit_add : integer := 32;
constant bit_data : integer := 32;
-- phase 1 signal 
signal pc_s,npc_s,npc_d : std_logic_vector(bit_add -1 downto 0);
signal ir_s : std_logic_vector(bit_data -1 downto 0);
--phase 2 signals
signal A,B,imm,WR_in : std_logic_vector ( bit_data -1 downto 0);
-- in phase 2 inserted a register poer npc that must follow the pipe in case of Branch instruction
-- the npc from phase 1 go directly to the mux in phase 4 without regs( there is one "after" the mux)
-- in case of brench the sequentiality is mantained due to bubble insertion ( I hypotize this way)
--PHASE3 signal
signal ALU_out,B1 : std_logic_vector(bit_data - 1 downto 0);
signal cond_s : std_logic;
begin
	cond <= cond_s;
	phase_1 : fetch generic map ( bit_add, bit_data ) port map (pc_s,reg_en,imem_res,npc_s,npc_d,ir_s);

	phase_2 : decode port map (inst_type,ir_s,WR_in,reg_en,A,B,imm);
	reg_npc : register_1 generic map(bit_add) port map (npc_s,npc_s2,reg_en);

	phase_3 : phase3 generic map(bit_data) port map (npc_s2,A,B,imm,npc_or_a,b_or_imm,branch_or_comp,be,alu_type,c_out,cin,cond_s,ALU_out,reg_en);
	reg_B : register_1 generic map ( bit_data) port map(B,B1,reg_en)

	phase_4 : phase_4 generic map ( bit_data) port map(ALU_out,B1,npc_d,cond_s,j_en,reg_en,ram_en,wb_sel,ram_res,rw,pc_s,WR_in);
end structural;
