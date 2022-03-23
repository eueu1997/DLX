library ieee;
use ieee.std_logic_1164.all;

entity add_sub is 
	
	generic ( nbit : integer );
	port 	(A: in std_logic_vector(NBIT-1 downto 0);
       		 B: in std_logic_vector(NBIT-1 downto 0);
       		 Cin: in std_logic; 
			 as : in std_logic; -- 0 for sum,1 for sub
        	 S: out std_logic_vector(NBIT-1 downto 0);
        	 Co: out std_logic);

end add_sub ; 

architecture structural of add_sub is

	component P4_ADDER is
  generic (NBIT: integer ;
           NBIT_PB: integer );
  port (A: in std_logic_vector(NBIT-1 downto 0);
        B: in std_logic_vector(NBIT-1 downto 0);
        Cin: in std_logic;
        S: out std_logic_vector(NBIT-1 downto 0);
        Co: out std_logic);
end component;

component xor_32 is 

port ( 		x: in std_logic_vector(31 downto 0);
		   y: in std_logic;
		   z: out std_logic_vector(31 downto 0));

end component;

component or_1 is
	
	port ( x: in std_logic;
		   y: in std_logic;
		   z: out std_logic);
end component;


signal b_xor_as : std_logic_vector(nbit -1 downto 0 );
signal cin_or_as : std_logic;
begin 
xor1 : xor_32 port map ( B, as,b_xor_as);
or1: or_1 port map (cin,as,cin_or_as);
add : p4_adder generic map (32,4) port map ( A,b_xor_as, cin_or_as , s ,co );

end structural;

configuration CFG_ADD_SUB_STRUCTURAL of ADD_SUB is
	for STRUCTURAL
	  for alL: P4_ADDER
		use configuration WORK.CFG_P4_ADDER_STRUCTURAL;
	  end for;
	end for;
  end configuration;
