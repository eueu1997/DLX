
library IEEE;

use IEEE.std_logic_1164.all;

package CONV_PACK_P4_ADDER is

-- define attributes
attribute ENUM_ENCODING : STRING;

end CONV_PACK_P4_ADDER;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_P4_ADDER.all;

entity MUX21_NBIT4_7 is

   port( A, B : in std_logic_vector (3 downto 0);  SEL : in std_logic;  Y : out
         std_logic_vector (3 downto 0));

end MUX21_NBIT4_7;

architecture SYN_BEHAVIORAL of MUX21_NBIT4_7 is

   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   component AOI22_X1
      port( A1, A2, B1, B2 : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n10, n11, n12, n13, n14 : std_logic;

begin
   
   U1 : INV_X1 port map( A => n10, ZN => Y(0));
   U2 : INV_X1 port map( A => n11, ZN => Y(1));
   U3 : INV_X1 port map( A => n12, ZN => Y(2));
   U4 : INV_X1 port map( A => n13, ZN => Y(3));
   U5 : AOI22_X1 port map( A1 => A(3), A2 => n14, B1 => SEL, B2 => B(3), ZN => 
                           n13);
   U6 : AOI22_X1 port map( A1 => A(2), A2 => n14, B1 => B(2), B2 => SEL, ZN => 
                           n12);
   U7 : AOI22_X1 port map( A1 => A(1), A2 => n14, B1 => B(1), B2 => SEL, ZN => 
                           n11);
   U8 : AOI22_X1 port map( A1 => A(0), A2 => n14, B1 => B(0), B2 => SEL, ZN => 
                           n10);
   U9 : INV_X1 port map( A => SEL, ZN => n14);

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_P4_ADDER.all;

entity MUX21_NBIT4_6 is

   port( A, B : in std_logic_vector (3 downto 0);  SEL : in std_logic;  Y : out
         std_logic_vector (3 downto 0));

end MUX21_NBIT4_6;

architecture SYN_BEHAVIORAL of MUX21_NBIT4_6 is

   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   component AOI22_X1
      port( A1, A2, B1, B2 : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n10, n11, n12, n13, n14 : std_logic;

begin
   
   U1 : INV_X1 port map( A => n10, ZN => Y(0));
   U2 : INV_X1 port map( A => n11, ZN => Y(1));
   U3 : INV_X1 port map( A => n12, ZN => Y(2));
   U4 : INV_X1 port map( A => n13, ZN => Y(3));
   U5 : AOI22_X1 port map( A1 => A(3), A2 => n14, B1 => SEL, B2 => B(3), ZN => 
                           n13);
   U6 : AOI22_X1 port map( A1 => A(2), A2 => n14, B1 => B(2), B2 => SEL, ZN => 
                           n12);
   U7 : AOI22_X1 port map( A1 => A(1), A2 => n14, B1 => B(1), B2 => SEL, ZN => 
                           n11);
   U8 : AOI22_X1 port map( A1 => A(0), A2 => n14, B1 => B(0), B2 => SEL, ZN => 
                           n10);
   U9 : INV_X1 port map( A => SEL, ZN => n14);

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_P4_ADDER.all;

entity MUX21_NBIT4_5 is

   port( A, B : in std_logic_vector (3 downto 0);  SEL : in std_logic;  Y : out
         std_logic_vector (3 downto 0));

end MUX21_NBIT4_5;

architecture SYN_BEHAVIORAL of MUX21_NBIT4_5 is

   component AOI22_X1
      port( A1, A2, B1, B2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n10, n11, n12, n13, n14, n15 : std_logic;

begin
   
   U1 : INV_X1 port map( A => SEL, ZN => n10);
   U2 : INV_X1 port map( A => SEL, ZN => n15);
   U3 : INV_X1 port map( A => n11, ZN => Y(0));
   U4 : AOI22_X1 port map( A1 => A(0), A2 => n15, B1 => B(0), B2 => SEL, ZN => 
                           n11);
   U5 : INV_X1 port map( A => n12, ZN => Y(1));
   U6 : AOI22_X1 port map( A1 => A(1), A2 => n15, B1 => SEL, B2 => B(1), ZN => 
                           n12);
   U7 : INV_X1 port map( A => n13, ZN => Y(2));
   U8 : AOI22_X1 port map( A1 => n10, A2 => A(2), B1 => SEL, B2 => B(2), ZN => 
                           n13);
   U9 : INV_X1 port map( A => n14, ZN => Y(3));
   U10 : AOI22_X1 port map( A1 => A(3), A2 => n10, B1 => SEL, B2 => B(3), ZN =>
                           n14);

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_P4_ADDER.all;

entity MUX21_NBIT4_4 is

   port( A, B : in std_logic_vector (3 downto 0);  SEL : in std_logic;  Y : out
         std_logic_vector (3 downto 0));

end MUX21_NBIT4_4;

architecture SYN_BEHAVIORAL of MUX21_NBIT4_4 is

   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   component AOI22_X1
      port( A1, A2, B1, B2 : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n10, n11, n12, n13, n14, n15 : std_logic;

begin
   
   U1 : INV_X1 port map( A => SEL, ZN => n10);
   U2 : INV_X1 port map( A => n11, ZN => Y(0));
   U3 : INV_X1 port map( A => n12, ZN => Y(1));
   U4 : INV_X1 port map( A => n13, ZN => Y(2));
   U5 : INV_X1 port map( A => n14, ZN => Y(3));
   U6 : AOI22_X1 port map( A1 => A(3), A2 => n10, B1 => SEL, B2 => B(3), ZN => 
                           n14);
   U7 : AOI22_X1 port map( A1 => A(2), A2 => n10, B1 => B(2), B2 => SEL, ZN => 
                           n13);
   U8 : AOI22_X1 port map( A1 => A(1), A2 => n15, B1 => B(1), B2 => SEL, ZN => 
                           n12);
   U9 : AOI22_X1 port map( A1 => A(0), A2 => n15, B1 => B(0), B2 => SEL, ZN => 
                           n11);
   U10 : INV_X1 port map( A => SEL, ZN => n15);

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_P4_ADDER.all;

entity MUX21_NBIT4_3 is

   port( A, B : in std_logic_vector (3 downto 0);  SEL : in std_logic;  Y : out
         std_logic_vector (3 downto 0));

end MUX21_NBIT4_3;

architecture SYN_BEHAVIORAL of MUX21_NBIT4_3 is

   component MUX2_X1
      port( A, B, S : in std_logic;  Z : out std_logic);
   end component;

begin
   
   U1 : MUX2_X1 port map( A => A(0), B => B(0), S => SEL, Z => Y(0));
   U2 : MUX2_X1 port map( A => A(2), B => B(2), S => SEL, Z => Y(2));
   U3 : MUX2_X1 port map( A => A(1), B => B(1), S => SEL, Z => Y(1));
   U4 : MUX2_X1 port map( A => A(3), B => B(3), S => SEL, Z => Y(3));

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_P4_ADDER.all;

entity MUX21_NBIT4_2 is

   port( A, B : in std_logic_vector (3 downto 0);  SEL : in std_logic;  Y : out
         std_logic_vector (3 downto 0));

end MUX21_NBIT4_2;

architecture SYN_BEHAVIORAL of MUX21_NBIT4_2 is

   component MUX2_X1
      port( A, B, S : in std_logic;  Z : out std_logic);
   end component;

begin
   
   U1 : MUX2_X1 port map( A => A(2), B => B(2), S => SEL, Z => Y(2));
   U2 : MUX2_X1 port map( A => A(0), B => B(0), S => SEL, Z => Y(0));
   U3 : MUX2_X1 port map( A => A(1), B => B(1), S => SEL, Z => Y(1));
   U4 : MUX2_X1 port map( A => A(3), B => B(3), S => SEL, Z => Y(3));

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_P4_ADDER.all;

entity MUX21_NBIT4_1 is

   port( A, B : in std_logic_vector (3 downto 0);  SEL : in std_logic;  Y : out
         std_logic_vector (3 downto 0));

end MUX21_NBIT4_1;

architecture SYN_BEHAVIORAL of MUX21_NBIT4_1 is

   component MUX2_X1
      port( A, B, S : in std_logic;  Z : out std_logic);
   end component;

begin
   
   U1 : MUX2_X1 port map( A => A(0), B => B(0), S => SEL, Z => Y(0));
   U2 : MUX2_X1 port map( A => A(1), B => B(1), S => SEL, Z => Y(1));
   U3 : MUX2_X1 port map( A => A(2), B => B(2), S => SEL, Z => Y(2));
   U4 : MUX2_X1 port map( A => A(3), B => B(3), S => SEL, Z => Y(3));

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_P4_ADDER.all;

entity RCA_NBITS4_15 is

   port( A, B : in std_logic_vector (3 downto 0);  Ci : in std_logic;  S : out 
         std_logic_vector (3 downto 0);  Co : out std_logic);

end RCA_NBITS4_15;

architecture SYN_BEHAVIORAL of RCA_NBITS4_15 is

   component FA_X1
      port( A, B, CI : in std_logic;  CO, S : out std_logic);
   end component;
   
   signal add_1_root_add_51_2_carry_1_port, add_1_root_add_51_2_carry_2_port, 
      add_1_root_add_51_2_carry_3_port : std_logic;

begin
   
   add_1_root_add_51_2_U1_0 : FA_X1 port map( A => A(0), B => B(0), CI => Ci, 
                           CO => add_1_root_add_51_2_carry_1_port, S => S(0));
   add_1_root_add_51_2_U1_1 : FA_X1 port map( A => A(1), B => B(1), CI => 
                           add_1_root_add_51_2_carry_1_port, CO => 
                           add_1_root_add_51_2_carry_2_port, S => S(1));
   add_1_root_add_51_2_U1_2 : FA_X1 port map( A => A(2), B => B(2), CI => 
                           add_1_root_add_51_2_carry_2_port, CO => 
                           add_1_root_add_51_2_carry_3_port, S => S(2));
   add_1_root_add_51_2_U1_3 : FA_X1 port map( A => A(3), B => B(3), CI => 
                           add_1_root_add_51_2_carry_3_port, CO => Co, S => 
                           S(3));

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_P4_ADDER.all;

entity RCA_NBITS4_14 is

   port( A, B : in std_logic_vector (3 downto 0);  Ci : in std_logic;  S : out 
         std_logic_vector (3 downto 0);  Co : out std_logic);

end RCA_NBITS4_14;

architecture SYN_BEHAVIORAL of RCA_NBITS4_14 is

   component FA_X1
      port( A, B, CI : in std_logic;  CO, S : out std_logic);
   end component;
   
   signal add_1_root_add_51_2_carry_1_port, add_1_root_add_51_2_carry_2_port, 
      add_1_root_add_51_2_carry_3_port : std_logic;

begin
   
   add_1_root_add_51_2_U1_0 : FA_X1 port map( A => A(0), B => B(0), CI => Ci, 
                           CO => add_1_root_add_51_2_carry_1_port, S => S(0));
   add_1_root_add_51_2_U1_1 : FA_X1 port map( A => A(1), B => B(1), CI => 
                           add_1_root_add_51_2_carry_1_port, CO => 
                           add_1_root_add_51_2_carry_2_port, S => S(1));
   add_1_root_add_51_2_U1_2 : FA_X1 port map( A => A(2), B => B(2), CI => 
                           add_1_root_add_51_2_carry_2_port, CO => 
                           add_1_root_add_51_2_carry_3_port, S => S(2));
   add_1_root_add_51_2_U1_3 : FA_X1 port map( A => A(3), B => B(3), CI => 
                           add_1_root_add_51_2_carry_3_port, CO => Co, S => 
                           S(3));

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_P4_ADDER.all;

entity RCA_NBITS4_13 is

   port( A, B : in std_logic_vector (3 downto 0);  Ci : in std_logic;  S : out 
         std_logic_vector (3 downto 0);  Co : out std_logic);

end RCA_NBITS4_13;

architecture SYN_BEHAVIORAL of RCA_NBITS4_13 is

   component FA_X1
      port( A, B, CI : in std_logic;  CO, S : out std_logic);
   end component;
   
   signal add_1_root_add_51_2_carry_1_port, add_1_root_add_51_2_carry_2_port, 
      add_1_root_add_51_2_carry_3_port : std_logic;

begin
   
   add_1_root_add_51_2_U1_0 : FA_X1 port map( A => A(0), B => B(0), CI => Ci, 
                           CO => add_1_root_add_51_2_carry_1_port, S => S(0));
   add_1_root_add_51_2_U1_1 : FA_X1 port map( A => A(1), B => B(1), CI => 
                           add_1_root_add_51_2_carry_1_port, CO => 
                           add_1_root_add_51_2_carry_2_port, S => S(1));
   add_1_root_add_51_2_U1_2 : FA_X1 port map( A => A(2), B => B(2), CI => 
                           add_1_root_add_51_2_carry_2_port, CO => 
                           add_1_root_add_51_2_carry_3_port, S => S(2));
   add_1_root_add_51_2_U1_3 : FA_X1 port map( A => A(3), B => B(3), CI => 
                           add_1_root_add_51_2_carry_3_port, CO => Co, S => 
                           S(3));

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_P4_ADDER.all;

entity RCA_NBITS4_12 is

   port( A, B : in std_logic_vector (3 downto 0);  Ci : in std_logic;  S : out 
         std_logic_vector (3 downto 0);  Co : out std_logic);

end RCA_NBITS4_12;

architecture SYN_BEHAVIORAL of RCA_NBITS4_12 is

   component FA_X1
      port( A, B, CI : in std_logic;  CO, S : out std_logic);
   end component;
   
   signal add_1_root_add_51_2_carry_1_port, add_1_root_add_51_2_carry_2_port, 
      add_1_root_add_51_2_carry_3_port : std_logic;

begin
   
   add_1_root_add_51_2_U1_0 : FA_X1 port map( A => A(0), B => B(0), CI => Ci, 
                           CO => add_1_root_add_51_2_carry_1_port, S => S(0));
   add_1_root_add_51_2_U1_1 : FA_X1 port map( A => A(1), B => B(1), CI => 
                           add_1_root_add_51_2_carry_1_port, CO => 
                           add_1_root_add_51_2_carry_2_port, S => S(1));
   add_1_root_add_51_2_U1_2 : FA_X1 port map( A => A(2), B => B(2), CI => 
                           add_1_root_add_51_2_carry_2_port, CO => 
                           add_1_root_add_51_2_carry_3_port, S => S(2));
   add_1_root_add_51_2_U1_3 : FA_X1 port map( A => A(3), B => B(3), CI => 
                           add_1_root_add_51_2_carry_3_port, CO => Co, S => 
                           S(3));

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_P4_ADDER.all;

entity RCA_NBITS4_11 is

   port( A, B : in std_logic_vector (3 downto 0);  Ci : in std_logic;  S : out 
         std_logic_vector (3 downto 0);  Co : out std_logic);

end RCA_NBITS4_11;

architecture SYN_BEHAVIORAL of RCA_NBITS4_11 is

   component FA_X1
      port( A, B, CI : in std_logic;  CO, S : out std_logic);
   end component;
   
   signal add_1_root_add_51_2_carry_1_port, add_1_root_add_51_2_carry_2_port, 
      add_1_root_add_51_2_carry_3_port : std_logic;

begin
   
   add_1_root_add_51_2_U1_0 : FA_X1 port map( A => A(0), B => B(0), CI => Ci, 
                           CO => add_1_root_add_51_2_carry_1_port, S => S(0));
   add_1_root_add_51_2_U1_1 : FA_X1 port map( A => A(1), B => B(1), CI => 
                           add_1_root_add_51_2_carry_1_port, CO => 
                           add_1_root_add_51_2_carry_2_port, S => S(1));
   add_1_root_add_51_2_U1_2 : FA_X1 port map( A => A(2), B => B(2), CI => 
                           add_1_root_add_51_2_carry_2_port, CO => 
                           add_1_root_add_51_2_carry_3_port, S => S(2));
   add_1_root_add_51_2_U1_3 : FA_X1 port map( A => A(3), B => B(3), CI => 
                           add_1_root_add_51_2_carry_3_port, CO => Co, S => 
                           S(3));

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_P4_ADDER.all;

entity RCA_NBITS4_10 is

   port( A, B : in std_logic_vector (3 downto 0);  Ci : in std_logic;  S : out 
         std_logic_vector (3 downto 0);  Co : out std_logic);

end RCA_NBITS4_10;

architecture SYN_BEHAVIORAL of RCA_NBITS4_10 is

   component FA_X1
      port( A, B, CI : in std_logic;  CO, S : out std_logic);
   end component;
   
   signal add_1_root_add_51_2_carry_1_port, add_1_root_add_51_2_carry_2_port, 
      add_1_root_add_51_2_carry_3_port : std_logic;

begin
   
   add_1_root_add_51_2_U1_0 : FA_X1 port map( A => A(0), B => B(0), CI => Ci, 
                           CO => add_1_root_add_51_2_carry_1_port, S => S(0));
   add_1_root_add_51_2_U1_1 : FA_X1 port map( A => A(1), B => B(1), CI => 
                           add_1_root_add_51_2_carry_1_port, CO => 
                           add_1_root_add_51_2_carry_2_port, S => S(1));
   add_1_root_add_51_2_U1_2 : FA_X1 port map( A => A(2), B => B(2), CI => 
                           add_1_root_add_51_2_carry_2_port, CO => 
                           add_1_root_add_51_2_carry_3_port, S => S(2));
   add_1_root_add_51_2_U1_3 : FA_X1 port map( A => A(3), B => B(3), CI => 
                           add_1_root_add_51_2_carry_3_port, CO => Co, S => 
                           S(3));

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_P4_ADDER.all;

entity RCA_NBITS4_9 is

   port( A, B : in std_logic_vector (3 downto 0);  Ci : in std_logic;  S : out 
         std_logic_vector (3 downto 0);  Co : out std_logic);

end RCA_NBITS4_9;

architecture SYN_BEHAVIORAL of RCA_NBITS4_9 is

   component FA_X1
      port( A, B, CI : in std_logic;  CO, S : out std_logic);
   end component;
   
   signal add_1_root_add_51_2_carry_1_port, add_1_root_add_51_2_carry_2_port, 
      add_1_root_add_51_2_carry_3_port : std_logic;

begin
   
   add_1_root_add_51_2_U1_0 : FA_X1 port map( A => A(0), B => B(0), CI => Ci, 
                           CO => add_1_root_add_51_2_carry_1_port, S => S(0));
   add_1_root_add_51_2_U1_1 : FA_X1 port map( A => A(1), B => B(1), CI => 
                           add_1_root_add_51_2_carry_1_port, CO => 
                           add_1_root_add_51_2_carry_2_port, S => S(1));
   add_1_root_add_51_2_U1_2 : FA_X1 port map( A => A(2), B => B(2), CI => 
                           add_1_root_add_51_2_carry_2_port, CO => 
                           add_1_root_add_51_2_carry_3_port, S => S(2));
   add_1_root_add_51_2_U1_3 : FA_X1 port map( A => A(3), B => B(3), CI => 
                           add_1_root_add_51_2_carry_3_port, CO => Co, S => 
                           S(3));

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_P4_ADDER.all;

entity RCA_NBITS4_8 is

   port( A, B : in std_logic_vector (3 downto 0);  Ci : in std_logic;  S : out 
         std_logic_vector (3 downto 0);  Co : out std_logic);

end RCA_NBITS4_8;

architecture SYN_BEHAVIORAL of RCA_NBITS4_8 is

   component FA_X1
      port( A, B, CI : in std_logic;  CO, S : out std_logic);
   end component;
   
   signal add_1_root_add_51_2_carry_1_port, add_1_root_add_51_2_carry_2_port, 
      add_1_root_add_51_2_carry_3_port : std_logic;

begin
   
   add_1_root_add_51_2_U1_0 : FA_X1 port map( A => A(0), B => B(0), CI => Ci, 
                           CO => add_1_root_add_51_2_carry_1_port, S => S(0));
   add_1_root_add_51_2_U1_1 : FA_X1 port map( A => A(1), B => B(1), CI => 
                           add_1_root_add_51_2_carry_1_port, CO => 
                           add_1_root_add_51_2_carry_2_port, S => S(1));
   add_1_root_add_51_2_U1_2 : FA_X1 port map( A => A(2), B => B(2), CI => 
                           add_1_root_add_51_2_carry_2_port, CO => 
                           add_1_root_add_51_2_carry_3_port, S => S(2));
   add_1_root_add_51_2_U1_3 : FA_X1 port map( A => A(3), B => B(3), CI => 
                           add_1_root_add_51_2_carry_3_port, CO => Co, S => 
                           S(3));

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_P4_ADDER.all;

entity RCA_NBITS4_7 is

   port( A, B : in std_logic_vector (3 downto 0);  Ci : in std_logic;  S : out 
         std_logic_vector (3 downto 0);  Co : out std_logic);

end RCA_NBITS4_7;

architecture SYN_BEHAVIORAL of RCA_NBITS4_7 is

   component FA_X1
      port( A, B, CI : in std_logic;  CO, S : out std_logic);
   end component;
   
   signal add_1_root_add_51_2_carry_1_port, add_1_root_add_51_2_carry_2_port, 
      add_1_root_add_51_2_carry_3_port : std_logic;

begin
   
   add_1_root_add_51_2_U1_0 : FA_X1 port map( A => A(0), B => B(0), CI => Ci, 
                           CO => add_1_root_add_51_2_carry_1_port, S => S(0));
   add_1_root_add_51_2_U1_1 : FA_X1 port map( A => A(1), B => B(1), CI => 
                           add_1_root_add_51_2_carry_1_port, CO => 
                           add_1_root_add_51_2_carry_2_port, S => S(1));
   add_1_root_add_51_2_U1_2 : FA_X1 port map( A => A(2), B => B(2), CI => 
                           add_1_root_add_51_2_carry_2_port, CO => 
                           add_1_root_add_51_2_carry_3_port, S => S(2));
   add_1_root_add_51_2_U1_3 : FA_X1 port map( A => A(3), B => B(3), CI => 
                           add_1_root_add_51_2_carry_3_port, CO => Co, S => 
                           S(3));

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_P4_ADDER.all;

entity RCA_NBITS4_6 is

   port( A, B : in std_logic_vector (3 downto 0);  Ci : in std_logic;  S : out 
         std_logic_vector (3 downto 0);  Co : out std_logic);

end RCA_NBITS4_6;

architecture SYN_BEHAVIORAL of RCA_NBITS4_6 is

   component FA_X1
      port( A, B, CI : in std_logic;  CO, S : out std_logic);
   end component;
   
   signal add_1_root_add_51_2_carry_1_port, add_1_root_add_51_2_carry_2_port, 
      add_1_root_add_51_2_carry_3_port : std_logic;

begin
   
   add_1_root_add_51_2_U1_0 : FA_X1 port map( A => A(0), B => B(0), CI => Ci, 
                           CO => add_1_root_add_51_2_carry_1_port, S => S(0));
   add_1_root_add_51_2_U1_1 : FA_X1 port map( A => A(1), B => B(1), CI => 
                           add_1_root_add_51_2_carry_1_port, CO => 
                           add_1_root_add_51_2_carry_2_port, S => S(1));
   add_1_root_add_51_2_U1_2 : FA_X1 port map( A => A(2), B => B(2), CI => 
                           add_1_root_add_51_2_carry_2_port, CO => 
                           add_1_root_add_51_2_carry_3_port, S => S(2));
   add_1_root_add_51_2_U1_3 : FA_X1 port map( A => A(3), B => B(3), CI => 
                           add_1_root_add_51_2_carry_3_port, CO => Co, S => 
                           S(3));

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_P4_ADDER.all;

entity RCA_NBITS4_5 is

   port( A, B : in std_logic_vector (3 downto 0);  Ci : in std_logic;  S : out 
         std_logic_vector (3 downto 0);  Co : out std_logic);

end RCA_NBITS4_5;

architecture SYN_BEHAVIORAL of RCA_NBITS4_5 is

   component FA_X1
      port( A, B, CI : in std_logic;  CO, S : out std_logic);
   end component;
   
   signal add_1_root_add_51_2_carry_1_port, add_1_root_add_51_2_carry_2_port, 
      add_1_root_add_51_2_carry_3_port : std_logic;

begin
   
   add_1_root_add_51_2_U1_0 : FA_X1 port map( A => A(0), B => B(0), CI => Ci, 
                           CO => add_1_root_add_51_2_carry_1_port, S => S(0));
   add_1_root_add_51_2_U1_1 : FA_X1 port map( A => A(1), B => B(1), CI => 
                           add_1_root_add_51_2_carry_1_port, CO => 
                           add_1_root_add_51_2_carry_2_port, S => S(1));
   add_1_root_add_51_2_U1_2 : FA_X1 port map( A => A(2), B => B(2), CI => 
                           add_1_root_add_51_2_carry_2_port, CO => 
                           add_1_root_add_51_2_carry_3_port, S => S(2));
   add_1_root_add_51_2_U1_3 : FA_X1 port map( A => A(3), B => B(3), CI => 
                           add_1_root_add_51_2_carry_3_port, CO => Co, S => 
                           S(3));

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_P4_ADDER.all;

entity RCA_NBITS4_4 is

   port( A, B : in std_logic_vector (3 downto 0);  Ci : in std_logic;  S : out 
         std_logic_vector (3 downto 0);  Co : out std_logic);

end RCA_NBITS4_4;

architecture SYN_BEHAVIORAL of RCA_NBITS4_4 is

   component FA_X1
      port( A, B, CI : in std_logic;  CO, S : out std_logic);
   end component;
   
   signal add_1_root_add_51_2_carry_1_port, add_1_root_add_51_2_carry_2_port, 
      add_1_root_add_51_2_carry_3_port : std_logic;

begin
   
   add_1_root_add_51_2_U1_0 : FA_X1 port map( A => A(0), B => B(0), CI => Ci, 
                           CO => add_1_root_add_51_2_carry_1_port, S => S(0));
   add_1_root_add_51_2_U1_1 : FA_X1 port map( A => A(1), B => B(1), CI => 
                           add_1_root_add_51_2_carry_1_port, CO => 
                           add_1_root_add_51_2_carry_2_port, S => S(1));
   add_1_root_add_51_2_U1_2 : FA_X1 port map( A => A(2), B => B(2), CI => 
                           add_1_root_add_51_2_carry_2_port, CO => 
                           add_1_root_add_51_2_carry_3_port, S => S(2));
   add_1_root_add_51_2_U1_3 : FA_X1 port map( A => A(3), B => B(3), CI => 
                           add_1_root_add_51_2_carry_3_port, CO => Co, S => 
                           S(3));

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_P4_ADDER.all;

entity RCA_NBITS4_3 is

   port( A, B : in std_logic_vector (3 downto 0);  Ci : in std_logic;  S : out 
         std_logic_vector (3 downto 0);  Co : out std_logic);

end RCA_NBITS4_3;

architecture SYN_BEHAVIORAL of RCA_NBITS4_3 is

   component FA_X1
      port( A, B, CI : in std_logic;  CO, S : out std_logic);
   end component;
   
   signal add_1_root_add_51_2_carry_1_port, add_1_root_add_51_2_carry_2_port, 
      add_1_root_add_51_2_carry_3_port : std_logic;

begin
   
   add_1_root_add_51_2_U1_0 : FA_X1 port map( A => A(0), B => B(0), CI => Ci, 
                           CO => add_1_root_add_51_2_carry_1_port, S => S(0));
   add_1_root_add_51_2_U1_1 : FA_X1 port map( A => A(1), B => B(1), CI => 
                           add_1_root_add_51_2_carry_1_port, CO => 
                           add_1_root_add_51_2_carry_2_port, S => S(1));
   add_1_root_add_51_2_U1_2 : FA_X1 port map( A => A(2), B => B(2), CI => 
                           add_1_root_add_51_2_carry_2_port, CO => 
                           add_1_root_add_51_2_carry_3_port, S => S(2));
   add_1_root_add_51_2_U1_3 : FA_X1 port map( A => A(3), B => B(3), CI => 
                           add_1_root_add_51_2_carry_3_port, CO => Co, S => 
                           S(3));

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_P4_ADDER.all;

entity RCA_NBITS4_2 is

   port( A, B : in std_logic_vector (3 downto 0);  Ci : in std_logic;  S : out 
         std_logic_vector (3 downto 0);  Co : out std_logic);

end RCA_NBITS4_2;

architecture SYN_BEHAVIORAL of RCA_NBITS4_2 is

   component FA_X1
      port( A, B, CI : in std_logic;  CO, S : out std_logic);
   end component;
   
   signal add_1_root_add_51_2_carry_1_port, add_1_root_add_51_2_carry_2_port, 
      add_1_root_add_51_2_carry_3_port : std_logic;

begin
   
   add_1_root_add_51_2_U1_0 : FA_X1 port map( A => A(0), B => B(0), CI => Ci, 
                           CO => add_1_root_add_51_2_carry_1_port, S => S(0));
   add_1_root_add_51_2_U1_1 : FA_X1 port map( A => A(1), B => B(1), CI => 
                           add_1_root_add_51_2_carry_1_port, CO => 
                           add_1_root_add_51_2_carry_2_port, S => S(1));
   add_1_root_add_51_2_U1_2 : FA_X1 port map( A => A(2), B => B(2), CI => 
                           add_1_root_add_51_2_carry_2_port, CO => 
                           add_1_root_add_51_2_carry_3_port, S => S(2));
   add_1_root_add_51_2_U1_3 : FA_X1 port map( A => A(3), B => B(3), CI => 
                           add_1_root_add_51_2_carry_3_port, CO => Co, S => 
                           S(3));

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_P4_ADDER.all;

entity RCA_NBITS4_1 is

   port( A, B : in std_logic_vector (3 downto 0);  Ci : in std_logic;  S : out 
         std_logic_vector (3 downto 0);  Co : out std_logic);

end RCA_NBITS4_1;

architecture SYN_BEHAVIORAL of RCA_NBITS4_1 is

   component FA_X1
      port( A, B, CI : in std_logic;  CO, S : out std_logic);
   end component;
   
   signal add_1_root_add_51_2_carry_1_port, add_1_root_add_51_2_carry_2_port, 
      add_1_root_add_51_2_carry_3_port : std_logic;

begin
   
   add_1_root_add_51_2_U1_0 : FA_X1 port map( A => A(0), B => B(0), CI => Ci, 
                           CO => add_1_root_add_51_2_carry_1_port, S => S(0));
   add_1_root_add_51_2_U1_1 : FA_X1 port map( A => A(1), B => B(1), CI => 
                           add_1_root_add_51_2_carry_1_port, CO => 
                           add_1_root_add_51_2_carry_2_port, S => S(1));
   add_1_root_add_51_2_U1_2 : FA_X1 port map( A => A(2), B => B(2), CI => 
                           add_1_root_add_51_2_carry_2_port, CO => 
                           add_1_root_add_51_2_carry_3_port, S => S(2));
   add_1_root_add_51_2_U1_3 : FA_X1 port map( A => A(3), B => B(3), CI => 
                           add_1_root_add_51_2_carry_3_port, CO => Co, S => 
                           S(3));

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_P4_ADDER.all;

entity CARRY_SELECT_N_BIT4_6 is

   port( Cin : in std_logic;  A, B : in std_logic_vector (3 downto 0);  S : out
         std_logic_vector (3 downto 0));

end CARRY_SELECT_N_BIT4_6;

architecture SYN_STRUCTURAL of CARRY_SELECT_N_BIT4_6 is

   component MUX21_NBIT4_6
      port( A, B : in std_logic_vector (3 downto 0);  SEL : in std_logic;  Y : 
            out std_logic_vector (3 downto 0));
   end component;
   
   component RCA_NBITS4_11
      port( A, B : in std_logic_vector (3 downto 0);  Ci : in std_logic;  S : 
            out std_logic_vector (3 downto 0);  Co : out std_logic);
   end component;
   
   component RCA_NBITS4_12
      port( A, B : in std_logic_vector (3 downto 0);  Ci : in std_logic;  S : 
            out std_logic_vector (3 downto 0);  Co : out std_logic);
   end component;
   
   signal X_Logic1_port, X_Logic0_port, S_Ci0_3_port, S_Ci0_2_port, 
      S_Ci0_1_port, S_Ci0_0_port, S_Ci1_3_port, S_Ci1_2_port, S_Ci1_1_port, 
      S_Ci1_0_port, n_1000, n_1001 : std_logic;

begin
   
   X_Logic1_port <= '1';
   X_Logic0_port <= '0';
   RCA_0 : RCA_NBITS4_12 port map( A(3) => A(3), A(2) => A(2), A(1) => A(1), 
                           A(0) => A(0), B(3) => B(3), B(2) => B(2), B(1) => 
                           B(1), B(0) => B(0), Ci => X_Logic0_port, S(3) => 
                           S_Ci0_3_port, S(2) => S_Ci0_2_port, S(1) => 
                           S_Ci0_1_port, S(0) => S_Ci0_0_port, Co => n_1000);
   RCA_1 : RCA_NBITS4_11 port map( A(3) => A(3), A(2) => A(2), A(1) => A(1), 
                           A(0) => A(0), B(3) => B(3), B(2) => B(2), B(1) => 
                           B(1), B(0) => B(0), Ci => X_Logic1_port, S(3) => 
                           S_Ci1_3_port, S(2) => S_Ci1_2_port, S(1) => 
                           S_Ci1_1_port, S(0) => S_Ci1_0_port, Co => n_1001);
   MUX_OUT : MUX21_NBIT4_6 port map( A(3) => S_Ci0_3_port, A(2) => S_Ci0_2_port
                           , A(1) => S_Ci0_1_port, A(0) => S_Ci0_0_port, B(3) 
                           => S_Ci1_3_port, B(2) => S_Ci1_2_port, B(1) => 
                           S_Ci1_1_port, B(0) => S_Ci1_0_port, SEL => Cin, Y(3)
                           => S(3), Y(2) => S(2), Y(1) => S(1), Y(0) => S(0));

end SYN_STRUCTURAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_P4_ADDER.all;

entity CARRY_SELECT_N_BIT4_5 is

   port( Cin : in std_logic;  A, B : in std_logic_vector (3 downto 0);  S : out
         std_logic_vector (3 downto 0));

end CARRY_SELECT_N_BIT4_5;

architecture SYN_STRUCTURAL of CARRY_SELECT_N_BIT4_5 is

   component MUX21_NBIT4_5
      port( A, B : in std_logic_vector (3 downto 0);  SEL : in std_logic;  Y : 
            out std_logic_vector (3 downto 0));
   end component;
   
   component RCA_NBITS4_9
      port( A, B : in std_logic_vector (3 downto 0);  Ci : in std_logic;  S : 
            out std_logic_vector (3 downto 0);  Co : out std_logic);
   end component;
   
   component RCA_NBITS4_10
      port( A, B : in std_logic_vector (3 downto 0);  Ci : in std_logic;  S : 
            out std_logic_vector (3 downto 0);  Co : out std_logic);
   end component;
   
   signal X_Logic1_port, X_Logic0_port, S_Ci0_3_port, S_Ci0_2_port, 
      S_Ci0_1_port, S_Ci0_0_port, S_Ci1_3_port, S_Ci1_2_port, S_Ci1_1_port, 
      S_Ci1_0_port, n_1002, n_1003 : std_logic;

begin
   
   X_Logic1_port <= '1';
   X_Logic0_port <= '0';
   RCA_0 : RCA_NBITS4_10 port map( A(3) => A(3), A(2) => A(2), A(1) => A(1), 
                           A(0) => A(0), B(3) => B(3), B(2) => B(2), B(1) => 
                           B(1), B(0) => B(0), Ci => X_Logic0_port, S(3) => 
                           S_Ci0_3_port, S(2) => S_Ci0_2_port, S(1) => 
                           S_Ci0_1_port, S(0) => S_Ci0_0_port, Co => n_1002);
   RCA_1 : RCA_NBITS4_9 port map( A(3) => A(3), A(2) => A(2), A(1) => A(1), 
                           A(0) => A(0), B(3) => B(3), B(2) => B(2), B(1) => 
                           B(1), B(0) => B(0), Ci => X_Logic1_port, S(3) => 
                           S_Ci1_3_port, S(2) => S_Ci1_2_port, S(1) => 
                           S_Ci1_1_port, S(0) => S_Ci1_0_port, Co => n_1003);
   MUX_OUT : MUX21_NBIT4_5 port map( A(3) => S_Ci0_3_port, A(2) => S_Ci0_2_port
                           , A(1) => S_Ci0_1_port, A(0) => S_Ci0_0_port, B(3) 
                           => S_Ci1_3_port, B(2) => S_Ci1_2_port, B(1) => 
                           S_Ci1_1_port, B(0) => S_Ci1_0_port, SEL => Cin, Y(3)
                           => S(3), Y(2) => S(2), Y(1) => S(1), Y(0) => S(0));

end SYN_STRUCTURAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_P4_ADDER.all;

entity CARRY_SELECT_N_BIT4_4 is

   port( Cin : in std_logic;  A, B : in std_logic_vector (3 downto 0);  S : out
         std_logic_vector (3 downto 0));

end CARRY_SELECT_N_BIT4_4;

architecture SYN_STRUCTURAL of CARRY_SELECT_N_BIT4_4 is

   component MUX21_NBIT4_4
      port( A, B : in std_logic_vector (3 downto 0);  SEL : in std_logic;  Y : 
            out std_logic_vector (3 downto 0));
   end component;
   
   component RCA_NBITS4_7
      port( A, B : in std_logic_vector (3 downto 0);  Ci : in std_logic;  S : 
            out std_logic_vector (3 downto 0);  Co : out std_logic);
   end component;
   
   component RCA_NBITS4_8
      port( A, B : in std_logic_vector (3 downto 0);  Ci : in std_logic;  S : 
            out std_logic_vector (3 downto 0);  Co : out std_logic);
   end component;
   
   signal X_Logic1_port, X_Logic0_port, S_Ci0_3_port, S_Ci0_2_port, 
      S_Ci0_1_port, S_Ci0_0_port, S_Ci1_3_port, S_Ci1_2_port, S_Ci1_1_port, 
      S_Ci1_0_port, n_1004, n_1005 : std_logic;

begin
   
   X_Logic1_port <= '1';
   X_Logic0_port <= '0';
   RCA_0 : RCA_NBITS4_8 port map( A(3) => A(3), A(2) => A(2), A(1) => A(1), 
                           A(0) => A(0), B(3) => B(3), B(2) => B(2), B(1) => 
                           B(1), B(0) => B(0), Ci => X_Logic0_port, S(3) => 
                           S_Ci0_3_port, S(2) => S_Ci0_2_port, S(1) => 
                           S_Ci0_1_port, S(0) => S_Ci0_0_port, Co => n_1004);
   RCA_1 : RCA_NBITS4_7 port map( A(3) => A(3), A(2) => A(2), A(1) => A(1), 
                           A(0) => A(0), B(3) => B(3), B(2) => B(2), B(1) => 
                           B(1), B(0) => B(0), Ci => X_Logic1_port, S(3) => 
                           S_Ci1_3_port, S(2) => S_Ci1_2_port, S(1) => 
                           S_Ci1_1_port, S(0) => S_Ci1_0_port, Co => n_1005);
   MUX_OUT : MUX21_NBIT4_4 port map( A(3) => S_Ci0_3_port, A(2) => S_Ci0_2_port
                           , A(1) => S_Ci0_1_port, A(0) => S_Ci0_0_port, B(3) 
                           => S_Ci1_3_port, B(2) => S_Ci1_2_port, B(1) => 
                           S_Ci1_1_port, B(0) => S_Ci1_0_port, SEL => Cin, Y(3)
                           => S(3), Y(2) => S(2), Y(1) => S(1), Y(0) => S(0));

end SYN_STRUCTURAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_P4_ADDER.all;

entity CARRY_SELECT_N_BIT4_3 is

   port( Cin : in std_logic;  A, B : in std_logic_vector (3 downto 0);  S : out
         std_logic_vector (3 downto 0));

end CARRY_SELECT_N_BIT4_3;

architecture SYN_STRUCTURAL of CARRY_SELECT_N_BIT4_3 is

   component MUX21_NBIT4_3
      port( A, B : in std_logic_vector (3 downto 0);  SEL : in std_logic;  Y : 
            out std_logic_vector (3 downto 0));
   end component;
   
   component RCA_NBITS4_5
      port( A, B : in std_logic_vector (3 downto 0);  Ci : in std_logic;  S : 
            out std_logic_vector (3 downto 0);  Co : out std_logic);
   end component;
   
   component RCA_NBITS4_6
      port( A, B : in std_logic_vector (3 downto 0);  Ci : in std_logic;  S : 
            out std_logic_vector (3 downto 0);  Co : out std_logic);
   end component;
   
   signal X_Logic1_port, X_Logic0_port, S_Ci0_3_port, S_Ci0_2_port, 
      S_Ci0_1_port, S_Ci0_0_port, S_Ci1_3_port, S_Ci1_2_port, S_Ci1_1_port, 
      S_Ci1_0_port, n_1006, n_1007 : std_logic;

begin
   
   X_Logic1_port <= '1';
   X_Logic0_port <= '0';
   RCA_0 : RCA_NBITS4_6 port map( A(3) => A(3), A(2) => A(2), A(1) => A(1), 
                           A(0) => A(0), B(3) => B(3), B(2) => B(2), B(1) => 
                           B(1), B(0) => B(0), Ci => X_Logic0_port, S(3) => 
                           S_Ci0_3_port, S(2) => S_Ci0_2_port, S(1) => 
                           S_Ci0_1_port, S(0) => S_Ci0_0_port, Co => n_1006);
   RCA_1 : RCA_NBITS4_5 port map( A(3) => A(3), A(2) => A(2), A(1) => A(1), 
                           A(0) => A(0), B(3) => B(3), B(2) => B(2), B(1) => 
                           B(1), B(0) => B(0), Ci => X_Logic1_port, S(3) => 
                           S_Ci1_3_port, S(2) => S_Ci1_2_port, S(1) => 
                           S_Ci1_1_port, S(0) => S_Ci1_0_port, Co => n_1007);
   MUX_OUT : MUX21_NBIT4_3 port map( A(3) => S_Ci0_3_port, A(2) => S_Ci0_2_port
                           , A(1) => S_Ci0_1_port, A(0) => S_Ci0_0_port, B(3) 
                           => S_Ci1_3_port, B(2) => S_Ci1_2_port, B(1) => 
                           S_Ci1_1_port, B(0) => S_Ci1_0_port, SEL => Cin, Y(3)
                           => S(3), Y(2) => S(2), Y(1) => S(1), Y(0) => S(0));

end SYN_STRUCTURAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_P4_ADDER.all;

entity CARRY_SELECT_N_BIT4_2 is

   port( Cin : in std_logic;  A, B : in std_logic_vector (3 downto 0);  S : out
         std_logic_vector (3 downto 0));

end CARRY_SELECT_N_BIT4_2;

architecture SYN_STRUCTURAL of CARRY_SELECT_N_BIT4_2 is

   component MUX21_NBIT4_2
      port( A, B : in std_logic_vector (3 downto 0);  SEL : in std_logic;  Y : 
            out std_logic_vector (3 downto 0));
   end component;
   
   component RCA_NBITS4_3
      port( A, B : in std_logic_vector (3 downto 0);  Ci : in std_logic;  S : 
            out std_logic_vector (3 downto 0);  Co : out std_logic);
   end component;
   
   component RCA_NBITS4_4
      port( A, B : in std_logic_vector (3 downto 0);  Ci : in std_logic;  S : 
            out std_logic_vector (3 downto 0);  Co : out std_logic);
   end component;
   
   signal X_Logic1_port, X_Logic0_port, S_Ci0_3_port, S_Ci0_2_port, 
      S_Ci0_1_port, S_Ci0_0_port, S_Ci1_3_port, S_Ci1_2_port, S_Ci1_1_port, 
      S_Ci1_0_port, n_1008, n_1009 : std_logic;

begin
   
   X_Logic1_port <= '1';
   X_Logic0_port <= '0';
   RCA_0 : RCA_NBITS4_4 port map( A(3) => A(3), A(2) => A(2), A(1) => A(1), 
                           A(0) => A(0), B(3) => B(3), B(2) => B(2), B(1) => 
                           B(1), B(0) => B(0), Ci => X_Logic0_port, S(3) => 
                           S_Ci0_3_port, S(2) => S_Ci0_2_port, S(1) => 
                           S_Ci0_1_port, S(0) => S_Ci0_0_port, Co => n_1008);
   RCA_1 : RCA_NBITS4_3 port map( A(3) => A(3), A(2) => A(2), A(1) => A(1), 
                           A(0) => A(0), B(3) => B(3), B(2) => B(2), B(1) => 
                           B(1), B(0) => B(0), Ci => X_Logic1_port, S(3) => 
                           S_Ci1_3_port, S(2) => S_Ci1_2_port, S(1) => 
                           S_Ci1_1_port, S(0) => S_Ci1_0_port, Co => n_1009);
   MUX_OUT : MUX21_NBIT4_2 port map( A(3) => S_Ci0_3_port, A(2) => S_Ci0_2_port
                           , A(1) => S_Ci0_1_port, A(0) => S_Ci0_0_port, B(3) 
                           => S_Ci1_3_port, B(2) => S_Ci1_2_port, B(1) => 
                           S_Ci1_1_port, B(0) => S_Ci1_0_port, SEL => Cin, Y(3)
                           => S(3), Y(2) => S(2), Y(1) => S(1), Y(0) => S(0));

end SYN_STRUCTURAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_P4_ADDER.all;

entity CARRY_SELECT_N_BIT4_1 is

   port( Cin : in std_logic;  A, B : in std_logic_vector (3 downto 0);  S : out
         std_logic_vector (3 downto 0));

end CARRY_SELECT_N_BIT4_1;

architecture SYN_STRUCTURAL of CARRY_SELECT_N_BIT4_1 is

   component MUX21_NBIT4_1
      port( A, B : in std_logic_vector (3 downto 0);  SEL : in std_logic;  Y : 
            out std_logic_vector (3 downto 0));
   end component;
   
   component RCA_NBITS4_1
      port( A, B : in std_logic_vector (3 downto 0);  Ci : in std_logic;  S : 
            out std_logic_vector (3 downto 0);  Co : out std_logic);
   end component;
   
   component RCA_NBITS4_2
      port( A, B : in std_logic_vector (3 downto 0);  Ci : in std_logic;  S : 
            out std_logic_vector (3 downto 0);  Co : out std_logic);
   end component;
   
   signal X_Logic1_port, X_Logic0_port, S_Ci0_3_port, S_Ci0_2_port, 
      S_Ci0_1_port, S_Ci0_0_port, S_Ci1_3_port, S_Ci1_2_port, S_Ci1_1_port, 
      S_Ci1_0_port, n_1010, n_1011 : std_logic;

begin
   
   X_Logic1_port <= '1';
   X_Logic0_port <= '0';
   RCA_0 : RCA_NBITS4_2 port map( A(3) => A(3), A(2) => A(2), A(1) => A(1), 
                           A(0) => A(0), B(3) => B(3), B(2) => B(2), B(1) => 
                           B(1), B(0) => B(0), Ci => X_Logic0_port, S(3) => 
                           S_Ci0_3_port, S(2) => S_Ci0_2_port, S(1) => 
                           S_Ci0_1_port, S(0) => S_Ci0_0_port, Co => n_1010);
   RCA_1 : RCA_NBITS4_1 port map( A(3) => A(3), A(2) => A(2), A(1) => A(1), 
                           A(0) => A(0), B(3) => B(3), B(2) => B(2), B(1) => 
                           B(1), B(0) => B(0), Ci => X_Logic1_port, S(3) => 
                           S_Ci1_3_port, S(2) => S_Ci1_2_port, S(1) => 
                           S_Ci1_1_port, S(0) => S_Ci1_0_port, Co => n_1011);
   MUX_OUT : MUX21_NBIT4_1 port map( A(3) => S_Ci0_3_port, A(2) => S_Ci0_2_port
                           , A(1) => S_Ci0_1_port, A(0) => S_Ci0_0_port, B(3) 
                           => S_Ci1_3_port, B(2) => S_Ci1_2_port, B(1) => 
                           S_Ci1_1_port, B(0) => S_Ci1_0_port, SEL => Cin, Y(3)
                           => S(3), Y(2) => S(2), Y(1) => S(1), Y(0) => S(0));

end SYN_STRUCTURAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_P4_ADDER.all;

entity PG_26 is

   port( pik, gik, pik_1, gik_1 : in std_logic;  pij, gij : out std_logic);

end PG_26;

architecture SYN_behavioral of PG_26 is

   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component AOI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n3 : std_logic;

begin
   
   U1 : INV_X1 port map( A => n3, ZN => gij);
   U2 : AOI21_X1 port map( B1 => gik_1, B2 => pik, A => gik, ZN => n3);
   U3 : AND2_X1 port map( A1 => pik_1, A2 => pik, ZN => pij);

end SYN_behavioral;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_P4_ADDER.all;

entity PG_25 is

   port( pik, gik, pik_1, gik_1 : in std_logic;  pij, gij : out std_logic);

end PG_25;

architecture SYN_behavioral of PG_25 is

   component AOI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n3 : std_logic;

begin
   
   U1 : INV_X1 port map( A => n3, ZN => gij);
   U2 : AND2_X1 port map( A1 => pik, A2 => pik_1, ZN => pij);
   U3 : AOI21_X1 port map( B1 => pik, B2 => gik_1, A => gik, ZN => n3);

end SYN_behavioral;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_P4_ADDER.all;

entity PG_24 is

   port( pik, gik, pik_1, gik_1 : in std_logic;  pij, gij : out std_logic);

end PG_24;

architecture SYN_behavioral of PG_24 is

   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component AOI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n3 : std_logic;

begin
   
   U1 : INV_X1 port map( A => n3, ZN => gij);
   U2 : AOI21_X1 port map( B1 => gik_1, B2 => pik, A => gik, ZN => n3);
   U3 : AND2_X1 port map( A1 => pik_1, A2 => pik, ZN => pij);

end SYN_behavioral;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_P4_ADDER.all;

entity PG_23 is

   port( pik, gik, pik_1, gik_1 : in std_logic;  pij, gij : out std_logic);

end PG_23;

architecture SYN_behavioral of PG_23 is

   component AOI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n3 : std_logic;

begin
   
   U1 : INV_X1 port map( A => n3, ZN => gij);
   U2 : AND2_X1 port map( A1 => pik, A2 => pik_1, ZN => pij);
   U3 : AOI21_X1 port map( B1 => pik, B2 => gik_1, A => gik, ZN => n3);

end SYN_behavioral;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_P4_ADDER.all;

entity PG_22 is

   port( pik, gik, pik_1, gik_1 : in std_logic;  pij, gij : out std_logic);

end PG_22;

architecture SYN_behavioral of PG_22 is

   component AOI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n3 : std_logic;

begin
   
   U1 : AND2_X1 port map( A1 => pik_1, A2 => pik, ZN => pij);
   U2 : INV_X1 port map( A => n3, ZN => gij);
   U3 : AOI21_X1 port map( B1 => gik_1, B2 => pik, A => gik, ZN => n3);

end SYN_behavioral;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_P4_ADDER.all;

entity PG_21 is

   port( pik, gik, pik_1, gik_1 : in std_logic;  pij, gij : out std_logic);

end PG_21;

architecture SYN_behavioral of PG_21 is

   component AOI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n3 : std_logic;

begin
   
   U1 : INV_X1 port map( A => n3, ZN => gij);
   U2 : AND2_X1 port map( A1 => pik, A2 => pik_1, ZN => pij);
   U3 : AOI21_X1 port map( B1 => pik, B2 => gik_1, A => gik, ZN => n3);

end SYN_behavioral;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_P4_ADDER.all;

entity PG_20 is

   port( pik, gik, pik_1, gik_1 : in std_logic;  pij, gij : out std_logic);

end PG_20;

architecture SYN_behavioral of PG_20 is

   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component AOI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n3 : std_logic;

begin
   
   U1 : INV_X1 port map( A => n3, ZN => gij);
   U2 : AOI21_X1 port map( B1 => gik_1, B2 => pik, A => gik, ZN => n3);
   U3 : AND2_X1 port map( A1 => pik_1, A2 => pik, ZN => pij);

end SYN_behavioral;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_P4_ADDER.all;

entity PG_19 is

   port( pik, gik, pik_1, gik_1 : in std_logic;  pij, gij : out std_logic);

end PG_19;

architecture SYN_behavioral of PG_19 is

   component AOI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n3 : std_logic;

begin
   
   U1 : INV_X1 port map( A => n3, ZN => gij);
   U2 : AND2_X1 port map( A1 => pik_1, A2 => pik, ZN => pij);
   U3 : AOI21_X1 port map( B1 => pik, B2 => gik_1, A => gik, ZN => n3);

end SYN_behavioral;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_P4_ADDER.all;

entity PG_18 is

   port( pik, gik, pik_1, gik_1 : in std_logic;  pij, gij : out std_logic);

end PG_18;

architecture SYN_behavioral of PG_18 is

   component AOI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n3 : std_logic;

begin
   
   U1 : INV_X1 port map( A => n3, ZN => gij);
   U2 : AND2_X1 port map( A1 => pik_1, A2 => pik, ZN => pij);
   U3 : AOI21_X1 port map( B1 => gik_1, B2 => pik, A => gik, ZN => n3);

end SYN_behavioral;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_P4_ADDER.all;

entity PG_17 is

   port( pik, gik, pik_1, gik_1 : in std_logic;  pij, gij : out std_logic);

end PG_17;

architecture SYN_behavioral of PG_17 is

   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component AOI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n3 : std_logic;

begin
   
   U1 : INV_X1 port map( A => n3, ZN => gij);
   U2 : AOI21_X1 port map( B1 => pik, B2 => gik_1, A => gik, ZN => n3);
   U3 : AND2_X1 port map( A1 => pik, A2 => pik_1, ZN => pij);

end SYN_behavioral;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_P4_ADDER.all;

entity PG_16 is

   port( pik, gik, pik_1, gik_1 : in std_logic;  pij, gij : out std_logic);

end PG_16;

architecture SYN_behavioral of PG_16 is

   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component AOI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n3 : std_logic;

begin
   
   U1 : INV_X1 port map( A => n3, ZN => gij);
   U2 : AOI21_X1 port map( B1 => gik_1, B2 => pik, A => gik, ZN => n3);
   U3 : AND2_X1 port map( A1 => pik_1, A2 => pik, ZN => pij);

end SYN_behavioral;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_P4_ADDER.all;

entity PG_15 is

   port( pik, gik, pik_1, gik_1 : in std_logic;  pij, gij : out std_logic);

end PG_15;

architecture SYN_behavioral of PG_15 is

   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component AOI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n3 : std_logic;

begin
   
   U1 : INV_X1 port map( A => n3, ZN => gij);
   U2 : AOI21_X1 port map( B1 => gik_1, B2 => pik, A => gik, ZN => n3);
   U3 : AND2_X1 port map( A1 => pik_1, A2 => pik, ZN => pij);

end SYN_behavioral;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_P4_ADDER.all;

entity PG_14 is

   port( pik, gik, pik_1, gik_1 : in std_logic;  pij, gij : out std_logic);

end PG_14;

architecture SYN_behavioral of PG_14 is

   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component AOI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n3 : std_logic;

begin
   
   U1 : INV_X1 port map( A => n3, ZN => gij);
   U2 : AOI21_X1 port map( B1 => gik_1, B2 => pik, A => gik, ZN => n3);
   U3 : AND2_X1 port map( A1 => pik_1, A2 => pik, ZN => pij);

end SYN_behavioral;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_P4_ADDER.all;

entity PG_13 is

   port( pik, gik, pik_1, gik_1 : in std_logic;  pij, gij : out std_logic);

end PG_13;

architecture SYN_behavioral of PG_13 is

   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component AOI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n3 : std_logic;

begin
   
   U1 : INV_X1 port map( A => n3, ZN => gij);
   U2 : AOI21_X1 port map( B1 => gik_1, B2 => pik, A => gik, ZN => n3);
   U3 : AND2_X1 port map( A1 => pik_1, A2 => pik, ZN => pij);

end SYN_behavioral;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_P4_ADDER.all;

entity PG_12 is

   port( pik, gik, pik_1, gik_1 : in std_logic;  pij, gij : out std_logic);

end PG_12;

architecture SYN_behavioral of PG_12 is

   component AOI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n3 : std_logic;

begin
   
   U1 : AND2_X1 port map( A1 => pik_1, A2 => pik, ZN => pij);
   U2 : INV_X1 port map( A => n3, ZN => gij);
   U3 : AOI21_X1 port map( B1 => gik_1, B2 => pik, A => gik, ZN => n3);

end SYN_behavioral;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_P4_ADDER.all;

entity PG_11 is

   port( pik, gik, pik_1, gik_1 : in std_logic;  pij, gij : out std_logic);

end PG_11;

architecture SYN_behavioral of PG_11 is

   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component AOI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n3 : std_logic;

begin
   
   U1 : AOI21_X1 port map( B1 => gik_1, B2 => pik, A => gik, ZN => n3);
   U2 : AND2_X1 port map( A1 => pik_1, A2 => pik, ZN => pij);
   U3 : INV_X1 port map( A => n3, ZN => gij);

end SYN_behavioral;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_P4_ADDER.all;

entity PG_10 is

   port( pik, gik, pik_1, gik_1 : in std_logic;  pij, gij : out std_logic);

end PG_10;

architecture SYN_behavioral of PG_10 is

   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component AOI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n3 : std_logic;

begin
   
   U1 : AOI21_X1 port map( B1 => gik_1, B2 => pik, A => gik, ZN => n3);
   U2 : AND2_X1 port map( A1 => pik_1, A2 => pik, ZN => pij);
   U3 : INV_X1 port map( A => n3, ZN => gij);

end SYN_behavioral;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_P4_ADDER.all;

entity PG_9 is

   port( pik, gik, pik_1, gik_1 : in std_logic;  pij, gij : out std_logic);

end PG_9;

architecture SYN_behavioral of PG_9 is

   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component AOI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n3 : std_logic;

begin
   
   U1 : INV_X1 port map( A => n3, ZN => gij);
   U2 : AOI21_X1 port map( B1 => gik_1, B2 => pik, A => gik, ZN => n3);
   U3 : AND2_X1 port map( A1 => pik_1, A2 => pik, ZN => pij);

end SYN_behavioral;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_P4_ADDER.all;

entity PG_8 is

   port( pik, gik, pik_1, gik_1 : in std_logic;  pij, gij : out std_logic);

end PG_8;

architecture SYN_behavioral of PG_8 is

   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component AOI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n3 : std_logic;

begin
   
   U1 : INV_X1 port map( A => n3, ZN => gij);
   U2 : AOI21_X1 port map( B1 => gik_1, B2 => pik, A => gik, ZN => n3);
   U3 : AND2_X1 port map( A1 => pik_1, A2 => pik, ZN => pij);

end SYN_behavioral;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_P4_ADDER.all;

entity PG_7 is

   port( pik, gik, pik_1, gik_1 : in std_logic;  pij, gij : out std_logic);

end PG_7;

architecture SYN_behavioral of PG_7 is

   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component AOI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n3 : std_logic;

begin
   
   U1 : INV_X1 port map( A => n3, ZN => gij);
   U2 : AOI21_X1 port map( B1 => gik_1, B2 => pik, A => gik, ZN => n3);
   U3 : AND2_X1 port map( A1 => pik_1, A2 => pik, ZN => pij);

end SYN_behavioral;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_P4_ADDER.all;

entity PG_6 is

   port( pik, gik, pik_1, gik_1 : in std_logic;  pij, gij : out std_logic);

end PG_6;

architecture SYN_behavioral of PG_6 is

   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component AOI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n3 : std_logic;

begin
   
   U1 : INV_X1 port map( A => n3, ZN => gij);
   U2 : AOI21_X1 port map( B1 => gik_1, B2 => pik, A => gik, ZN => n3);
   U3 : AND2_X1 port map( A1 => pik_1, A2 => pik, ZN => pij);

end SYN_behavioral;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_P4_ADDER.all;

entity PG_5 is

   port( pik, gik, pik_1, gik_1 : in std_logic;  pij, gij : out std_logic);

end PG_5;

architecture SYN_behavioral of PG_5 is

   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n4, n5 : std_logic;

begin
   
   U1 : INV_X1 port map( A => gik, ZN => n4);
   U2 : AND2_X1 port map( A1 => pik_1, A2 => pik, ZN => pij);
   U3 : NAND2_X1 port map( A1 => n4, A2 => n5, ZN => gij);
   U4 : NAND2_X1 port map( A1 => gik_1, A2 => pik, ZN => n5);

end SYN_behavioral;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_P4_ADDER.all;

entity PG_4 is

   port( pik, gik, pik_1, gik_1 : in std_logic;  pij, gij : out std_logic);

end PG_4;

architecture SYN_behavioral of PG_4 is

   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component AOI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n3 : std_logic;

begin
   
   U1 : AOI21_X1 port map( B1 => gik_1, B2 => pik, A => gik, ZN => n3);
   U2 : AND2_X1 port map( A1 => pik_1, A2 => pik, ZN => pij);
   U3 : INV_X1 port map( A => n3, ZN => gij);

end SYN_behavioral;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_P4_ADDER.all;

entity PG_3 is

   port( pik, gik, pik_1, gik_1 : in std_logic;  pij, gij : out std_logic);

end PG_3;

architecture SYN_behavioral of PG_3 is

   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component AOI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n3 : std_logic;

begin
   
   U1 : INV_X1 port map( A => n3, ZN => gij);
   U2 : AOI21_X1 port map( B1 => gik_1, B2 => pik, A => gik, ZN => n3);
   U3 : AND2_X1 port map( A1 => pik_1, A2 => pik, ZN => pij);

end SYN_behavioral;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_P4_ADDER.all;

entity PG_2 is

   port( pik, gik, pik_1, gik_1 : in std_logic;  pij, gij : out std_logic);

end PG_2;

architecture SYN_behavioral of PG_2 is

   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n4, n5 : std_logic;

begin
   
   U1 : INV_X1 port map( A => gik, ZN => n4);
   U2 : AND2_X1 port map( A1 => pik_1, A2 => pik, ZN => pij);
   U3 : NAND2_X1 port map( A1 => gik_1, A2 => pik, ZN => n5);
   U4 : NAND2_X1 port map( A1 => n5, A2 => n4, ZN => gij);

end SYN_behavioral;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_P4_ADDER.all;

entity PG_1 is

   port( pik, gik, pik_1, gik_1 : in std_logic;  pij, gij : out std_logic);

end PG_1;

architecture SYN_behavioral of PG_1 is

   component AOI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n3 : std_logic;

begin
   
   U1 : AND2_X1 port map( A1 => pik_1, A2 => pik, ZN => pij);
   U2 : INV_X1 port map( A => n3, ZN => gij);
   U3 : AOI21_X1 port map( B1 => gik_1, B2 => pik, A => gik, ZN => n3);

end SYN_behavioral;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_P4_ADDER.all;

entity G_8 is

   port( pik, gik, gik_1 : in std_logic;  gij : out std_logic);

end G_8;

architecture SYN_behavioral of G_8 is

   component AOI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n3 : std_logic;

begin
   
   U1 : INV_X1 port map( A => n3, ZN => gij);
   U2 : AOI21_X1 port map( B1 => pik, B2 => gik_1, A => gik, ZN => n3);

end SYN_behavioral;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_P4_ADDER.all;

entity G_7 is

   port( pik, gik, gik_1 : in std_logic;  gij : out std_logic);

end G_7;

architecture SYN_behavioral of G_7 is

   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n3, n4 : std_logic;

begin
   
   U1 : INV_X1 port map( A => gik, ZN => n3);
   U2 : NAND2_X1 port map( A1 => gik_1, A2 => pik, ZN => n4);
   U3 : NAND2_X1 port map( A1 => n4, A2 => n3, ZN => gij);

end SYN_behavioral;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_P4_ADDER.all;

entity G_6 is

   port( pik, gik, gik_1 : in std_logic;  gij : out std_logic);

end G_6;

architecture SYN_behavioral of G_6 is

   component AOI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n3 : std_logic;

begin
   
   U1 : INV_X1 port map( A => n3, ZN => gij);
   U2 : AOI21_X1 port map( B1 => pik, B2 => gik_1, A => gik, ZN => n3);

end SYN_behavioral;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_P4_ADDER.all;

entity G_5 is

   port( pik, gik, gik_1 : in std_logic;  gij : out std_logic);

end G_5;

architecture SYN_behavioral of G_5 is

   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n3, n4 : std_logic;

begin
   
   U1 : NAND2_X1 port map( A1 => n3, A2 => n4, ZN => gij);
   U2 : NAND2_X1 port map( A1 => gik_1, A2 => pik, ZN => n4);
   U3 : INV_X1 port map( A => gik, ZN => n3);

end SYN_behavioral;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_P4_ADDER.all;

entity G_4 is

   port( pik, gik, gik_1 : in std_logic;  gij : out std_logic);

end G_4;

architecture SYN_behavioral of G_4 is

   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n3, n4 : std_logic;

begin
   
   U1 : INV_X1 port map( A => gik, ZN => n3);
   U2 : NAND2_X1 port map( A1 => gik_1, A2 => pik, ZN => n4);
   U3 : NAND2_X1 port map( A1 => n3, A2 => n4, ZN => gij);

end SYN_behavioral;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_P4_ADDER.all;

entity G_3 is

   port( pik, gik, gik_1 : in std_logic;  gij : out std_logic);

end G_3;

architecture SYN_behavioral of G_3 is

   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n3, n4 : std_logic;

begin
   
   U1 : INV_X1 port map( A => gik, ZN => n3);
   U2 : NAND2_X1 port map( A1 => n4, A2 => n3, ZN => gij);
   U3 : NAND2_X1 port map( A1 => gik_1, A2 => pik, ZN => n4);

end SYN_behavioral;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_P4_ADDER.all;

entity G_2 is

   port( pik, gik, gik_1 : in std_logic;  gij : out std_logic);

end G_2;

architecture SYN_behavioral of G_2 is

   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n3, n4 : std_logic;

begin
   
   U1 : INV_X1 port map( A => gik, ZN => n3);
   U2 : NAND2_X1 port map( A1 => gik_1, A2 => pik, ZN => n4);
   U3 : NAND2_X1 port map( A1 => n3, A2 => n4, ZN => gij);

end SYN_behavioral;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_P4_ADDER.all;

entity G_1 is

   port( pik, gik, gik_1 : in std_logic;  gij : out std_logic);

end G_1;

architecture SYN_behavioral of G_1 is

   component AOI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n3 : std_logic;

begin
   
   U1 : INV_X1 port map( A => n3, ZN => gij);
   U2 : AOI21_X1 port map( B1 => pik, B2 => gik_1, A => gik, ZN => n3);

end SYN_behavioral;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_P4_ADDER.all;

entity MUX21_NBIT4_0 is

   port( A, B : in std_logic_vector (3 downto 0);  SEL : in std_logic;  Y : out
         std_logic_vector (3 downto 0));

end MUX21_NBIT4_0;

architecture SYN_BEHAVIORAL of MUX21_NBIT4_0 is

   component AOI22_X1
      port( A1, A2, B1, B2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n5, n6, n7, n8, n9 : std_logic;

begin
   
   U1 : INV_X1 port map( A => SEL, ZN => n5);
   U2 : INV_X1 port map( A => n6, ZN => Y(3));
   U3 : AOI22_X1 port map( A1 => A(3), A2 => n5, B1 => SEL, B2 => B(3), ZN => 
                           n6);
   U4 : INV_X1 port map( A => n8, ZN => Y(1));
   U5 : AOI22_X1 port map( A1 => A(1), A2 => n5, B1 => B(1), B2 => SEL, ZN => 
                           n8);
   U6 : INV_X1 port map( A => n7, ZN => Y(2));
   U7 : AOI22_X1 port map( A1 => A(2), A2 => n5, B1 => B(2), B2 => SEL, ZN => 
                           n7);
   U8 : INV_X1 port map( A => n9, ZN => Y(0));
   U9 : AOI22_X1 port map( A1 => A(0), A2 => n5, B1 => B(0), B2 => SEL, ZN => 
                           n9);

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_P4_ADDER.all;

entity RCA_NBITS4_0 is

   port( A, B : in std_logic_vector (3 downto 0);  Ci : in std_logic;  S : out 
         std_logic_vector (3 downto 0);  Co : out std_logic);

end RCA_NBITS4_0;

architecture SYN_BEHAVIORAL of RCA_NBITS4_0 is

   component FA_X1
      port( A, B, CI : in std_logic;  CO, S : out std_logic);
   end component;
   
   signal add_1_root_add_51_2_carry_1_port, add_1_root_add_51_2_carry_2_port, 
      add_1_root_add_51_2_carry_3_port : std_logic;

begin
   
   add_1_root_add_51_2_U1_0 : FA_X1 port map( A => A(0), B => B(0), CI => Ci, 
                           CO => add_1_root_add_51_2_carry_1_port, S => S(0));
   add_1_root_add_51_2_U1_1 : FA_X1 port map( A => A(1), B => B(1), CI => 
                           add_1_root_add_51_2_carry_1_port, CO => 
                           add_1_root_add_51_2_carry_2_port, S => S(1));
   add_1_root_add_51_2_U1_2 : FA_X1 port map( A => A(2), B => B(2), CI => 
                           add_1_root_add_51_2_carry_2_port, CO => 
                           add_1_root_add_51_2_carry_3_port, S => S(2));
   add_1_root_add_51_2_U1_3 : FA_X1 port map( A => A(3), B => B(3), CI => 
                           add_1_root_add_51_2_carry_3_port, CO => Co, S => 
                           S(3));

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_P4_ADDER.all;

entity CARRY_SELECT_N_BIT4_7 is

   port( Cin : in std_logic;  A, B : in std_logic_vector (3 downto 0);  S : out
         std_logic_vector (3 downto 0));

end CARRY_SELECT_N_BIT4_7;

architecture SYN_STRUCTURAL of CARRY_SELECT_N_BIT4_7 is

   component MUX21_NBIT4_7
      port( A, B : in std_logic_vector (3 downto 0);  SEL : in std_logic;  Y : 
            out std_logic_vector (3 downto 0));
   end component;
   
   component RCA_NBITS4_13
      port( A, B : in std_logic_vector (3 downto 0);  Ci : in std_logic;  S : 
            out std_logic_vector (3 downto 0);  Co : out std_logic);
   end component;
   
   component RCA_NBITS4_14
      port( A, B : in std_logic_vector (3 downto 0);  Ci : in std_logic;  S : 
            out std_logic_vector (3 downto 0);  Co : out std_logic);
   end component;
   
   signal X_Logic1_port, X_Logic0_port, S_Ci0_3_port, S_Ci0_2_port, 
      S_Ci0_1_port, S_Ci0_0_port, S_Ci1_3_port, S_Ci1_2_port, S_Ci1_1_port, 
      S_Ci1_0_port, n_1012, n_1013 : std_logic;

begin
   
   X_Logic1_port <= '1';
   X_Logic0_port <= '0';
   RCA_0 : RCA_NBITS4_14 port map( A(3) => A(3), A(2) => A(2), A(1) => A(1), 
                           A(0) => A(0), B(3) => B(3), B(2) => B(2), B(1) => 
                           B(1), B(0) => B(0), Ci => X_Logic0_port, S(3) => 
                           S_Ci0_3_port, S(2) => S_Ci0_2_port, S(1) => 
                           S_Ci0_1_port, S(0) => S_Ci0_0_port, Co => n_1012);
   RCA_1 : RCA_NBITS4_13 port map( A(3) => A(3), A(2) => A(2), A(1) => A(1), 
                           A(0) => A(0), B(3) => B(3), B(2) => B(2), B(1) => 
                           B(1), B(0) => B(0), Ci => X_Logic1_port, S(3) => 
                           S_Ci1_3_port, S(2) => S_Ci1_2_port, S(1) => 
                           S_Ci1_1_port, S(0) => S_Ci1_0_port, Co => n_1013);
   MUX_OUT : MUX21_NBIT4_7 port map( A(3) => S_Ci0_3_port, A(2) => S_Ci0_2_port
                           , A(1) => S_Ci0_1_port, A(0) => S_Ci0_0_port, B(3) 
                           => S_Ci1_3_port, B(2) => S_Ci1_2_port, B(1) => 
                           S_Ci1_1_port, B(0) => S_Ci1_0_port, SEL => Cin, Y(3)
                           => S(3), Y(2) => S(2), Y(1) => S(1), Y(0) => S(0));

end SYN_STRUCTURAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_P4_ADDER.all;

entity CARRY_SELECT_N_BIT4_0 is

   port( Cin : in std_logic;  A, B : in std_logic_vector (3 downto 0);  S : out
         std_logic_vector (3 downto 0));

end CARRY_SELECT_N_BIT4_0;

architecture SYN_STRUCTURAL of CARRY_SELECT_N_BIT4_0 is

   component MUX21_NBIT4_0
      port( A, B : in std_logic_vector (3 downto 0);  SEL : in std_logic;  Y : 
            out std_logic_vector (3 downto 0));
   end component;
   
   component RCA_NBITS4_15
      port( A, B : in std_logic_vector (3 downto 0);  Ci : in std_logic;  S : 
            out std_logic_vector (3 downto 0);  Co : out std_logic);
   end component;
   
   component RCA_NBITS4_0
      port( A, B : in std_logic_vector (3 downto 0);  Ci : in std_logic;  S : 
            out std_logic_vector (3 downto 0);  Co : out std_logic);
   end component;
   
   signal X_Logic1_port, X_Logic0_port, S_Ci0_3_port, S_Ci0_2_port, 
      S_Ci0_1_port, S_Ci0_0_port, S_Ci1_3_port, S_Ci1_2_port, S_Ci1_1_port, 
      S_Ci1_0_port, n_1014, n_1015 : std_logic;

begin
   
   X_Logic1_port <= '1';
   X_Logic0_port <= '0';
   RCA_0 : RCA_NBITS4_0 port map( A(3) => A(3), A(2) => A(2), A(1) => A(1), 
                           A(0) => A(0), B(3) => B(3), B(2) => B(2), B(1) => 
                           B(1), B(0) => B(0), Ci => X_Logic0_port, S(3) => 
                           S_Ci0_3_port, S(2) => S_Ci0_2_port, S(1) => 
                           S_Ci0_1_port, S(0) => S_Ci0_0_port, Co => n_1014);
   RCA_1 : RCA_NBITS4_15 port map( A(3) => A(3), A(2) => A(2), A(1) => A(1), 
                           A(0) => A(0), B(3) => B(3), B(2) => B(2), B(1) => 
                           B(1), B(0) => B(0), Ci => X_Logic1_port, S(3) => 
                           S_Ci1_3_port, S(2) => S_Ci1_2_port, S(1) => 
                           S_Ci1_1_port, S(0) => S_Ci1_0_port, Co => n_1015);
   MUX_OUT : MUX21_NBIT4_0 port map( A(3) => S_Ci0_3_port, A(2) => S_Ci0_2_port
                           , A(1) => S_Ci0_1_port, A(0) => S_Ci0_0_port, B(3) 
                           => S_Ci1_3_port, B(2) => S_Ci1_2_port, B(1) => 
                           S_Ci1_1_port, B(0) => S_Ci1_0_port, SEL => Cin, Y(3)
                           => S(3), Y(2) => S(2), Y(1) => S(1), Y(0) => S(0));

end SYN_STRUCTURAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_P4_ADDER.all;

entity PG_0 is

   port( pik, gik, pik_1, gik_1 : in std_logic;  pij, gij : out std_logic);

end PG_0;

architecture SYN_behavioral of PG_0 is

   component AOI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n2 : std_logic;

begin
   
   U1 : INV_X1 port map( A => n2, ZN => gij);
   U2 : AND2_X1 port map( A1 => pik_1, A2 => pik, ZN => pij);
   U3 : AOI21_X1 port map( B1 => pik, B2 => gik_1, A => gik, ZN => n2);

end SYN_behavioral;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_P4_ADDER.all;

entity G_0 is

   port( pik, gik, gik_1 : in std_logic;  gij : out std_logic);

end G_0;

architecture SYN_behavioral of G_0 is

   component AOI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n2 : std_logic;

begin
   
   U1 : INV_X1 port map( A => n2, ZN => gij);
   U2 : AOI21_X1 port map( B1 => pik, B2 => gik_1, A => gik, ZN => n2);

end SYN_behavioral;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_P4_ADDER.all;

entity SUM_GENERATOR_NBIT_PER_BLOCK4_NBLOCKS8 is

   port( A, B : in std_logic_vector (31 downto 0);  Ci : in std_logic_vector (7
         downto 0);  S : out std_logic_vector (31 downto 0));

end SUM_GENERATOR_NBIT_PER_BLOCK4_NBLOCKS8;

architecture SYN_STRUCTURAL of SUM_GENERATOR_NBIT_PER_BLOCK4_NBLOCKS8 is

   component CARRY_SELECT_N_BIT4_1
      port( Cin : in std_logic;  A, B : in std_logic_vector (3 downto 0);  S : 
            out std_logic_vector (3 downto 0));
   end component;
   
   component CARRY_SELECT_N_BIT4_2
      port( Cin : in std_logic;  A, B : in std_logic_vector (3 downto 0);  S : 
            out std_logic_vector (3 downto 0));
   end component;
   
   component CARRY_SELECT_N_BIT4_3
      port( Cin : in std_logic;  A, B : in std_logic_vector (3 downto 0);  S : 
            out std_logic_vector (3 downto 0));
   end component;
   
   component CARRY_SELECT_N_BIT4_4
      port( Cin : in std_logic;  A, B : in std_logic_vector (3 downto 0);  S : 
            out std_logic_vector (3 downto 0));
   end component;
   
   component CARRY_SELECT_N_BIT4_5
      port( Cin : in std_logic;  A, B : in std_logic_vector (3 downto 0);  S : 
            out std_logic_vector (3 downto 0));
   end component;
   
   component CARRY_SELECT_N_BIT4_6
      port( Cin : in std_logic;  A, B : in std_logic_vector (3 downto 0);  S : 
            out std_logic_vector (3 downto 0));
   end component;
   
   component CARRY_SELECT_N_BIT4_7
      port( Cin : in std_logic;  A, B : in std_logic_vector (3 downto 0);  S : 
            out std_logic_vector (3 downto 0));
   end component;
   
   component CARRY_SELECT_N_BIT4_0
      port( Cin : in std_logic;  A, B : in std_logic_vector (3 downto 0);  S : 
            out std_logic_vector (3 downto 0));
   end component;

begin
   
   CS_I_1 : CARRY_SELECT_N_BIT4_0 port map( Cin => Ci(0), A(3) => A(3), A(2) =>
                           A(2), A(1) => A(1), A(0) => A(0), B(3) => B(3), B(2)
                           => B(2), B(1) => B(1), B(0) => B(0), S(3) => S(3), 
                           S(2) => S(2), S(1) => S(1), S(0) => S(0));
   CS_I_2 : CARRY_SELECT_N_BIT4_7 port map( Cin => Ci(1), A(3) => A(7), A(2) =>
                           A(6), A(1) => A(5), A(0) => A(4), B(3) => B(7), B(2)
                           => B(6), B(1) => B(5), B(0) => B(4), S(3) => S(7), 
                           S(2) => S(6), S(1) => S(5), S(0) => S(4));
   CS_I_3 : CARRY_SELECT_N_BIT4_6 port map( Cin => Ci(2), A(3) => A(11), A(2) 
                           => A(10), A(1) => A(9), A(0) => A(8), B(3) => B(11),
                           B(2) => B(10), B(1) => B(9), B(0) => B(8), S(3) => 
                           S(11), S(2) => S(10), S(1) => S(9), S(0) => S(8));
   CS_I_4 : CARRY_SELECT_N_BIT4_5 port map( Cin => Ci(3), A(3) => A(15), A(2) 
                           => A(14), A(1) => A(13), A(0) => A(12), B(3) => 
                           B(15), B(2) => B(14), B(1) => B(13), B(0) => B(12), 
                           S(3) => S(15), S(2) => S(14), S(1) => S(13), S(0) =>
                           S(12));
   CS_I_5 : CARRY_SELECT_N_BIT4_4 port map( Cin => Ci(4), A(3) => A(19), A(2) 
                           => A(18), A(1) => A(17), A(0) => A(16), B(3) => 
                           B(19), B(2) => B(18), B(1) => B(17), B(0) => B(16), 
                           S(3) => S(19), S(2) => S(18), S(1) => S(17), S(0) =>
                           S(16));
   CS_I_6 : CARRY_SELECT_N_BIT4_3 port map( Cin => Ci(5), A(3) => A(23), A(2) 
                           => A(22), A(1) => A(21), A(0) => A(20), B(3) => 
                           B(23), B(2) => B(22), B(1) => B(21), B(0) => B(20), 
                           S(3) => S(23), S(2) => S(22), S(1) => S(21), S(0) =>
                           S(20));
   CS_I_7 : CARRY_SELECT_N_BIT4_2 port map( Cin => Ci(6), A(3) => A(27), A(2) 
                           => A(26), A(1) => A(25), A(0) => A(24), B(3) => 
                           B(27), B(2) => B(26), B(1) => B(25), B(0) => B(24), 
                           S(3) => S(27), S(2) => S(26), S(1) => S(25), S(0) =>
                           S(24));
   CS_I_8 : CARRY_SELECT_N_BIT4_1 port map( Cin => Ci(7), A(3) => A(31), A(2) 
                           => A(30), A(1) => A(29), A(0) => A(28), B(3) => 
                           B(31), B(2) => B(30), B(1) => B(29), B(0) => B(28), 
                           S(3) => S(31), S(2) => S(30), S(1) => S(29), S(0) =>
                           S(28));

end SYN_STRUCTURAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_P4_ADDER.all;

entity CARRY_GENERATOR_NBIT32_NBIT_PER_BLOCK4 is

   port( A, B : in std_logic_vector (31 downto 0);  Cin : in std_logic;  Co : 
         out std_logic_vector (8 downto 0));

end CARRY_GENERATOR_NBIT32_NBIT_PER_BLOCK4;

architecture SYN_structural of CARRY_GENERATOR_NBIT32_NBIT_PER_BLOCK4 is

   component CLKBUF_X1
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component BUF_X1
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   component BUF_X2
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   component XOR2_X1
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   component G_1
      port( pik, gik, gik_1 : in std_logic;  gij : out std_logic);
   end component;
   
   component G_2
      port( pik, gik, gik_1 : in std_logic;  gij : out std_logic);
   end component;
   
   component G_3
      port( pik, gik, gik_1 : in std_logic;  gij : out std_logic);
   end component;
   
   component G_4
      port( pik, gik, gik_1 : in std_logic;  gij : out std_logic);
   end component;
   
   component PG_1
      port( pik, gik, pik_1, gik_1 : in std_logic;  pij, gij : out std_logic);
   end component;
   
   component PG_2
      port( pik, gik, pik_1, gik_1 : in std_logic;  pij, gij : out std_logic);
   end component;
   
   component G_5
      port( pik, gik, gik_1 : in std_logic;  gij : out std_logic);
   end component;
   
   component G_6
      port( pik, gik, gik_1 : in std_logic;  gij : out std_logic);
   end component;
   
   component PG_3
      port( pik, gik, pik_1, gik_1 : in std_logic;  pij, gij : out std_logic);
   end component;
   
   component PG_4
      port( pik, gik, pik_1, gik_1 : in std_logic;  pij, gij : out std_logic);
   end component;
   
   component PG_5
      port( pik, gik, pik_1, gik_1 : in std_logic;  pij, gij : out std_logic);
   end component;
   
   component G_7
      port( pik, gik, gik_1 : in std_logic;  gij : out std_logic);
   end component;
   
   component PG_6
      port( pik, gik, pik_1, gik_1 : in std_logic;  pij, gij : out std_logic);
   end component;
   
   component PG_7
      port( pik, gik, pik_1, gik_1 : in std_logic;  pij, gij : out std_logic);
   end component;
   
   component PG_8
      port( pik, gik, pik_1, gik_1 : in std_logic;  pij, gij : out std_logic);
   end component;
   
   component PG_9
      port( pik, gik, pik_1, gik_1 : in std_logic;  pij, gij : out std_logic);
   end component;
   
   component PG_10
      port( pik, gik, pik_1, gik_1 : in std_logic;  pij, gij : out std_logic);
   end component;
   
   component PG_11
      port( pik, gik, pik_1, gik_1 : in std_logic;  pij, gij : out std_logic);
   end component;
   
   component PG_12
      port( pik, gik, pik_1, gik_1 : in std_logic;  pij, gij : out std_logic);
   end component;
   
   component G_8
      port( pik, gik, gik_1 : in std_logic;  gij : out std_logic);
   end component;
   
   component PG_13
      port( pik, gik, pik_1, gik_1 : in std_logic;  pij, gij : out std_logic);
   end component;
   
   component PG_14
      port( pik, gik, pik_1, gik_1 : in std_logic;  pij, gij : out std_logic);
   end component;
   
   component PG_15
      port( pik, gik, pik_1, gik_1 : in std_logic;  pij, gij : out std_logic);
   end component;
   
   component PG_16
      port( pik, gik, pik_1, gik_1 : in std_logic;  pij, gij : out std_logic);
   end component;
   
   component PG_17
      port( pik, gik, pik_1, gik_1 : in std_logic;  pij, gij : out std_logic);
   end component;
   
   component PG_18
      port( pik, gik, pik_1, gik_1 : in std_logic;  pij, gij : out std_logic);
   end component;
   
   component PG_19
      port( pik, gik, pik_1, gik_1 : in std_logic;  pij, gij : out std_logic);
   end component;
   
   component PG_20
      port( pik, gik, pik_1, gik_1 : in std_logic;  pij, gij : out std_logic);
   end component;
   
   component PG_21
      port( pik, gik, pik_1, gik_1 : in std_logic;  pij, gij : out std_logic);
   end component;
   
   component PG_22
      port( pik, gik, pik_1, gik_1 : in std_logic;  pij, gij : out std_logic);
   end component;
   
   component PG_23
      port( pik, gik, pik_1, gik_1 : in std_logic;  pij, gij : out std_logic);
   end component;
   
   component PG_24
      port( pik, gik, pik_1, gik_1 : in std_logic;  pij, gij : out std_logic);
   end component;
   
   component PG_25
      port( pik, gik, pik_1, gik_1 : in std_logic;  pij, gij : out std_logic);
   end component;
   
   component PG_26
      port( pik, gik, pik_1, gik_1 : in std_logic;  pij, gij : out std_logic);
   end component;
   
   component PG_0
      port( pik, gik, pik_1, gik_1 : in std_logic;  pij, gij : out std_logic);
   end component;
   
   component G_0
      port( pik, gik, gik_1 : in std_logic;  gij : out std_logic);
   end component;
   
   signal Co_8_port, Co_7_port, Co_6_port, Co_5_port, n27, Co_3_port, n28, n29,
      G_s_5_31_port, G_s_5_30_port, G_s_5_29_port, G_s_5_28_port, G_s_5_27_port
      , G_s_5_26_port, G_s_5_25_port, G_s_5_24_port, G_s_5_23_port, 
      G_s_5_22_port, G_s_5_21_port, G_s_5_20_port, G_s_5_19_port, G_s_5_18_port
      , G_s_5_17_port, G_s_5_16_port, G_s_5_15_port, G_s_5_14_port, 
      G_s_5_13_port, G_s_5_12_port, G_s_5_11_port, G_s_5_10_port, G_s_5_9_port,
      G_s_5_8_port, G_s_5_7_port, G_s_5_6_port, G_s_5_5_port, G_s_5_4_port, 
      G_s_5_3_port, G_s_5_2_port, G_s_5_1_port, G_s_4_15_port, G_s_4_14_port, 
      G_s_4_13_port, G_s_4_12_port, G_s_4_11_port, G_s_4_10_port, G_s_4_9_port,
      G_s_4_8_port, G_s_4_7_port, G_s_4_6_port, G_s_4_5_port, G_s_4_4_port, 
      G_s_4_3_port, G_s_4_2_port, G_s_4_1_port, G_s_4_0_port, G_s_3_7_port, 
      G_s_3_6_port, G_s_3_5_port, G_s_3_4_port, G_s_3_3_port, G_s_3_2_port, 
      G_s_3_1_port, G_s_2_7_port, G_s_2_5_port, G_s_2_3_port, G_s_1_7_port, 
      G_s_1_6_port, P_s_5_31_port, P_s_5_30_port, P_s_5_29_port, P_s_5_28_port,
      P_s_5_27_port, P_s_5_26_port, P_s_5_25_port, P_s_5_24_port, P_s_5_23_port
      , P_s_5_22_port, P_s_5_21_port, P_s_5_20_port, P_s_5_19_port, 
      P_s_5_18_port, P_s_5_17_port, P_s_5_16_port, P_s_5_15_port, P_s_5_14_port
      , P_s_5_13_port, P_s_5_12_port, P_s_5_11_port, P_s_5_10_port, 
      P_s_5_9_port, P_s_5_8_port, P_s_5_7_port, P_s_5_6_port, P_s_5_5_port, 
      P_s_5_4_port, P_s_5_3_port, P_s_5_2_port, P_s_5_1_port, P_s_4_15_port, 
      P_s_4_14_port, P_s_4_13_port, P_s_4_12_port, P_s_4_11_port, P_s_4_10_port
      , P_s_4_9_port, P_s_4_8_port, P_s_4_7_port, P_s_4_6_port, P_s_4_5_port, 
      P_s_4_4_port, P_s_4_3_port, P_s_4_2_port, P_s_4_1_port, P_s_3_7_port, 
      P_s_3_6_port, P_s_3_5_port, P_s_3_4_port, P_s_3_3_port, P_s_3_2_port, 
      P_s_3_1_port, P_s_2_7_port, P_s_2_5_port, P_s_2_3_port, P_s_1_7_port, 
      P_s_1_6_port, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14
      , n15, n16, n17, n18, n19, Co_2_port, n21, n22, n23, n24, Co_4_port, 
      Co_1_port : std_logic;

begin
   Co <= ( Co_8_port, Co_7_port, Co_6_port, Co_5_port, Co_4_port, Co_3_port, 
      Co_2_port, Co_1_port, Cin );
   
   G_GEN_1_5_0 : G_0 port map( pik => P_s_5_1_port, gik => G_s_5_1_port, gik_1 
                           => Cin, gij => G_s_4_0_port);
   PG_GEN_1_5_1 : PG_0 port map( pik => P_s_5_3_port, gik => G_s_5_3_port, 
                           pik_1 => P_s_5_2_port, gik_1 => G_s_5_2_port, pij =>
                           P_s_4_1_port, gij => G_s_4_1_port);
   PG_GEN_1_5_2 : PG_26 port map( pik => P_s_5_5_port, gik => G_s_5_5_port, 
                           pik_1 => P_s_5_4_port, gik_1 => G_s_5_4_port, pij =>
                           P_s_4_2_port, gij => G_s_4_2_port);
   PG_GEN_1_5_3 : PG_25 port map( pik => P_s_5_7_port, gik => G_s_5_7_port, 
                           pik_1 => P_s_5_6_port, gik_1 => G_s_5_6_port, pij =>
                           P_s_4_3_port, gij => G_s_4_3_port);
   PG_GEN_1_5_4 : PG_24 port map( pik => P_s_5_9_port, gik => G_s_5_9_port, 
                           pik_1 => P_s_5_8_port, gik_1 => G_s_5_8_port, pij =>
                           P_s_4_4_port, gij => G_s_4_4_port);
   PG_GEN_1_5_5 : PG_23 port map( pik => P_s_5_11_port, gik => G_s_5_11_port, 
                           pik_1 => P_s_5_10_port, gik_1 => G_s_5_10_port, pij 
                           => P_s_4_5_port, gij => G_s_4_5_port);
   PG_GEN_1_5_6 : PG_22 port map( pik => P_s_5_13_port, gik => G_s_5_13_port, 
                           pik_1 => P_s_5_12_port, gik_1 => G_s_5_12_port, pij 
                           => P_s_4_6_port, gij => G_s_4_6_port);
   PG_GEN_1_5_7 : PG_21 port map( pik => P_s_5_15_port, gik => G_s_5_15_port, 
                           pik_1 => P_s_5_14_port, gik_1 => G_s_5_14_port, pij 
                           => P_s_4_7_port, gij => G_s_4_7_port);
   PG_GEN_1_5_8 : PG_20 port map( pik => P_s_5_17_port, gik => G_s_5_17_port, 
                           pik_1 => P_s_5_16_port, gik_1 => G_s_5_16_port, pij 
                           => P_s_4_8_port, gij => G_s_4_8_port);
   PG_GEN_1_5_9 : PG_19 port map( pik => P_s_5_19_port, gik => G_s_5_19_port, 
                           pik_1 => P_s_5_18_port, gik_1 => G_s_5_18_port, pij 
                           => P_s_4_9_port, gij => G_s_4_9_port);
   PG_GEN_1_5_10 : PG_18 port map( pik => P_s_5_21_port, gik => G_s_5_21_port, 
                           pik_1 => P_s_5_20_port, gik_1 => G_s_5_20_port, pij 
                           => P_s_4_10_port, gij => G_s_4_10_port);
   PG_GEN_1_5_11 : PG_17 port map( pik => P_s_5_23_port, gik => G_s_5_23_port, 
                           pik_1 => P_s_5_22_port, gik_1 => G_s_5_22_port, pij 
                           => P_s_4_11_port, gij => G_s_4_11_port);
   PG_GEN_1_5_12 : PG_16 port map( pik => P_s_5_25_port, gik => G_s_5_25_port, 
                           pik_1 => P_s_5_24_port, gik_1 => G_s_5_24_port, pij 
                           => P_s_4_12_port, gij => G_s_4_12_port);
   PG_GEN_1_5_13 : PG_15 port map( pik => P_s_5_27_port, gik => G_s_5_27_port, 
                           pik_1 => P_s_5_26_port, gik_1 => G_s_5_26_port, pij 
                           => P_s_4_13_port, gij => G_s_4_13_port);
   PG_GEN_1_5_14 : PG_14 port map( pik => P_s_5_29_port, gik => G_s_5_29_port, 
                           pik_1 => P_s_5_28_port, gik_1 => G_s_5_28_port, pij 
                           => P_s_4_14_port, gij => G_s_4_14_port);
   PG_GEN_1_5_15 : PG_13 port map( pik => P_s_5_31_port, gik => G_s_5_31_port, 
                           pik_1 => P_s_5_30_port, gik_1 => G_s_5_30_port, pij 
                           => P_s_4_15_port, gij => G_s_4_15_port);
   G_GEN_1_4_0 : G_8 port map( pik => P_s_4_1_port, gik => G_s_4_1_port, gik_1 
                           => G_s_4_0_port, gij => n29);
   PG_GEN_1_4_1 : PG_12 port map( pik => P_s_4_3_port, gik => G_s_4_3_port, 
                           pik_1 => P_s_4_2_port, gik_1 => G_s_4_2_port, pij =>
                           P_s_3_1_port, gij => G_s_3_1_port);
   PG_GEN_1_4_2 : PG_11 port map( pik => P_s_4_5_port, gik => G_s_4_5_port, 
                           pik_1 => P_s_4_4_port, gik_1 => G_s_4_4_port, pij =>
                           P_s_3_2_port, gij => G_s_3_2_port);
   PG_GEN_1_4_3 : PG_10 port map( pik => P_s_4_7_port, gik => G_s_4_7_port, 
                           pik_1 => P_s_4_6_port, gik_1 => G_s_4_6_port, pij =>
                           P_s_3_3_port, gij => G_s_3_3_port);
   PG_GEN_1_4_4 : PG_9 port map( pik => P_s_4_9_port, gik => G_s_4_9_port, 
                           pik_1 => P_s_4_8_port, gik_1 => G_s_4_8_port, pij =>
                           P_s_3_4_port, gij => G_s_3_4_port);
   PG_GEN_1_4_5 : PG_8 port map( pik => P_s_4_11_port, gik => G_s_4_11_port, 
                           pik_1 => P_s_4_10_port, gik_1 => G_s_4_10_port, pij 
                           => P_s_3_5_port, gij => G_s_3_5_port);
   PG_GEN_1_4_6 : PG_7 port map( pik => P_s_4_13_port, gik => G_s_4_13_port, 
                           pik_1 => P_s_4_12_port, gik_1 => G_s_4_12_port, pij 
                           => P_s_3_6_port, gij => G_s_3_6_port);
   PG_GEN_1_4_7 : PG_6 port map( pik => P_s_4_15_port, gik => G_s_4_15_port, 
                           pik_1 => P_s_4_14_port, gik_1 => G_s_4_14_port, pij 
                           => P_s_3_7_port, gij => G_s_3_7_port);
   G_GEN_2_3_0_0 : G_7 port map( pik => P_s_3_1_port, gik => G_s_3_1_port, 
                           gik_1 => n29, gij => n28);
   PG_GEN_2_3_1_0 : PG_5 port map( pik => P_s_3_3_port, gik => G_s_3_3_port, 
                           pik_1 => P_s_3_2_port, gik_1 => G_s_3_2_port, pij =>
                           P_s_2_3_port, gij => G_s_2_3_port);
   PG_GEN_2_3_2_0 : PG_4 port map( pik => P_s_3_5_port, gik => G_s_3_5_port, 
                           pik_1 => P_s_3_4_port, gik_1 => G_s_3_4_port, pij =>
                           P_s_2_5_port, gij => G_s_2_5_port);
   PG_GEN_2_3_3_0 : PG_3 port map( pik => P_s_3_7_port, gik => G_s_3_7_port, 
                           pik_1 => P_s_3_6_port, gik_1 => G_s_3_6_port, pij =>
                           P_s_2_7_port, gij => G_s_2_7_port);
   G_GEN_2_2_0_0 : G_6 port map( pik => P_s_3_2_port, gik => G_s_3_2_port, 
                           gik_1 => n6, gij => Co_3_port);
   G_GEN_2_2_0_1 : G_5 port map( pik => P_s_2_3_port, gik => G_s_2_3_port, 
                           gik_1 => n28, gij => n27);
   PG_GEN_2_2_1_0 : PG_2 port map( pik => P_s_3_6_port, gik => G_s_3_6_port, 
                           pik_1 => P_s_2_5_port, gik_1 => G_s_2_5_port, pij =>
                           P_s_1_6_port, gij => G_s_1_6_port);
   PG_GEN_2_2_1_1 : PG_1 port map( pik => P_s_2_7_port, gik => G_s_2_7_port, 
                           pik_1 => P_s_2_5_port, gik_1 => n11, pij => 
                           P_s_1_7_port, gij => G_s_1_7_port);
   G_GEN_2_1_0_0 : G_4 port map( pik => P_s_3_4_port, gik => G_s_3_4_port, 
                           gik_1 => n27, gij => Co_5_port);
   G_GEN_2_1_0_1 : G_3 port map( pik => P_s_2_5_port, gik => n11, gik_1 => n27,
                           gij => Co_6_port);
   G_GEN_2_1_0_2 : G_2 port map( pik => P_s_1_6_port, gik => G_s_1_6_port, 
                           gik_1 => n27, gij => Co_7_port);
   G_GEN_2_1_0_3 : G_1 port map( pik => P_s_1_7_port, gik => G_s_1_7_port, 
                           gik_1 => n1, gij => Co_8_port);
   U32 : XOR2_X1 port map( A => B(9), B => A(9), Z => P_s_5_9_port);
   U33 : XOR2_X1 port map( A => B(8), B => A(8), Z => P_s_5_8_port);
   U35 : XOR2_X1 port map( A => B(6), B => A(6), Z => P_s_5_6_port);
   U36 : XOR2_X1 port map( A => B(5), B => A(5), Z => P_s_5_5_port);
   U37 : XOR2_X1 port map( A => B(4), B => A(4), Z => P_s_5_4_port);
   U39 : XOR2_X1 port map( A => B(31), B => A(31), Z => P_s_5_31_port);
   U40 : XOR2_X1 port map( A => B(30), B => A(30), Z => P_s_5_30_port);
   U41 : XOR2_X1 port map( A => B(2), B => A(2), Z => P_s_5_2_port);
   U42 : XOR2_X1 port map( A => B(29), B => A(29), Z => P_s_5_29_port);
   U43 : XOR2_X1 port map( A => B(28), B => A(28), Z => P_s_5_28_port);
   U44 : XOR2_X1 port map( A => B(27), B => A(27), Z => P_s_5_27_port);
   U45 : XOR2_X1 port map( A => B(26), B => A(26), Z => P_s_5_26_port);
   U46 : XOR2_X1 port map( A => B(25), B => A(25), Z => P_s_5_25_port);
   U47 : XOR2_X1 port map( A => B(24), B => A(24), Z => P_s_5_24_port);
   U49 : XOR2_X1 port map( A => B(22), B => A(22), Z => P_s_5_22_port);
   U50 : XOR2_X1 port map( A => B(21), B => A(21), Z => P_s_5_21_port);
   U51 : XOR2_X1 port map( A => B(20), B => A(20), Z => P_s_5_20_port);
   U52 : XOR2_X1 port map( A => B(1), B => A(1), Z => P_s_5_1_port);
   U54 : XOR2_X1 port map( A => B(18), B => A(18), Z => P_s_5_18_port);
   U55 : XOR2_X1 port map( A => B(17), B => A(17), Z => P_s_5_17_port);
   U56 : XOR2_X1 port map( A => B(16), B => A(16), Z => P_s_5_16_port);
   U58 : XOR2_X1 port map( A => B(14), B => A(14), Z => P_s_5_14_port);
   U59 : XOR2_X1 port map( A => B(13), B => A(13), Z => P_s_5_13_port);
   U60 : XOR2_X1 port map( A => B(12), B => A(12), Z => P_s_5_12_port);
   U61 : XOR2_X1 port map( A => B(11), B => A(11), Z => P_s_5_11_port);
   U62 : XOR2_X1 port map( A => B(10), B => A(10), Z => P_s_5_10_port);
   U1 : BUF_X2 port map( A => n27, Z => Co_4_port);
   U2 : CLKBUF_X1 port map( A => n27, Z => n1);
   U3 : NAND2_X1 port map( A1 => B(19), A2 => n3, ZN => n4);
   U4 : NAND2_X1 port map( A1 => n2, A2 => A(19), ZN => n5);
   U5 : NAND2_X1 port map( A1 => n4, A2 => n5, ZN => P_s_5_19_port);
   U6 : INV_X1 port map( A => B(19), ZN => n2);
   U7 : INV_X1 port map( A => A(19), ZN => n3);
   U8 : BUF_X1 port map( A => n28, Z => n6);
   U9 : NAND2_X1 port map( A1 => B(3), A2 => n8, ZN => n9);
   U10 : NAND2_X1 port map( A1 => n7, A2 => A(3), ZN => n10);
   U11 : NAND2_X1 port map( A1 => n9, A2 => n10, ZN => P_s_5_3_port);
   U12 : INV_X1 port map( A => B(3), ZN => n7);
   U13 : INV_X1 port map( A => A(3), ZN => n8);
   U14 : CLKBUF_X1 port map( A => G_s_2_5_port, Z => n11);
   U15 : NAND2_X1 port map( A1 => n13, A2 => B(23), ZN => n14);
   U16 : NAND2_X1 port map( A1 => n12, A2 => A(23), ZN => n15);
   U17 : NAND2_X1 port map( A1 => n14, A2 => n15, ZN => P_s_5_23_port);
   U18 : INV_X1 port map( A => B(23), ZN => n12);
   U19 : INV_X1 port map( A => A(23), ZN => n13);
   U20 : NAND2_X1 port map( A1 => n17, A2 => B(15), ZN => n18);
   U21 : NAND2_X1 port map( A1 => n16, A2 => A(15), ZN => n19);
   U22 : NAND2_X1 port map( A1 => n19, A2 => n18, ZN => P_s_5_15_port);
   U23 : INV_X1 port map( A => B(15), ZN => n16);
   U24 : INV_X1 port map( A => A(15), ZN => n17);
   U25 : CLKBUF_X1 port map( A => n6, Z => Co_2_port);
   U26 : NAND2_X1 port map( A1 => n22, A2 => B(7), ZN => n23);
   U27 : NAND2_X1 port map( A1 => n21, A2 => A(7), ZN => n24);
   U28 : NAND2_X1 port map( A1 => n24, A2 => n23, ZN => P_s_5_7_port);
   U29 : INV_X1 port map( A => B(7), ZN => n21);
   U30 : INV_X1 port map( A => A(7), ZN => n22);
   U31 : AND2_X1 port map( A1 => B(10), A2 => A(10), ZN => G_s_5_10_port);
   U34 : AND2_X1 port map( A1 => B(11), A2 => A(11), ZN => G_s_5_11_port);
   U38 : AND2_X1 port map( A1 => B(6), A2 => A(6), ZN => G_s_5_6_port);
   U48 : AND2_X1 port map( A1 => B(2), A2 => A(2), ZN => G_s_5_2_port);
   U53 : AND2_X1 port map( A1 => B(3), A2 => A(3), ZN => G_s_5_3_port);
   U57 : AND2_X1 port map( A1 => B(1), A2 => A(1), ZN => G_s_5_1_port);
   U63 : AND2_X1 port map( A1 => B(18), A2 => A(18), ZN => G_s_5_18_port);
   U64 : AND2_X1 port map( A1 => B(19), A2 => A(19), ZN => G_s_5_19_port);
   U65 : AND2_X1 port map( A1 => B(14), A2 => A(14), ZN => G_s_5_14_port);
   U66 : AND2_X1 port map( A1 => B(15), A2 => A(15), ZN => G_s_5_15_port);
   U67 : AND2_X1 port map( A1 => B(16), A2 => A(16), ZN => G_s_5_16_port);
   U68 : AND2_X1 port map( A1 => B(17), A2 => A(17), ZN => G_s_5_17_port);
   U69 : AND2_X1 port map( A1 => B(8), A2 => A(8), ZN => G_s_5_8_port);
   U70 : AND2_X1 port map( A1 => B(9), A2 => A(9), ZN => G_s_5_9_port);
   U71 : AND2_X1 port map( A1 => B(26), A2 => A(26), ZN => G_s_5_26_port);
   U72 : AND2_X1 port map( A1 => B(27), A2 => A(27), ZN => G_s_5_27_port);
   U73 : AND2_X1 port map( A1 => B(24), A2 => A(24), ZN => G_s_5_24_port);
   U74 : AND2_X1 port map( A1 => B(25), A2 => A(25), ZN => G_s_5_25_port);
   U75 : AND2_X1 port map( A1 => B(30), A2 => A(30), ZN => G_s_5_30_port);
   U76 : AND2_X1 port map( A1 => B(31), A2 => A(31), ZN => G_s_5_31_port);
   U77 : AND2_X1 port map( A1 => B(22), A2 => A(22), ZN => G_s_5_22_port);
   U78 : AND2_X1 port map( A1 => B(23), A2 => A(23), ZN => G_s_5_23_port);
   U79 : AND2_X1 port map( A1 => B(29), A2 => A(29), ZN => G_s_5_29_port);
   U80 : AND2_X1 port map( A1 => B(28), A2 => A(28), ZN => G_s_5_28_port);
   U81 : AND2_X1 port map( A1 => B(20), A2 => A(20), ZN => G_s_5_20_port);
   U82 : AND2_X1 port map( A1 => B(21), A2 => A(21), ZN => G_s_5_21_port);
   U83 : AND2_X1 port map( A1 => B(12), A2 => A(12), ZN => G_s_5_12_port);
   U84 : AND2_X1 port map( A1 => B(13), A2 => A(13), ZN => G_s_5_13_port);
   U85 : AND2_X1 port map( A1 => B(4), A2 => A(4), ZN => G_s_5_4_port);
   U86 : AND2_X1 port map( A1 => B(5), A2 => A(5), ZN => G_s_5_5_port);
   U87 : AND2_X1 port map( A1 => B(7), A2 => A(7), ZN => G_s_5_7_port);
   U88 : CLKBUF_X1 port map( A => n29, Z => Co_1_port);

end SYN_structural;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_P4_ADDER.all;

entity P4_ADDER is

   port( A, B : in std_logic_vector (31 downto 0);  Cin : in std_logic;  S : 
         out std_logic_vector (31 downto 0);  Co : out std_logic);

end P4_ADDER;

architecture SYN_STRUCTURAL of P4_ADDER is

   component SUM_GENERATOR_NBIT_PER_BLOCK4_NBLOCKS8
      port( A, B : in std_logic_vector (31 downto 0);  Ci : in std_logic_vector
            (7 downto 0);  S : out std_logic_vector (31 downto 0));
   end component;
   
   component CARRY_GENERATOR_NBIT32_NBIT_PER_BLOCK4
      port( A, B : in std_logic_vector (31 downto 0);  Cin : in std_logic;  Co 
            : out std_logic_vector (8 downto 0));
   end component;
   
   signal int_carry_7_port, int_carry_6_port, int_carry_5_port, 
      int_carry_4_port, int_carry_3_port, int_carry_2_port, int_carry_1_port, 
      int_carry_0_port : std_logic;

begin
   
   CLA_U : CARRY_GENERATOR_NBIT32_NBIT_PER_BLOCK4 port map( A(31) => A(31), 
                           A(30) => A(30), A(29) => A(29), A(28) => A(28), 
                           A(27) => A(27), A(26) => A(26), A(25) => A(25), 
                           A(24) => A(24), A(23) => A(23), A(22) => A(22), 
                           A(21) => A(21), A(20) => A(20), A(19) => A(19), 
                           A(18) => A(18), A(17) => A(17), A(16) => A(16), 
                           A(15) => A(15), A(14) => A(14), A(13) => A(13), 
                           A(12) => A(12), A(11) => A(11), A(10) => A(10), A(9)
                           => A(9), A(8) => A(8), A(7) => A(7), A(6) => A(6), 
                           A(5) => A(5), A(4) => A(4), A(3) => A(3), A(2) => 
                           A(2), A(1) => A(1), A(0) => A(0), B(31) => B(31), 
                           B(30) => B(30), B(29) => B(29), B(28) => B(28), 
                           B(27) => B(27), B(26) => B(26), B(25) => B(25), 
                           B(24) => B(24), B(23) => B(23), B(22) => B(22), 
                           B(21) => B(21), B(20) => B(20), B(19) => B(19), 
                           B(18) => B(18), B(17) => B(17), B(16) => B(16), 
                           B(15) => B(15), B(14) => B(14), B(13) => B(13), 
                           B(12) => B(12), B(11) => B(11), B(10) => B(10), B(9)
                           => B(9), B(8) => B(8), B(7) => B(7), B(6) => B(6), 
                           B(5) => B(5), B(4) => B(4), B(3) => B(3), B(2) => 
                           B(2), B(1) => B(1), B(0) => B(0), Cin => Cin, Co(8) 
                           => Co, Co(7) => int_carry_7_port, Co(6) => 
                           int_carry_6_port, Co(5) => int_carry_5_port, Co(4) 
                           => int_carry_4_port, Co(3) => int_carry_3_port, 
                           Co(2) => int_carry_2_port, Co(1) => int_carry_1_port
                           , Co(0) => int_carry_0_port);
   SG_U : SUM_GENERATOR_NBIT_PER_BLOCK4_NBLOCKS8 port map( A(31) => A(31), 
                           A(30) => A(30), A(29) => A(29), A(28) => A(28), 
                           A(27) => A(27), A(26) => A(26), A(25) => A(25), 
                           A(24) => A(24), A(23) => A(23), A(22) => A(22), 
                           A(21) => A(21), A(20) => A(20), A(19) => A(19), 
                           A(18) => A(18), A(17) => A(17), A(16) => A(16), 
                           A(15) => A(15), A(14) => A(14), A(13) => A(13), 
                           A(12) => A(12), A(11) => A(11), A(10) => A(10), A(9)
                           => A(9), A(8) => A(8), A(7) => A(7), A(6) => A(6), 
                           A(5) => A(5), A(4) => A(4), A(3) => A(3), A(2) => 
                           A(2), A(1) => A(1), A(0) => A(0), B(31) => B(31), 
                           B(30) => B(30), B(29) => B(29), B(28) => B(28), 
                           B(27) => B(27), B(26) => B(26), B(25) => B(25), 
                           B(24) => B(24), B(23) => B(23), B(22) => B(22), 
                           B(21) => B(21), B(20) => B(20), B(19) => B(19), 
                           B(18) => B(18), B(17) => B(17), B(16) => B(16), 
                           B(15) => B(15), B(14) => B(14), B(13) => B(13), 
                           B(12) => B(12), B(11) => B(11), B(10) => B(10), B(9)
                           => B(9), B(8) => B(8), B(7) => B(7), B(6) => B(6), 
                           B(5) => B(5), B(4) => B(4), B(3) => B(3), B(2) => 
                           B(2), B(1) => B(1), B(0) => B(0), Ci(7) => 
                           int_carry_7_port, Ci(6) => int_carry_6_port, Ci(5) 
                           => int_carry_5_port, Ci(4) => int_carry_4_port, 
                           Ci(3) => int_carry_3_port, Ci(2) => int_carry_2_port
                           , Ci(1) => int_carry_1_port, Ci(0) => 
                           int_carry_0_port, S(31) => S(31), S(30) => S(30), 
                           S(29) => S(29), S(28) => S(28), S(27) => S(27), 
                           S(26) => S(26), S(25) => S(25), S(24) => S(24), 
                           S(23) => S(23), S(22) => S(22), S(21) => S(21), 
                           S(20) => S(20), S(19) => S(19), S(18) => S(18), 
                           S(17) => S(17), S(16) => S(16), S(15) => S(15), 
                           S(14) => S(14), S(13) => S(13), S(12) => S(12), 
                           S(11) => S(11), S(10) => S(10), S(9) => S(9), S(8) 
                           => S(8), S(7) => S(7), S(6) => S(6), S(5) => S(5), 
                           S(4) => S(4), S(3) => S(3), S(2) => S(2), S(1) => 
                           S(1), S(0) => S(0));

end SYN_STRUCTURAL;
