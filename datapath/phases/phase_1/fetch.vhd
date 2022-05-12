library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
-------------------------------------------------------------
-- en : signal to out the registers
-- pc_s : it is the program counter. It come from outside because it can be codified by branching ( see the datapath.vhd for moore information)
-- ir_s : Is the istruction read in the memory with the pc as address
-- npc_r : Is the NPC but syncronous with the clock 
-- npc_r : is the NPC but asyncronouse tothe clock ( more information on databath.vhd)
-- pc_out : Is egual to pc_s. It could be usefull
-------------------------------------------------------------
------------------------BEHAVIOR-----------------------------
--The PC_s goes to an adder that increase it,creating the NPC. Also it goes as addres in IMEM to get the Istruction
-------------------------------------------------------------

entity fetch is 
	generic ( bit_add : integer;
			  i_size : integer);
	port( pc_s : in std_logic_vector(bit_add -1 downto 0);
		  en : in std_logic;
		  imem_res : in std_logic;
		  npc_r : out std_logic_vector(bit_add-1  downto 0);
		  pc_out : out std_logic_vector(bit_add-1  downto 0);
		  npc_d : out std_logic_vector(bit_add-1  downto 0);
		  ir_s : out std_logic_vector(i_size -1 downto 0));

end fetch;

architecture structural of fetch is 
	
component P4_ADDER is
  generic (NBIT: integer ;
           NBIT_PB: integer );
  port (A: in std_logic_vector(NBIT-1 downto 0);
        B: in std_logic_vector(NBIT-1 downto 0);
        Cin: in std_logic;
        S: out std_logic_vector(NBIT-1 downto 0);
        Co: out std_logic);
end component;
--TODO implement the istruction loading 
component IRAM is
  generic (
    bit_add : integer ;
    I_SIZE : integer );
  port (
    Rst  : in  std_logic;
    Addr : in  std_logic_vector(bit_add - 1 downto 0);
    Dout : out std_logic_vector(I_SIZE - 1 downto 0)
    );

end component;

component register_1 is

	generic ( n_bit : integer);
	port (d_in : in std_logic_vector(n_bit-1 downto 0);
		  d_out : out std_logic_vector(n_bit-1 downto 0);
		  en : in std_logic);

end component;

signal add_to_npc,from_pc : std_logic_vector(bit_add-1 downto 0);
signal mem_to_ir : std_logic_vector(i_size-1 downto 0);

-----------------------------------------------------------------------

begin 
npc_d <= add_to_npc;

ADD : P4_ADDER   generic map ( bit_add,4)
				port map( from_pc,std_logic_vector(to_unsigned(1,bit_add)),'0',add_to_npc,open);

I_MEM : IRAM    generic map ( bit_add,i_size)
  				port map ( imem_res,from_pc,mem_to_ir);

PC_out : register_1 generic map( bit_add)
 				port map(from_pc,pc_out,en);
IR : register_1 generic map(i_size)
				port map(mem_to_ir,ir_s,en);
PC : register_1 generic map ( bit_add)
				port map(pc_s,from_pc,en);
NPC : register_1 generic map ( bit_add)
				port map(add_to_npc,npc_r,en);
end structural;

configuration CFG_FETCH of fetch is
for structural
for all : P4_ADDER
use configuration WORK.CFG_P4_ADDER_STRUCTURAL;
end for;
end for;
end configuration;
