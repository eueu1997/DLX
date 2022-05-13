library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
use WORK.all;

entity register_file is
	generic(
			bit_add		:	integer;
			bit_data	:	integer
			);
 port ( --CLK: 		IN std_logic;
         RESET: 	IN std_logic; --low active
	 ENABLE: 	IN std_logic; --high active
	 RD1: 		IN std_logic;
	 RD2: 		IN std_logic;
	 WR: 		IN std_logic;
	 ADD_WR: 	IN std_logic_vector(bit_add -1 downto 0);
	 ADD_RD1: 	IN std_logic_vector(bit_add -1 downto 0);
	 ADD_RD2: 	IN std_logic_vector(bit_add -1 downto 0);
	 DATAIN: 	IN std_logic_vector(bit_data -1 downto 0);
     OUT1: 		OUT std_logic_vector(bit_data -1 downto 0);
	 OUT2: 		OUT std_logic_vector(bit_data -1 downto 0));
end register_file;

architecture A of register_file is

        -- suggested structures
        subtype REG_ADDR is natural range 0 to 2**bit_add -1; -- using natural type
	type REG_ARRAY is array(REG_ADDR) of std_logic_vector(bit_data -1 downto 0); 
	signal REGISTERS : REG_ARRAY; 

	
begin 
	process(wr, RD1, RD2, RESET,enable,add_wr,add_rd1,add_rd2,registers,datain)
--process(CLK)
	begin	
	--if rising_edge (clk) then
	--reset process
		if (RESET = '1') then
			registers <= (others=>(OTHERS=>'0'));
		end if;
	--write process
		if (enable = '1')then
			if (wr = '1') then
				registers(to_integer(unsigned(add_wr))) <= datain; --assigning datain to write adress when wr = 1 and enable = 1
			end if;	
	--read process	
			if (RD1 = '1') then
				out1 <= registers(to_integer(unsigned(add_rd1)));  --transferring data from registerfile to external world when rd1=1 and enable=1
			end if;
			if (RD2 = '1') then
				out2 <= registers(to_integer(unsigned(add_rd2)));  --transferring data from registerfile to external world when rd2=1 and enable=1
			end if;
		end if;	
	--end if;
	end process;
end A;

----


configuration CFG_RF_BEH of register_file is
  for A
  end for;
end configuration;
