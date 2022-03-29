library ieee;
use ieee.std_logic_1164.all;
entity p3_tb is
    end p3_tb;

architecture tb of p3_tb is
component phase3 is 

	generic ( nbit : integer);
	port( npc : in std_logic_vector(nbit-1 downto 0);
		 a : in std_logic_vector(nbit-1 downto 0);
		 b : in std_logic_vector(nbit-1 downto 0);
		 imm : in std_logic_vector(nbit -1 downto 0);
		 
		 npc_or_a : in std_logic;
		 b_or_imm : in std_logic;
		 branch_or_comp : in std_logic; -- branching means we get a, comparing means we need the result of a+b so we can check if it is zero to say that are equal

		 be : in std_logic; -- 0 be , 1 bne
		 alu_type : in std_logic_vector(3 downto 0);
		 c_out : out std_logic;
		 cin : in std_logic;
		 -- output of the condition
		 cond: out std_logic;
		 -- aoutput of the block
		 alu_out : out std_logic_vector(nbit-1 downto 0);
		 -- register output enable
		 cond_en : in std_logic;
		 alu_out_en : in std_logic);



end component;
constant nbit : integer  := 32 ;
signal npc,a,b,imm,alu_out : std_logic_vector(nbit -1 downto 0);
signal alu_type : std_logic_vector(3 downto 0);
signal npcora,borimm,brorcomp,be,cout,alu,cond,cin : std_logic;
--signal cond : std_logic_vector(0 downto 0);

begin

    uut : phase3 generic map ( nbit ) port map ( npc,a,b,imm,npcora,borimm,brorcomp,be,alu_type,cout,cin,cond,alu_out,cond,alu);

    -- try to test all combinatio--
    cin <= '0';
    -- add
	process
	begin
    a <= "00000000000000000000000000001100";
    b <= "00000000000000000000000000000011";
    npcora <= '1';
    borimm <= '0';
    brorcomp <= '0';
    be <= '0';
    alu_type <= "0000";
    cond <= '0';
    alu <= '0';
	wait for 80 ns;
    cond <= '1';
    alu <= '1';
	wait for 20 ns;
    -- addi
    a <= "00000000000000000000000000001100" ;
    imm <= "00000000000000000000000000000011";
    npcora <= '1';
    borimm <= '1';
    brorcomp <= '0' ;
    be <= '0';
    alu_type <= "0000";
    cond <= '0';
    alu <= '0' ;
	wait for 80 ns;
    cond <= '1';
    alu <= '1';
	wait for 20 ns;
    -- sub
    
    a <= "00000000000000000000000000001100";
    b <= "00000000000000000000000000000011";
    npcora <= '1';
    borimm <= '0';
    brorcomp <= '0';
    be <= '0';
    alu_type <= "0010";
    cond <= '0';
    alu <= '0';
	wait for 80 ns;
    cond <= '1';
    alu <= '1';
	wait for 20 ns;
   
	-- subi
    a <= "00000000000000000000000000001100";
    imm <= "00000000000000000000000000000011";
    npcora <= '1';
    borimm <= '1';
    brorcomp <= '0';
    be <= '0';
    alu_type <= "0010" ;
    cond <= '0';
    alu <= '0' ;
	wait for 80 ns;
    cond <= '1';
    alu <= '1';
	wait for 20 ns;
    -- and
    
    a <= "00000000000000000000000000001100" ;
    b <= "00000000000000000000000000000011" ;
    npcora <= '1';
    borimm <= '0';
    brorcomp <= '0';
    be <= '0';
    alu_type <= "0001";
    cond <= '0';
    alu <= '0';
	wait for 80 ns;
    cond <= '1';
    alu <= '1';
	wait for 20 ns;
    -- or
    
    a <= "00000000000000000000000000001100" ;
    b <= "00000000000000000000000000000011" ;
    npcora <= '1';
    borimm <= '0';
    brorcomp <= '0';
    be <= '0';
    alu_type <= "0111";
    cond <= '0';
    alu <= '0';
wait for 80 ns;
    cond <= '1';
    alu <= '1';
	wait for 20 ns;
    --cmp 
    
    a <= "00000000000000000000000000001100" ;
    b <= "00000000000000000000000000000011" ;
    npcora <= '1';
    borimm <= '0';
    brorcomp <= '0';
    be <= '1';
    alu_type <= "1011";
    cond <= '0';
    alu <= '0';
wait for 80 ns;
    cond <= '1';
    alu <= '1';
	wait for 20 ns;
    -- branch
    
    a <= "00000000000000000000000000001100";
    b <= "00000000000000000000000000000011";
    npcora <= '1';
    borimm <= '0';
    brorcomp <= '1';
    be <= '0';
    alu_type <= "0010";
    cond <= '0';
    alu <= '0';
wait for 80 ns;
    cond <= '1';
    alu <= '1';
	wait for 20 ns;
 
end process;

end tb;

