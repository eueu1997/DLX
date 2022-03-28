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
		 -- output of the condition
		 cond: out std_logic_vector(0 downto 0);
		 -- aoutput of the block
		 alu_out : out std_logic_vector(nbit-1 downto 0);
		 -- register output enable
		 cond_en : in std_logic;
		 alu_out_en : in std_logic);



end component;
constant nbit : integer  := 32 ;
signal npc,a,b,imm,alu_out : std_logic_vector(nbit -1 downto 0);
signal alu_type : std_logic_vector(3 downto 0);
signal npcora,borimm,brorcomp,be,cout,cond,alu : std_logic;

begin

    uut : phase3 generic map ( nbit ) port map ( npc,a,b,imm,npcora,borimm,brorcomp,be,alu_type,cout,cond,alu_out,cond,alu);

    -- try to test all combinatio--
    
    -- add

    a <= "00000000000000000000000000001100";
    b <= "00000000000000000000000000000011";
    npcora <= '1'
    borimm <= '0'
    brorcomp <= '0'
    be <= '0'
    alu_type <= "0000"
    cond <= '0','1' after 80 ns
    alu <= '0','1' after 80 ns

    -- addi
    a <= "00000000000000000000000000001100"after 100 ns;
    imm <= "00000000000000000000000000000011"after 100 ns;
    npcora <= '1' after 100 ns ;
    borimm <= '1' after 100 ns ;
    brorcomp <= '0' after 100 ns ;
    be <= '0' after 100 ns ;
    alu_type <= "0000" after 100 ns ;
    cond <= '0' after 100 ns,'1' after 180 ns;
    alu <= '0' after 100 ns,'1' after 180 ns;

    -- sub
    
    a <= "00000000000000000000000000001100"after 200 ns;
    b <= "00000000000000000000000000000011"after 200 ns;
    npcora <= '1'after 200 ns;
    borimm <= '0'after 200 ns;
    brorcomp <= '0'after 200 ns;
    be <= '0'after 200 ns;
    alu_type <= "0010"after 200 ns;
    cond <= '0'after 200 ns;,'1' after 280 ns;
    alu <= '0'after 200 ns;,'1' after 280 ns;

    -- subi
    a <= "00000000000000000000000000001100"after 300 ns;
    imm <= "00000000000000000000000000000011"after 300 ns;
    npcora <= '1' after 300 ns ;
    borimm <= '1' after 300 ns ;
    brorcomp <= '0' after 300 ns ;
    be <= '0' after 300 ns ;
    alu_type <= "0010" after 300 ns ;
    cond <= '0' after 300 ns,'1' after 380 ns;
    alu <= '0' after 300 ns,'1' after 380 ns;

    -- and
    
    a <= "00000000000000000000000000001100"after 400 ns;
    b <= "00000000000000000000000000000011"after 400 ns;
    npcora <= '1'after 400 ns;
    borimm <= '0'after 400 ns;
    brorcomp <= '0'after 400 ns;
    be <= '0'after 400 ns;
    alu_type <= "0001"after 400 ns;
    cond <= '0'after 400 ns;,'1' after 480 ns;
    alu <= '0'after 400 ns;,'1' after 480 ns;

    -- or
    
    a <= "00000000000000000000000000001100"after 500 ns;
    b <= "00000000000000000000000000000011"after 500 ns;
    npcora <= '1'after 500 ns;
    borimm <= '0'after 500 ns;
    brorcomp <= '0'after 500 ns;
    be <= '0'after 500 ns;
    alu_type <= "0111"after 500 ns;
    cond <= '0'after 500 ns;,'1' after 580 ns;
    alu <= '0'after 500 ns;,'1' after 580 ns;

    --cmp 
    
    a <= "00000000000000000000000000001100"after 600 ns;
    b <= "00000000000000000000000000000011"after 600 ns;
    npcora <= '1'after 600 ns;
    borimm <= '0'after 600 ns;
    brorcomp <= '0'after 600 ns;
    be <= '1'after 600 ns;
    alu_type <= "1011"after 600 ns;
    cond <= '0'after 600 ns;,'1' after 680 ns;
    alu <= '0'after 600 ns;,'1' after 680 ns;

    -- branch
    
    a <= "00000000000000000000000000001100"after 700 ns;
    b <= "00000000000000000000000000000011"after 700 ns;
    npcora <= '1'after 700 ns;
    borimm <= '0'after 700 ns;
    brorcomp <= '1'after 700 ns;
    be <= '0'after 700 ns;
    alu_type <= "0010"after 700 ns;
    cond <= '0'after 700 ns;,'1' after 780 ns;
    alu <= '0'after 700 ns;,'1' after 780 ns;




