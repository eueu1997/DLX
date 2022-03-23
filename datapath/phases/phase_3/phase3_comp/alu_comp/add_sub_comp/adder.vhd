library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity P4_ADDER is
  generic (NBIT: integer ;
           NBIT_PB: integer );
  port (A: in std_logic_vector(NBIT-1 downto 0);
        B: in std_logic_vector(NBIT-1 downto 0);
        Cin: in std_logic;
        S: out std_logic_vector(NBIT-1 downto 0);
        Co: out std_logic);
end P4_ADDER;

architecture STRUCTURAL of P4_ADDER is

  component CARRY_GENERATOR is
    		generic (NBIT :		integer := 32 ;
			 NBIT_PER_BLOCK: integer := 4);
		port (A :    	in	std_logic_vector(NBIT-1 downto 0);
                      B :    	in	std_logic_vector(NBIT-1 downto 0);
                      Cin :	in	std_logic;
                      Co :	out	std_logic_vector((NBIT/NBIT_PER_BLOCK) downto 0));
  end component;

  component SUM_GENERATOR is
                generic ( NBIT_PER_BLOCK: integer := 4;
                          NBLOCKS:        integer := 8);
                port ( A:  in	 std_logic_vector(NBIT_PER_BLOCK*NBLOCKS-1 downto 0);
                       B:  in	 std_logic_vector(NBIT_PER_BLOCK*NBLOCKS-1 downto 0);
                       Ci: in	 std_logic_vector(NBLOCKS-1 downto 0);
                       S:  out std_logic_vector(NBIT_PER_BLOCK*NBLOCKS-1 downto 0));      
  end component;
  
  signal int_carry: std_logic_vector(NBIT/NBIT_PB downto 0);
------------------------------------------------------------------------
  begin

    CLA_U: CARRY_GENERATOR generic map (NBIT => NBIT, NBIT_PER_BLOCK => NBIT_PB)
                           port map (A, B, Cin, int_carry);
    
    SG_U: SUM_GENERATOR generic map (NBIT_PER_BLOCK => NBIT_PB, NBLOCKS => NBIT/NBIT_PB)
                        port map (A, B, int_carry((NBIT/NBIT_PB)-1 downto 0), S);
    
    Co <= int_carry(NBIT/NBIT_PB);
                
end STRUCTURAL;

architecture behavioral of P4_ADDER is
	signal tmp1 : std_logic_vector(31 downto 0);
	signal tmp2 : std_logic_vector(31 downto 0);
  begin

   tmp1 <= std_logic_vector(unsigned(A) + unsigned(B)) ;
	tmp2(0) <= cin;
	tmp2 ( 31 downto 1) <= (others =>'0');
   s <= std_logic_vector(unsigned(tmp1) + unsigned(tmp2))  ;        
end behavioral;

configuration CFG_P4_ADDER_STRUCTURAL of P4_ADDER is
  for STRUCTURAL
    for all: CARRY_GENERATOR
      use configuration WORK.CFG_CARRY_GENERATOR_STRUCTURAL;
    end for;
    for all: SUM_GENERATOR
      use configuration WORK.CFG_SUM_GENERATOR_STRUCTURAL;
    end for;
  end for;
end configuration;
configuration CFG_P4_ADDER_BEH of P4_ADDER is 
for behavioral
end for;
end configuration;
