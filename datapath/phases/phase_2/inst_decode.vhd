library IEEE;
use IEEE.std_logic_1164.all;
use WORK.constants.all;

entity inst_decode is
  generic (bit_data: integer := 32;
           bit_add: integer := 5);
  port(-- CU Control Signals
		inst_type : in std_logic_vector (1 downto 0); -- instruction type
													  -- 01 I; 10 R; 11 J
       -- Datapath signal input
       ir_s : in std_logic_vector(bit_data-1 downto 0);

	   -- output
	   reg_read_add_1 : out std_logic_vector(bit_add-1 downto 0);
	   reg_read_en_1 : out std_logic;
       reg_read_add_2 : out std_logic_vector(bit_add-1 downto 0);
       reg_read_en_2 : out std_logic;
	   reg_dest : out std_logic_vector(bit_add-1 downto 0);
	   IMM : out std_logic_vector(bit_data-1 downto 0));

end inst_decode;

architecture behavioral of inst_decode is
begin

  process(inst_type,ir_s) is
	begin
	case inst_type is
		when "01" =>	reg_read_add_1 <= ir_s(25 downto 21);
						reg_read_en_1 <= '1';
						reg_dest <= ir_s(20 downto 16);
						IMM(31) <= ir_s(15);
						IMM(30 downto 15) <= (others => '0');
						IMM(14 downto 0) <= ir_s (14 downto 0) ;
		when "10" =>	reg_read_add_1 <= ir_s(25 downto 21);
						reg_read_en_1 <= '1';
						reg_read_add_2 <= ir_s(20 downto 16);
						reg_read_en_2 <= '1';
						reg_dest <= ir_s(15 downto 11);
		when "11" =>	IMM(31) <= ir_s(25);
						IMM(30 downto 25) <= (others => '0');
						IMM(24 downto 0) <= ir_s (24 downto 0);
		when others =>  reg_read_en_1 <='0';
						reg_read_en_2 <='0';
						IMM <=(others => '0');
	end case;
  end process;

end behavioral;
