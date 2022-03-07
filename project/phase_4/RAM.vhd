library ieee;
use ieee.std_logic_1164.all;
use std.textio.all;
use ieee.std_logic_textio.all;
use ieee.numeric_std.all;

entity RAM is
  generic (
    bit_add : integer ;
    I_SIZE : integer );
  port (
	
    Rst  : in  std_logic;
	en : in std_logic;
	rw : in std_logic;
    Addr : in  std_logic_vector(bit_add - 1 downto 0);
    Dout : out std_logic_vector(I_SIZE - 1 downto 0);
	Din : in std_logic_vector(I_SIZE - 1 downto 0)
    );

end RAM;

architecture Ram_Bhe of RAM is

  type RAMtype is array (0 to 100 )of std_logic_vector(I_SIZE - 1 downto 0);

  signal RAM_mem : RAMtype;

begin  

	
	process(Addr , rw , en, Rst)
	
	begin 
	if(rst='1') then ram_mem <= (others => (others =>'0'));
	end if;
	if(en='1') then
	if(rw ='0') then
    RAM_mem(to_integer(unsigned(Addr))) <= Din;
	else
	Dout <= RAM_mem(to_integer(unsigned(Addr)));
	

	end if;
	end if;
	end process;

end Ram_Bhe;
  


