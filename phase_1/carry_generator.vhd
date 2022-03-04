library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.math_real.all;
use work.constants.all;

entity CARRY_GENERATOR is
		generic (
			NBIT :		integer := WORD ;
			NBIT_PER_BLOCK: integer := STEP);
		port (
			A :    	in	std_logic_vector(NBIT-1 downto 0);
			B :    	in	std_logic_vector(NBIT-1 downto 0);
			Cin :	in	std_logic;
			Co :	out	std_logic_vector((NBIT/NBIT_PER_BLOCK) downto 0));
end CARRY_GENERATOR;

architecture structural of CARRY_GENERATOR is
  
component G is 
	port ( pik : in std_logic;
               gik : in std_logic;
	       gik_1 : in std_logic;
               gij : out std_logic);
end component;

component PG is 
	port ( pik : in std_logic;
               gik : in std_logic;
               pik_1 : in std_logic;
	       gik_1 : in std_logic;
	       pij : out std_logic;
	       gij : out std_logic);
end component;

---------------------CONSTANTS-----------------------------------------
constant NROW : integer := integer(LOG2(real(NBIT)));
constant NCARRY : integer := NBIT/NBIT_PER_BLOCK;
constant RAD_NCARRY : integer := integer(LOG2(real(NCARRY)));
-----------------------------------------------------------------------

---------------------SIGNALS--------------------------------------------------
type SignalType is array (NROW downto 0) of std_logic_vector(NBIT-1 downto 0);
signal P_s,G_s : SignalType := (others => (others => '0'));
------------------------------------------------------------------------------

begin  

--------Initial PG NETWORK------------
PGNET : for i in 0 to NBIT-1 generate
  FIRST_BLOCK: if i=0 generate
    G_s(NROW)(i) <= Cin;
    P_s(NROW)(i) <= '0';
  end generate;

  OTHER_BLOCKS: if i>0 generate
    P_s(NROW)(i) <= A(i) xor B(i);
    G_s(NROW)(i) <= A(i) and B(i);
  end generate;
end generate PGNET;
-------------------------------------
         
---------FIRST ROWS (COLUMNS 1:1 PG/G BLOCKS)--------------------------------------------------
ROW_GEN_1 : for row in NROW downto RAD_NCARRY+1 generate --last row is with n.columns=dim(Cout)

  COL_GEN_1 : for col in 0 to (2**(row-1)-1) generate

    PGij_1 : if col>0 generate
          PG_GEN_1 : PG port map (P_s(row)(col*2+1), G_s(row)(col*2+1),
                                 P_s(row)(col*2), G_s(row)(col*2),
                                 P_s(row-1)(col), G_s(row-1)(col));
    end generate PGij_1;

    Gi1_1 : if col=0 generate
          G_GEN_1 : G port map (P_s(row)(1),           
                              G_s(row)(1),
                              G_s(row)(0),           
                              G_s(row-1)(0)); 
    end generate Gi1_1;
    
  end generate COL_GEN_1 ;
  
end generate ROW_GEN_1;
--------------------------------------------------------------------------------------------------

--------SECOND ROWS (there are columns without PG/G blocks)----------------------------
ROW_GEN_2 : for row in RAD_NCARRY downto 1 generate
  
  COL_GEN_2 : for col in 0 to (2**(row-1)-1) generate
    
    PG_G_GEN: for i in 0 to (NBIT)/(2**(RAD_NCARRY-1+row))-1 generate

      --CONNECTIONS --> where there aren't PG/G blocks
      G_s(row-1)(col*2**(NROW-1-row)+i) <= G_s(row)(col*2**(NROW-1-row)+i);
      P_s(row-1)(col*2**(NROW-1-row)+i) <= P_s(row)(col*2**(NROW-1-row)+i);
      
      PGij_2 : if col>0 generate
        PG_GEN_2: PG port map (P_s(row)(col*2**(NROW-1-row)+2**(RAD_NCARRY-row)+i), 
                               G_s(row)(col*2**(NROW-1-row)+2**(RAD_NCARRY-row)+i), 
                               P_s(row)(col*2**(NROW-1-row)+2**(RAD_NCARRY-row)-1), 
                               G_s(row)(col*2**(NROW-1-row)+2**(RAD_NCARRY-row)-1),
                               P_s(row-1)(col*2**(NROW-1-row)+2**(RAD_NCARRY-row)+i),
                               G_s(row-1)(col*2**(NROW-1-row)+2**(RAD_NCARRY-row)+i));
        end generate PGij_2;

      Gi1_2 : if col=0 generate
        G_GEN_2 : G port map (P_s(row)(2**(RAD_NCARRY-row)+i),           
                              G_s(row)(2**(RAD_NCARRY-row)+i),
                              G_s(row)(2**(RAD_NCARRY-row)-1),           
                              G_s(row-1)(2**(RAD_NCARRY-row)+i)); 
        end generate Gi1_2;

    end generate PG_G_GEN;
    
 end generate COL_GEN_2;
      
end generate ROW_GEN_2;
-------------------------------------------------------------------------------------
            
Co <= G_s(0)(NCARRY-1 downto 0) & Cin;  ----OUTPUT

end structural;

configuration CFG_CARRY_GENERATOR_STRUCTURAL of CARRY_GENERATOR is
  for STRUCTURAL
  end for;
end CFG_CARRY_GENERATOR_STRUCTURAL;
