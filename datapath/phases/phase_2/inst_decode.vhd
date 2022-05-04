library IEEE;
use IEEE.std_logic_1164.all;
use WORK.constants.all;

entity inst_decode is
  generic (bit_data: integer := 32;
           bit_add: integer := 5);
  port(-- ID Control Signals
		inst_type : in std_logic_vector (1 downto 0); -- instruction type
													  -- 01 I; 10 R; 11 J
       -- Datapath signal
       ir_s : in std_logic_vector(bit_data-1 downto 0);
	   RS1 : out std_logic_vector(bit_add-1 downto 0);
	   RD1 : out std_logic;
       RS2 : out std_logic_vector(bit_add-1 downto 0);
       RD2 : out std_logic;
	   RD : out std_logic_vector(bit_add-1 downto 0);
	   --WR : out std_logic;
	   IMM : out std_logic_vector(bit_data-1 downto 0));
end inst_decode;

architecture behavioral of inst_decode is
begin

  process(inst_type,ir_s) is
	begin
	case inst_type is
		when "01" =>	RS1 <= ir_s(25 downto 21);
						RD1 <= '1';
						RD <= ir_s(20 downto 16);
						--WR <= '1';
						IMM(31) <= ir_s(15);
						IMM(30 downto 15) <= (others => '0');
						IMM(14 downto 0) <= ir_s (14 downto 0) ;
		when "10" =>	RS1 <= ir_s(25 downto 21);
						RD1 <= '1';
						RS2 <= ir_s(20 downto 16);
						RD2 <= '1';
						RD <= ir_s(15 downto 0);
						--WR <= '1';
		when "11" =>	IMM(31) <= ir_s(25);
						IMM(30 downto 25) <= (others => '0');
						IMM(24 downto 0) <= ir_s (24 downto 0) ;
		when others =>  RD1<='0';
						RD2<='0'; 
						--WR<='0';

	end case;
  end process;

end behavioral;
