library ieee;
use ieee.std_logic_1164.all;
use work.constants.all;

entity datapath is
	generic ( bit_add : integer;
			  bit_data : integer;
			  cw_size : integer);
	port ( cw : in std_logic_vector(cw_size-1 downto 0));
end datapath;

architecture structural of datapath is

	component fetch is --PHASE 1
		port(pc_s : in std_logic_vector(bit_add -1 downto 0);
		  npc_en : in std_logic;
		  ir_en : in std_logic;
		  imem_res : in std_logic;
		  npc_s : out std_logic_vector(bit_add-1  downto 0);
		  ir_s : out std_logic_vector(bit_data -1 downto 0));
	end component;

	component decode is --PHASE 2
		port(inst_type: in std_logic_vector (1 downto 0);
		  ir_s: in std_logic_vector(bit_data-1 downto 0);
		  WR_in: in std_logic_vector(bit_data-1 downto 0);
		  A_out: out std_logic_vector(bit_data-1 downto 0);
		  B_out: out std_logic_vector(bit_data-1 downto 0);
		  imm_out: out std_logic_vector(bit_data-1 downto 0));
	end component;

	component phase_4 is --PHASE 4
		port(alu_out : in std_logic_vector(bit_data-1  downto 0);
		  b : in std_logic_vector(bit_data-1 downto 0);
		  npc : in std_logic_vector(bit_data-1 downto 0);
		  cond : in std_logic;
		  j_en : in std_logic;
		  npc_en : in std_logic;
		  lmd_en : in std_logic;
		  ram_en : in std_logic; 
		  aluout_en : in std_logic;
		  wb_en : in std_logic;
		  wb_sel : in std_logic;
		  ram_res : in std_logic;
		  rw : in std_logic;
		  pc : out std_logic_vector (bit_data-1 downto 0);
		  wb : out std_logic_vector (bit_data-1 downto 0));
	end component;

begin

	phase_1 : fetch generic map ( bit_add, bit_data )
					port map ( 
end structural;
