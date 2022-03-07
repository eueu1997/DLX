library ieee;
use ieee.std_logic_1164.all;
use WORK.constants.all;

--------------------------------------------------------------------------------
entity CARRY_SELECT is
  generic (N_BIT :      integer := STEP);
  port (Cin : in   std_logic;
        A,B : in   std_logic_vector(N_BIT-1 downto 0);
        S   : out  std_logic_vector(N_BIT-1 downto 0));
end CARRY_SELECT;
--------------------------------------------------------------------------------

architecture STRUCTURAL of CARRY_SELECT is
  
---------------
  signal S_Ci0, S_Ci1 : std_logic_vector(N_BIT-1 downto 0);
  signal intCo : std_logic_vector(1 downto 0);
  
  component RCA
    	generic (
		 NBITS : 	integer := 4);
	Port (	A:	In	std_logic_vector(NBITS-1 downto 0);
		B:	In	std_logic_vector(NBITS-1 downto 0);
		Ci:	In	std_logic;
		S:	Out	std_logic_vector(NBITS-1 downto 0);
		Co:	Out	std_logic);
  end component;

  component MUX21
    	Generic (NBIT :      integer := 4);
	Port (	A:	In	std_logic_vector(NBIT-1 downto 0) ;
		B:	In	std_logic_vector(NBIT-1 downto 0);
		SEL:	In	std_logic;
		Y:	Out	std_logic_vector(NBIT-1 downto 0));
  end component;
----------------
  
begin
  
  RCA_0 : RCA generic map (NBITS => N_BIT)
              port map (A, B, '0', S_Ci0, intCo(0));
      
  RCA_1 : RCA generic map (NBITS => N_BIT)
              port map (A, B, '1', S_Ci1, intCo(1));
      
  MUX_OUT : MUX21 generic map(NBIT => N_BIT)
                  port map (S_Ci0, S_Ci1, Cin, S);

end STRUCTURAL;

--------------------------------------------------------------------------------

configuration CFG_CARRY_SELECT_STRUCTURAL of CARRY_SELECT is
  for STRUCTURAL
    for all : RCA
      use configuration WORK.CFG_RCA_STRUCTURAL;
    end for;
    for all : MUX21
      use configuration WORK.CFG_MUX21_BEHAVIORAL;
    end for;
  end for;
end configuration;

