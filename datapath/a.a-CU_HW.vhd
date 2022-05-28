library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use work.myTypes.all;
--use ieee.numeric_std.all;
--use work.all;

entity dlx_cu is
  generic (
    MICROCODE_MEM_SIZE :     integer := 10;  -- Microcode Memory Size
    FUNC_SIZE          :     integer := 11;  -- Func Field Size for R-Type Ops
    OP_CODE_SIZE       :     integer := 6;  -- Op Code Size
    -- ALU_OPC_SIZE       :     integer := 6;  -- ALU Op Code Word Size
    IR_SIZE            :     integer := 32;  -- Instruction Register Size    
    CW_SIZE            :     integer := 15;  -- Control Word Size
    CW1_SIZE            :    integer := 2;
    CW2_SIZE            :    integer :=;
    CW3_SIZE            :    integer := 2;
    CW4_SIZE            :    integer := 2;
    CW5_SIZE            :    integer := 2);
  port (
    Clk                : in  std_logic;  -- Clock
    Rst                : in  std_logic;  -- Reset:Active-Low
    -- Instruction Register
    IR_IN              : in  std_logic_vector(IR_SIZE - 1 downto 0);
    
   --phase 1 control signal
   imem_res : out std_logic; -- to reset the istruction memory
   -- phase 2 control signal
   inst_type : out std_logic_vector ( 1 downto 0); -- "01" for I type , "10" for R type , "11" for J type
   RF_RESET: out std_logic;
   --phase 3 control signal
   npc_or_a : out std_logic; -- inputtin from 'a'(1) register fetched or adding the npc
   b_or_imm : out std_logic; -- inputtin 'b'(0) register fetched or immediate 
   branch_or_comp : out std_logic; -- if the value sent in zero block is for branching(0) or cmaparison
   be : out std_logic; -- 0 for beq, 1 for bneq
   alu_type : out std_logic_vector(3 downto 0);
   alu_en : out std_logic;
   cin : out std_logic;
   --phase4 control signal
   bj_en : out std_logic; -- enable the condition evaluation to choose between the branched addres or npc
   j_en : out std_logic; -- enable unconditional branch
   ram_en : out std_logic; -- enable the ram to be read/write    
   ram_res : out std_logic; -- reaset the ram
   rw : out std_logic; -- 0 for write, 1 for read
   --phase5
   wb_sel : out std_logic; -- 0 for reading from memory, 1 if write back from alu
   rf_we : out std_logic); -- enabling writing for write back on phase 2
end dlx_cu;

