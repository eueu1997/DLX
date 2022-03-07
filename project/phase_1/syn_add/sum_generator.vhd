library ieee;
use ieee.std_logic_1164.all;
--------------------------------------------------------------------------------
entity SUM_GENERATOR is
  generic ( NBIT_PER_BLOCK: integer := 4;
            NBLOCKS:        integer := 8);
  port ( A:  in	 std_logic_vector(NBIT_PER_BLOCK*NBLOCKS-1 downto 0);
         B:  in	 std_logic_vector(NBIT_PER_BLOCK*NBLOCKS-1 downto 0);
	 Ci: in	 std_logic_vector(NBLOCKS-1 downto 0);
         S:  out std_logic_vector(NBIT_PER_BLOCK*NBLOCKS-1 downto 0));
end SUM_GENERATOR;
--------------------------------------------------------------------------------

architecture STRUCTURAL of SUM_GENERATOR is

---------------
  component CARRY_SELECT
    generic (N_BIT :      integer := 4);
    port (Cin : in   std_logic;
          A,B : in   std_logic_vector(N_BIT-1 downto 0);
          S   : out  std_logic_vector(N_BIT-1 downto 0));
  end component;
---------------

begin

  SUMG1: for I in 1 to NBLOCKS generate
    CS_I: CARRY_SELECT
      generic map (N_BIT => NBIT_PER_BLOCK)
      port map (Ci(I-1),
                A(NBIT_PER_BLOCK*I-1 downto NBIT_PER_BLOCK*I-NBIT_PER_BLOCK),
                B(NBIT_PER_BLOCK*I-1 downto NBIT_PER_BLOCK*I-NBIT_PER_BLOCK),
                S(NBIT_PER_BLOCK*I-1 downto NBIT_PER_BLOCK*I-NBIT_PER_BLOCK));
    end generate;

end STRUCTURAL;
--------------------------------------------------------------------------------

configuration CFG_SUM_GENERATOR_STRUCTURAL of SUM_GENERATOR is
  for STRUCTURAL
    for SUMG1
      for all : CARRY_SELECT
        use configuration WORK.CFG_CARRY_SELECT_STRUCTURAL;
      end for;
     end for;
  end for;
end configuration;

