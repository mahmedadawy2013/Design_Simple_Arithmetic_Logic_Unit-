/******************************************************************************
*
* Module: Private - Arithmatic Logic Unit ' ALU ' Block 
*
* File Name: ALU_TOP.v
*
* Description:  this file is used for implementation of the Arithmatic Logic Unit
*               Block , ALU is the fundamental building block of the processor
*               which is responsible for carrying out the arithmetic, logic functions,
*               Shift functions and Comparison functions.
*
* Author: Mohamed A. Eladawy
*
*******************************************************************************/
module ALU_TOP # ( 
  
parameter A_WIDTH = 16             , //initialize a parameter variable with value 16 
parameter B_WIDTH = 16             , //initialize a parameter variable with value 16 
parameter ALU_FUN_WIDTH = 4        , //initialize a parameter variable with value 4
parameter ALU_ARITH_OUT_WIDTH = 16 , //initialize a parameter variable with value 16
parameter ALU_LOGIC_OUT_WIDTH = 16 , //initialize a parameter variable with value 16
parameter ALU_CMP_OUT_WIDTH   = 4  , //initialize a parameter variable with value 4
parameter ALU_SHIFT_OUT_WIDTH = 16 ) //initialize a parameter variable with value 16

(

input wire [A_WIDTH-1:0]              A           , //Declaring the Variable As an Input Port with width 16 bits
input wire [B_WIDTH-1:0]              B           , //Declaring the Variable As an Input Port with width 16 bits 
input wire [ALU_FUN_WIDTH-1:0]        ALU_FUN     , //Declaring the Variable As an Input Port with width 4 bits
input wire                            CLK         , //Declaring the Variable As an Input Port with width 1 bit 
input wire                            RST_ARITH   , //Declaring the Variable As an Input Port with width 1 bit 
input wire                            RST_LOGIC   , //Declaring the Variable As an Input Port with width 1 bit 
input wire                            RST_CMP     , //Declaring the Variable As an Input Port with width 1 bit 
input wire                            RST_SHIFT   , //Declaring the Variable As an Input Port with width 1 bit 
output wire [ALU_ARITH_OUT_WIDTH-1:0]  Arith_OUT  , //Declaring the Variable As an Output Port with width 16 bits 
output wire                            Arith_Flag , //Declaring the Variable As an Output Port with width 1 bits  
output wire                            Carry_OUT  , //Declaring the Variable As an Output Port with width 1 bits 
output wire [ALU_LOGIC_OUT_WIDTH-1:0]  Logic_OUT  , //Declaring the Variable As an Output Port with width 4 bits  
output wire                            Logic_Flag , //Declaring the Variable As an Output Port with width 1 bits
output wire [ALU_CMP_OUT_WIDTH-1:0]    CMP_OUT    , //Declaring the Variable As an Output Port with width 16 bits  
output wire                            CMP_Flag   , //Declaring the Variable As an Output Port with width 1 bits
output wire [ALU_SHIFT_OUT_WIDTH-1:0]  SHIFT_OUT  , //Declaring the Variable As an Output Port with width 16 bits 
output wire                            SHIFT_Flag 
 
);

//********************Internal Signal Declaration*****************//

wire                                   Arith_Enable ; //Declaring the Variable As a register  
wire                                   Logic_Enable ; //Declaring the Variable As a register 
wire                                   CMP_Enable   ; //Declaring the Variable As a register 
wire                                   Shift_Enable ; //Declaring the Variable As a register
                              
//********************************************************************//

//******************** Port Mapping For Every Block ******************//


//******************** Decoder Block Port  Mapping   ******************//

Decoder_Unit DECODER_U (

.alu_fun_decoder(ALU_FUN[3:2])       ,
.arith_enable_decoder(Arith_Enable)  ,
.logic_enable_decoder(Logic_Enable)  ,
.cmp_enable_decoder(CMP_Enable)      , 
.shift_enable_decoder(Shift_Enable)    

);

//******************** Arithmetic Block Port  Mapping   ******************//

ARITHMETIC_UNIT ARITH_U (

.a(A)                        ,
.b(B)                        ,
.alu_fun(ALU_FUN[1:0])       ,
.clk(CLK)                    ,
.rst_arith(RST_ARITH)        ,
.arith_enable(Arith_Enable)  ,
.arith_out(Arith_OUT)        ,
.arith_flag(Arith_Flag)      ,
.carry_out(Carry_OUT)

);

//******************** Logic Block Port  Mapping   ******************//

LOGIC_UNIT LOGIC_U (
.a_logic (A)                       ,
.b_logic(B)                        ,
.alu_fun_logic(ALU_FUN[1:0])       ,
.clk(CLK)                          ,
.rst_logic(RST_LOGIC)              ,
.logic_enable(Logic_Enable)        ,
.logic_out(Logic_OUT)              ,
.logic_flag(Logic_Flag)      

);

//******************** Compare Block Port  Mapping   ******************//

CMP_UNIT CP_U (
.a_cmp(A)                      ,
.b_cmp(B)                      ,
.alu_fun_cmp(ALU_FUN[1:0])     ,
.clk(CLK)                      ,
.rst_cmp(RST_CMP)              ,
.cmp_enable(CMP_Enable)        ,
.cmp_out(CMP_OUT)              ,
.cmp_flag(CMP_Flag)      

);

//******************** Shift Block Port  Mapping   ******************//

SHIFT_UNIT SHIFT_U (
.a_shift(A)                      ,
.b_shift(B)                      ,
.alu_fun_shift(ALU_FUN[1:0])     ,
.clk(CLK)                        ,
.rst_shift(RST_SHIFT)            ,
.shift_enable(Shift_Enable)      ,
.shift_out(SHIFT_OUT)            , 
.shift_flag(SHIFT_Flag)      

);






















endmodule 
