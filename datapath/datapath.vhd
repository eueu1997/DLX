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
			jal : in std_logic;
			--phase 3 control signal
			npc_or_a : in std_logic; -- inputtin from 'a'(1) register fetched or adding the npc
			b_or_imm : in std_logic; -- inputtin 'b'(0) register fetched or immediate 
			branch_or_comp : in std_logic; -- if the value sent in zero block is for branching(0) or cmaparison
			be : in std_logic; -- 0 for beq, 1 for bneq
			alu_type : in std_logic_vector(3 downto 0);
			alu_en : in std_logic;
			cin : in std_logic;
			--phase4 control signal
			bj_en : in std_logic; -- enable the condition evaluation to choose between the branched addres or npc
			j_en : in std_logic; -- enable unconditional branch
			ram_en : in std_logic; -- enable the ram to be read/write
			--(the next one is in phase5)
			wb_sel : in std_logic; -- 0 for reading from memory, 1 if write back from alu
			ram_res : in std_logic; -- reaset the ram
			rw : in std_logic; -- 0 for write, 1 for read
			--phase5
			rf_we : in std_logic;
			cond: out std_logic;
			c_out : out std_logic
			);
end datapath;
------- TODO----------------------------
-- testare npc-> r31
-- IMPLEMENTARE BLOCCO CHE SETTA A 0/1 1 REGISTRO ALAL VOLTA DEL REG FILE
-----------------------------------------
--------------FULL ISTRUCTION SET ----------------
-- add   0/10 0/1010 0000 10/ 000100
-- addd 
-- addf
-- addi  0/01 0/1110 0000 10/000100
-- addu 
-- addui
-- and   10/10 0/010 0001 10/000100
-- andi  0/01 0/1110 0001 10/000100
-- beqz  0/01 0/0100 0000 10/100000
-- bfpf
-- bfpt
-- bnez  0/01 0/0101 0000 10/100000
-- cvt commands
-- div commands
-- eqd
-- g commands
-- j     0/11 0/0100 0000 10/110000
-- jal   0/11 1/0100 0000 10/110000
-- jalr  0/01 1/1100 0000 00/110000
-- jr    0/01 0/1100 0000 00/110000
-- lb    0/01 0/1110 0000 10/001101 -- creare sign extension
-- lbu   0/01 0/1110 0000 10/001101
-- lw lh implement read more than one byte
-- mov   0/01 0/1100 0000 00/000100
-- mult  0/11 0/1010 0011 10/000100
-- or    0/11 0/1010 0111 10/000100
-- ori   0/01 0/1110 0111 10/000100
-- sb    0/01 0/1110 0000 10/001100
-- seq,seqi add possibility to set to 1 or 0 a register
-- sge,sgei,sgeu,sgeui,sgt,sgti,sle,slei
-- sll   0/10 0/1010 0100 10/000100
-- slli  0/01 0/1110 0100 10/000100
-- srl   0/10 0/1010 0101 10/000100
-- srli  0/01 0/1110 0101 10/000100
-- sub   0/10 0/1010 0010 10/000100
-- subi  0/01 0/1110 0010 10/000100
-- xor   0/10 0/1010 0110 10/000100
--xori   0/01 0/1110 0110 10/000100

----------------BASIC INSTRUCTION -------------------

--add   DONE 0/10 0/1010 0000 10/000100
--addi  DONE 0/01 0/1110 0000 10/000100
--and   DONE 0/10 0/1010 0001 10/000100
--andi  DONE 0/01 0/1110 0001 10/000100
--beqz  DONE 0/01 0/0100 0000 10/100000
--bnez  DONE 0/01 0/0101 0000 10/100000
--j     DONE 0/11 0/0100 0000 10/110000
--jal   TODO Has to implement a link between NPC and R31 ( PHASE2 ) 
--lw    DONE 0/01 0/1110 0000 10/001000
--nop   DONE ( We could make it just not triggering the registers)
--or    DONE 0/11 0/1010 0111 10/000100
--ori   DONE 0/01 0/1110 0111 10/000100
--sge   TODO Has to implement a setter for the given register. 
--sgei  TODO Has to implement a setter for the given register
--sle   TODO Has to implement a setter for the given register
--slei  TODO Has to implement a setter for the given register
--sll   DONE 0/10 0/1010 0100 10/000100
--slli  DONE 0/01 0/1110 0100 10/000100
--sne   TODO Has to implement a setter for the given register. 
--snei  TODO Has to implement a setter for the given register. 
--srl   DONE 0/10 0/1010 0101 10/000100
--srli  DONE 0/01 0/1110 0101 10/000100
--sub   DONE 0/10 0/1010 0010 10/000100
--subi  DONE 0/01 0/1110 0010 10/000100
--sw    DONE 0/01 0/1110 0000 10/001001
--xor   DONE 0/10 0/1010 0110 10/000100
--xori  DONE 0/01 0/1110 0110 10/000100



architecture structural of datapath is

	component fetch is --PHASE 1
		port(
		-- new program counter  coming from phase 4
		  pc_s : in std_logic_vector(bit_add -1 downto 0);
		-- out register en
		  en : in std_logic;
		-- memory reset
		  imem_res : in std_logic;
		  npc_r : out std_logic_vector(bit_add-1 downto 0);
		-- pc out from register
		  pc_out : out std_logic_vector(bit_add-1  downto 0);
		--npc out with no register
		  npc_d : out std_logic_vector(bit_add-1  downto 0);
		  ir_s : out std_logic_vector(i_size -1 downto 0));
	end component;

	component decode is --PHASE 2
		generic(bit_data: integer := 32;
				bit_add: integer := 5);
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
		 alu_en : in std_logic;
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
		port (alu_out : in std_logic_vector(nbit -1  downto 0);
		b : in std_logic_vector(nbit - 1 downto 0);
		npc : in std_logic_vector( nbit - 1 downto 0);
		cond : in std_logic;
		j_en : in std_logic;
		bj_en : in std_logic;
		en : in std_logic;
		ram_en : in std_logic; 
		wb_sel : in std_logic;
		ram_res : in std_logic;
		rw : in std_logic;
		pc : out std_logic_vector ( nbit -1 downto 0 );
		wb : out std_logic_vector ( nbit -1 downto 0));
	end component;

	component register_1 is

		generic ( n_bit : integer);
		port (d_in : in std_logic_vector(n_bit-1 downto 0);
			  d_out : out std_logic_vector(n_bit-1 downto 0);
			  en : in std_logic);
	
	end component;

constant bit_add : integer := 5;
constant bit_data : integer := 32;
-- phase 1 signal 
signal pc_s,pc_out,pc_out2,npc_s,npc_d : std_logic_vector(bit_add -1 downto 0);
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
	phase_1 : fetch generic map ( bit_add, bit_data ) port map (pc_s,reg_en,imem_res,npc_s,pc_out,npc_d,ir_s);

	phase_2 : decode port map (inst_type,ir_s,WR_in,reg_en,A,B,imm);
	reg_npc : register_1 generic map(bit_add) port map (pc_out,pc_out2,reg_en);

	phase_3 : phase3 generic map(bit_data) port map (pc_out2,A,B,imm,npc_or_a,b_or_imm,branch_or_comp,be,alu_type,alu_en,c_out,cin,cond_s,ALU_out,reg_en);
	reg_B : register_1 generic map ( bit_data) port map(B,B1,reg_en)

	phase_4 : phase_4 generic map ( bit_data) port map(ALU_out,B1,npc_d,cond_s,j_en,bj_en,reg_en,ram_en,wb_sel,ram_res,rw,pc_s,WR_in);
end structural;
