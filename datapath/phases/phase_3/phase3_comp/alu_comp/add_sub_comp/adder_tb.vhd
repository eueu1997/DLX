library ieee;
use ieee.std_logic_1164.all;

entity p4_tb is
end p4_tb;

architecture tb of p4_tb is

    component P4_ADDER is
        generic (NBIT: integer ;
                 NBIT_PB: integer );
        port (A: in std_logic_vector(NBIT-1 downto 0);
              B: in std_logic_vector(NBIT-1 downto 0);
              Cin: in std_logic;
              S: out std_logic_vector(NBIT-1 downto 0);
              Co: out std_logic);
      end component;

    signal as,bs,ss : std_logic_vector(31 downto 0);
    signal cin,co : std_logic;

    begin

    uut : p4_adder generic map (32,4) port map (as,bs,cin,ss,co);

    as <= "00000000000000000000000000001101"
    bs <= "00000000000000000000000000000010"
    cin <= '0', '1' after 20 ns ;

    end tb;