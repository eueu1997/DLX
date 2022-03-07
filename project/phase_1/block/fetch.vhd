library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity fetch is 
	generic ( bit_add : integer;
			  i_size : integer);
	port( pc_s : in std_logic_vector(bit_add -1 downto 0);
		  npc_en : in std_logic;
		  ir_en : in std_logic;
		  imem_res : in std_logic;
		  npc_s : out std_logic_vector(bit_add-1  downto 0);
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

from_pc<=pc_s;

ADD : P4_ADDER   generic map ( bit_add,4)
				port map( from_pc,std_logic_vector(to_unsigned(1,bit_add)),'0',add_to_npc,open);

I_MEM : IRAM    generic map ( bit_add,i_size)
  				port map ( imem_res,from_pc,mem_to_ir);

NPC : register_1 generic map( bit_add)
 				port map(add_to_npc,npc_s,npc_en);
IR : register_1 generic map(i_size)
				port map(mem_to_ir,ir_s,ir_en);

end structural;

configuration CFG_FETCH of fetch is
for structural
for all : P4_ADDER
use configuration WORK.CFG_P4_ADDER_STRUCTURAL;
end for;
end for;
end configuration;
