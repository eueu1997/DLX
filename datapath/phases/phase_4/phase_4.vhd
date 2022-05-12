library ieee;
use IEEE.std_logic_1164.all;

entity phase_4 is 
	generic (nbit : integer);
	port (alu_out : in std_logic_vector(nbit -1  downto 0);
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
		  wb : out std_logic_vector ( nbit -1 downto 0));

end phase_4;

architecture structural of phase_4 is
	
	component MUX21 is
	Generic (NBIT: integer );
	Port (	A:	In	std_logic_vector(NBIT-1 downto 0) ;
		B:	In	std_logic_vector(NBIT-1 downto 0);
		SEL:	In	std_logic;
		en : in std_logic;
		Y:	Out	std_logic_vector(NBIT-1 downto 0));
end component;
	
component RAM is
  generic (
    bit_add : integer ;
    I_SIZE : integer );
  port (
	
    Rst  : in  std_logic;
	en : in std_logic;
	rw : in std_logic;
    Addr : in  std_logic_vector(bit_add - 1 downto 0);
    Dout : out std_logic_vector(I_SIZE - 1 downto 0);
	Din : in std_logic_vector(I_SIZE - 1 downto 0)
    );

end component;	 

component register_1 is

	generic ( n_bit : integer);
	port (d_in : in std_logic_vector(n_bit-1 downto 0);
		  d_out : out std_logic_vector(n_bit-1 downto 0);
		  en : in std_logic);

end component;

signal  alu_out_s, aluout_s , mux_to_pc, ram_to_lmd , lmd_to_wb,wb_to_reg: std_logic_vector(nbit-1 downto 0);
signal cond2 : std_logic;
begin 


alu_out_s <= alu_out;
cond2 <= cond or j_en;
mux_pc 	: mux21 generic map ( nbit) port map (npc , alu_out_s , cond , cond2 , pc);
mux_wb  : mux21 generic map (nbit) port map ( lmd_to_wb,aluout_s,wb_sel,'1',wb_to_reg);

ram1 : RAM generic map (nbit , nbit) port map ( ram_res, ram_en , rw , alu_out_s , ram_to_lmd , b);

lmd_reg 	: register_1 generic map (nbit) port map (ram_to_lmd,lmd_to_wb,en);
alu_out_reg : register_1 generic map (nbit) port map (alu_out_s,aluout_s,en);
wb_reg 		: register_1 generic map (nbit) port map (wb_to_reg,wb,en);

end structural;










