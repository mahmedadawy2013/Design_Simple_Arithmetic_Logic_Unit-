/******************************************************************************
*
* Module: Private - Shift Unit  Block 
*
* File Name: SHIFT_UNIT.v
*
* Description:  this file is used for implementation of the SHIFT Unit Block 
*               which is responsible for carrying out the SHIFT functions
*               Shift left or Shift Right
*
* Author: Mohamed A. Eladawy
*
*******************************************************************************/

//********************Port Declaration*************************//

module SHIFT_UNIT # (

parameter a_WIDTH = 16                 , //initialize a parameter variable with value 16   
parameter b_WIDTH = 16                 , //initialize a parameter variable with value 16  
parameter alu_fun_WIDTH = 2            , //initialize a parameter variable with value 2  
parameter alu_shift_OUT_WIDTH  = 16    , //initialize a parameter variable with value 16  
parameter alu_shift_comb_WIDTH = 16  )   //initialize a parameter variable with value 16  
  
(

input wire [a_WIDTH-1:0]                a_shift       , //Declaring the Variable As an Input Port with width 16 bits
input wire [b_WIDTH-1:0]                b_shift       , //Declaring the Variable As an Input Port with width 16 bits
input wire [alu_fun_WIDTH-1:0]          alu_fun_shift , //Declaring the Variable As an Input Port with width 2 bits
input wire                              clk           , //Declaring the Variable As an Input Port with width 1 bits
input wire                              shift_enable  , //Declaring the Variable As an Input Port with width 1 bits
input wire                              rst_shift     , //Declaring the Variable As an Input Port with width 1 bits
output reg [alu_shift_OUT_WIDTH-1:0]    shift_out     , //Declaring the Variable As an Input Port with width 16 bits
output reg                              shift_flag      //Declaring the Variable As an Input Port with width 1 bits

);

//********************Internal Signal Declaration*****************//

reg        [alu_shift_comb_WIDTH-1 : 0 ] shift_out_Comb ; //Declaring the Variable As a register

/******************************************************************/

//******************************The RTL Code********************************//

/********************Starting The Sequential Always Block********************/

always @(posedge clk or negedge rst_shift)
 
 begin
   
  if (! rst_shift)  //Check if the Rest is on or Off 
     
     begin 
       shift_out  <= 16'b0000 ;
       shift_flag <= 1'b0     ; 
     end
 else
     begin  
       shift_out <= shift_out_Comb ;
     end
 end
 

/********************Starting The Combiational Always Block********************/

always @ ( * )

begin 


if ( shift_enable )  //Check if the Block is enabled Or Disabled
  
  begin 

case ( alu_fun_shift )  

/******************** Starting Arithmatic Operations ********************/
2'b00: 
          begin
        
           shift_out_Comb = ( a_shift >> 1)  ;         // Logical And Operation
           shift_flag = 1'b1                 ;         // Rising logical Flag 
        
          end 

2'b01 :
          begin 
          
           shift_out_Comb = ( a_shift  << 1 )   ;      //Logical Or Operation
           shift_flag  = 1'b1                   ;      // Rising logical Flag
          
          end  
          
2'b10 :
          begin 
            
           shift_out_Comb  = ( b_shift  >> 1 )   ;      //Logical Nand Operation
           shift_flag = 1'b1                     ;      // Rising logical Flag    
            
          end  
 
2'b11 :
          begin 
          
           shift_out_Comb = ( b_shift  << 1)     ;      //Logical NOR Operation
           shift_flag = 1'b1                     ;      // Rising logical Flag
          
          end          
    endcase
  end 
  
else 
     begin 
       
     shift_out_Comb = 16'b0000 ;                        // intialize the Output with zero   
     shift_flag     = 1'b0     ;                        // intialize the Logical Flag with zero  
     
     end  
end         

/*********************************************************************/

endmodule  
  
  





