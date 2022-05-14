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
    CW_SIZE            :     integer := 15);  -- Control Word Size
  port (
    Clk                : in  std_logic;  -- Clock
    Rst                : in  std_logic;  -- Reset:Active-Low
    -- Instruction Register
    IR_IN              : in  std_logic_vector(IR_SIZE - 1 downto 0);
    
   --phase 1 control signal
   imem_res : in std_logic; -- to reset the istruction memory
   -- phase 2 control signal
   inst_type : in std_logic_vector ( 1 downto 0); -- "01" for I type , "10" for R type , "11" for J type
   --jal : in std_logic;
   --phase 3 control signal
   npc_or_a : in std_logic; -- inputtin from 'a'(1) register fetched or adding the npc
   b_or_imm : in std_logic; -- inputtin 'b'(0) register fetched or immediate 
   branch_or_comp : in std_logic; -- if the value sent in zero block is for branching(0) or cmaparison
   be : in std_logic; -- 0 for beq, 1 for bneq
   alu_type : in std_logic_vector(3 downto 0);
   alu_en : in std_logic;
   cin : in std_logic;
   --phase4 control signal
   bj_en : in std_logic; -- enable the condition evaluation to choose between the branched addres or npc
   j_en : in std_logic; -- enable unconditional branch
   ram_en : in std_logic; -- enable the ram to be read/write
   --(the next one is in phase5)
   wb_sel : in std_logic; -- 0 for reading from memory, 1 if write back from alu
   ram_res : in std_logic; -- reaset the ram
   rw : in std_logic; -- 0 for write, 1 for read
   --phase5
   rf_we : in std_logic; RF_WE              : out std_logic);  -- Register File Write Enable

end dlx_cu;

architecture dlx_cu_hw of dlx_cu is
  type mem_array is array (integer range 0 to MICROCODE_MEM_SIZE - 1) of std_logic_vector(CW_SIZE - 1 downto 0);
  signal cw_mem_op : mem_array := ("111100010000111", -- R type: IS IT CORRECT?
                                "000000000000000",
                                "111011111001100", -- J (0X02) instruction encoding corresponds to the address to this ROM
                                "000000000000000", -- JAL to be filled
                                "000000000000000", -- BEQZ to be filled
                                "000000000000000", -- BNEZ
                                "000000000000000", -- 
                                "000000000000000",
                                "000000000000000", -- ADD i (0X08): FILL IT!!!
                                "000000000000000");-- to be completed (enlarged and filled)
  
  signal cw_mem_func : mem_array := ("111100010000111", -- R type: IS IT CORRECT?
                                "000000000000000",
                                "111011111001100", -- J (0X02) instruction encoding corresponds to the address to this ROM
                                "000000000000000", -- JAL to be filled
                                "000000000000000", -- BEQZ to be filled
                                "000000000000000", -- BNEZ
                                "000000000000000", -- 
                                "000000000000000",
                                "000000000000000", -- ADD i (0X08): FILL IT!!!
                                "000000000000000");-- to be completed (enlarged and filled)                              
                                
  signal IR_opcode : std_logic_vector(OP_CODE_SIZE -1 downto 0);  -- OpCode part of IR
  signal IR_func : std_logic_vector(FUNC_SIZE downto 0);   -- Func part of IR when Rtype
  signal cw   : std_logic_vector(CW_SIZE - 1 downto 0); -- full control word read from cw_mem


  -- control word is shifted to the correct stage
  signal cw1 : std_logic_vector(CW_SIZE -1 downto 0); -- first stage
  signal cw2 : std_logic_vector(CW_SIZE - 1 - 2 downto 0); -- second stage
  signal cw3 : std_logic_vector(CW_SIZE - 1 - 5 downto 0); -- third stage
  signal cw4 : std_logic_vector(CW_SIZE - 1 - 9 downto 0); -- fourth stage
  signal cw5 : std_logic_vector(CW_SIZE -1 - 13 downto 0); -- fifth stage

  signal aluOpcode_i: aluOp := NOP; -- ALUOP defined in package
  signal aluOpcode1: aluOp := NOP;
  signal aluOpcode2: aluOp := NOP;
  signal aluOpcode3: aluOp := NOP;


 
begin  -- dlx_cu_rtl

  IR_opcode(5 downto 0) <= IR_IN(31 downto 26);
  IR_func(10 downto 0)  <= IR_IN(FUNC_SIZE - 1 downto 0);

  cw <= cw_mem(conv_integer(IR_opcode));


  -- stage one control signals
  IR_LATCH_EN  <= cw1(CW_SIZE - 1);
  NPC_LATCH_EN <= cw1(CW_SIZE - 2);
  
  -- stage two control signals
  RegA_LATCH_EN   <= cw2(CW_SIZE - 3);
  RegB_LATCH_EN   <= cw2(CW_SIZE - 4);
  RegIMM_LATCH_EN <= cw2(CW_SIZE - 5);
  
  -- stage three control signals
  MUXA_SEL      <= cw3(CW_SIZE - 6);
  MUXB_SEL      <= cw3(CW_SIZE - 7);
  ALU_OUTREG_EN <= cw3(CW_SIZE - 8);
  EQ_COND       <= cw3(CW_SIZE - 9);
  
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


end dlx_cu_hw;