architecture dlx_cu_hw of dlx_cu is
  type mem_array is array (integer range 0 to MICROCODE_MEM_SIZE - 1) of std_logic_vector(CW_SIZE - 1 downto 0);
  signal cw_mem_op : mem_array := ("111100010000111", -- 0X00 RESERVED
                                "000000000000000", -- 0X01 FUNC-OPERATION
                                "011101000000101100000", -- 0X02 J
                                "000000000000000", -- 0X03 JAL
                                "001101000000101000000", -- 0X04 BEQZ
                                "001101010000101000000", -- 0X05 BNEZ
                                "000000000000000", -- 0X06
                                "000000000000000",
                                "001111100000100000011", -- 0X08 ADDI
                                "000000000000000", -- 0X09 ADDUI
                                "001111100010100000011", -- 0X0A SUBI
                                "000000000000000", -- 0X0B SUBUI
                                "001111100001100000011", -- 0X0C ANDI
                                "00111100111100000011", -- 0X0D ORI
                                "001111100110100000011", -- 0X0E XORI
                                "000000000000000", --
                                "000000000000000", -- 0X10
                                "000000000000000", --
                                "000000000000000", --
                                "000000000000000", --
                                "001111100100100000011",--0x14 SLLI 
                                "000000000000000", -- 0X15 NOP
                                "001111100101100000011", -- 0X16 SRLI
                                "000000000000000",
                                "000000000000000", -- 0X18 SEQI
                                "000000000000000", -- 0X19 SNEI
                                "000000000000000", --
                                "000000000000000", -- 
                                "000000000000000",
                                "000000000000000", --
                                "000000000000000",
                                "000000000000000", --
                                "000000000000000", -- 0x20
                                "000000000000000", --
                                "000000000000000", -- 
                                "001111100000100010001", -- 0x023 LW
                                "000000000000000", --
                                "000000000000000",
                                "000000000000000", --
                                "000000000000000", --
                                "000000000000000", --
                                "000000000000000", -- 
                                "000000000000000",
                                "001111100000100010100", -- 0X2B SW
                                "000000000000000");--
  
  signal cw_mem_func : mem_array :=("111100010000111", --0X00
                                    "000000000000000", --0X01
                                    "111011111001100", -- 0X02
                                    "000000000000000", -- 
                                    "010110100100100000011", -- 0X04 SLL
                                    "000000000000000", --                                    
                                    "010110100101100000011", -- 0X06 SRL
                                    "000000000000000", --                                    
                                    "000000000000000",
                                    "000000000000000",
                                    "000000000000000",
                                    "000000000000000",
                                    "000000000000000",
                                    "000000000000000",
                                    "000000000000000",
                                    "000000000000000",
                                    "000000000000000",--0X10
                                    "000000000000000",
                                    "000000000000000",
                                    "000000000000000",
                                    "000000000000000",
                                    "000000000000000",
                                    "000000000000000",
                                    "000000000000000",
                                    "000000000000000",
                                    "000000000000000",
                                    "000000000000000",
                                    "000000000000000",
                                    "000000000000000",
                                    "000000000000000",
                                    "000000000000000",
                                    "000000000000000",
                                    "010110100000100000011",-- 0X20 ADD
                                    "000000000000000",
                                    "010110100010100000011",-- 0X22 SUB
                                    "000000000000000",
                                    "000000000000000",-- 0X23 
                                    "010110100001100000011",-- 0X24 AND
                                    "011110100111100000011",-- 0X25 OR
                                    "010110100110100000011",-- 0X26 XOR
                                    "000000000000000",
                                    "000000000000000",-- 0X28 SEQ
                                    "000000000000000",-- 0X29 SNEQ
                                    "000000000000000",-- 0X2A SLT
                                    "000000000000000",-- 0X2B SGT
                                    "000000000000000",-- 0X2C SLE
                                    "000000000000000",-- 0X2B SGE
                                    );                           
                                
  signal IR_opcode : std_logic_vector(OP_CODE_SIZE -1 downto 0);  -- OpCode part of IR
  signal IR_func : std_logic_vector(FUNC_SIZE downto 0);   -- Func part of IR when Rtype
  signal cw   : std_logic_vector(CW_SIZE - 1 downto 0); -- full control word read from cw_mem


  -- control word is shifted to the correct stage
  signal cw1 : std_logic_vector(CW_SIZE -1 downto 0); -- first stage
  signal cw2 : std_logic_vector(CW_SIZE - 1 - CW1_SIZE downto 0); -- second stage
  signal cw3 : std_logic_vector(CW_SIZE - 1 - CW1_SIZE - CW2_SIZE downto 0); -- third stage
  signal cw4 : std_logic_vector(CW_SIZE - 1 - CW1_SIZE - CW2_SIZE - CW3_SIZE downto 0); -- fourth stage
  signal cw5 : std_logic_vector(CW_SIZE  -1 - CW1_SIZE - CW2_SIZE - CW3_SIZE - CW4_SIZE downto 0); -- fifth stage

  signal aluOpcode_i: aluOp := NOP; -- ALUOP defined in package
  signal aluOpcode1: aluOp := NOP;
  signal aluOpcode2: aluOp := NOP;
  signal aluOpcode3: aluOp := NOP;


 
