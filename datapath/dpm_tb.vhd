library ieee;
use ieee.std_logic_1164.all;
entity dpm_tb is
    end dpm_tb;

architecture tb of dpm_tb is
component datapath_m is
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
end component;

constant bit_data : integer := 32;
constant bit_add : integer := 5;

begin


process
	begin

	end process;
end tb;