begin  -- dlx_cu_rtl

  IR_opcode(5 downto 0) <= IR_IN(31 downto 26);
  IR_func(10 downto 0)  <= IR_IN(FUNC_SIZE - 1 downto 0);
  
  cw <= cw_mem_func(conv_integer(IR_func)) when IR_func = 0x01;
  cw <= cw_mem_op(conv_integer(IR_opcode));
  

  -- stage one control signals
  imem_res  <= cw1(CW_SIZE - 1);
  
  -- stage two control signals
  inst_type   <= cw2(CW_SIZE - 3);
  RF_RESET   <= cw2(CW_SIZE - 4);
  
  -- stage three control signals
  npc_or_a      <= cw3(CW_SIZE - 6);
  b_or_imm      <= cw3(CW_SIZE - 7);
  branch_or_comp <= cw3(CW_SIZE - 8);
  be       <= cw3(CW_SIZE - 9);
  alu_type       <= cw3(CW_SIZE - 10 to CW_SIZE - 13);
  alu_en       <= cw3(CW_SIZE - 14);
  cin       <= cw3(CW_SIZE - 15);

  
  -- stage four control signals
  DRAM_WE      <= cw4(CW_SIZE - 10);
  LMD_LATCH_EN <= cw4(CW_SIZE - 11);
  JUMP_EN      <= cw4(CW_SIZE - 12);
  PC_LATCH_EN  <= cw4(CW_SIZE - 13);
  
  -- stage five control signals
  WB_MUX_SEL <= cw5(CW_SIZE - 14);
  RF_WE      <= cw5(CW_SIZE - 15);


  -- process to pipeline control words
  CW_PIPE: process (Clk, Rst)
  begin  -- process Clk
    if Rst = '0' then                   -- asynchronous reset (active low)
      cw1 <= (others => '0');
      cw2 <= (others => '0');
      cw3 <= (others => '0');
      cw4 <= (others => '0');
      cw5 <= (others => '0');
      aluOpcode1 <= NOP;
      aluOpcode2 <= NOP;
      aluOpcode3 <= NOP;
    elsif Clk'event and Clk = '1' then  -- rising clock edge
      cw1 <= cw;
      cw2 <= cw1(CW_SIZE - 1 - 2 downto 0);
      cw3 <= cw2(CW_SIZE - 1 - 5 downto 0);
      cw4 <= cw3(CW_SIZE - 1 - 9 downto 0);
      cw5 <= cw4(CW_SIZE -1 - 13 downto 0);

      aluOpcode1 <= aluOpcode_i;
      aluOpcode2 <= aluOpcode1;
      aluOpcode3 <= aluOpcode2;
    end if;
  end process CW_PIPE;

  ALU_OPCODE <= aluOpcode3;

  -- purpose: Generation of ALU OpCode
  -- type   : combinational
  -- inputs : IR_i
  -- outputs: aluOpcode
   ALU_OP_CODE_P : process (IR_opcode, IR_func)
   begin  -- process ALU_OP_CODE_P
	case conv_integer(unsigned(IR_opcode)) is
	        -- case of R type requires analysis of FUNC
		when 0 =>
			case conv_integer(unsigned(IR_func)) is
				when 4 => aluOpcode_i <= LLS; -- sll according to instruction set coding
				when 6 => aluOpcode_i <= LRS; -- srl
				-- to be continued and filled with all the other instructions  
				when others => aluOpcode_i <= NOP;
			end case;
		when 2 => aluOpcode_i <= NOP; -- j
		when 3 => aluOpcode_i <= NOP; -- jal
		when 8 => aluOpcode_i <= ADDS; -- addi
		-- to be continued and filled with other cases
		when others => aluOpcode_i <= NOP;
	 end case;
	end process ALU_OP_CODE_P;
 -- 6 opcode 5 rs1 5 rd  16 imm         I type 01
  --6 opcode 5 rs1 5 rs2 5 rd 11 func   R type 10
  --6 opcode 26 imm                     J type 11

end dlx_cu_hw;
