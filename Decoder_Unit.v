/******************************************************************************
*
* Module: Private - Decoder Unit  Block 
*
* File Name: Decoder_Unit.v
*
* Description:  this file is used for implementation of the Decoder Unit Block 
*               which is responsible for carrying out the Enable of All Flip
*               Flops of the System
*
* Author: Mohamed A. Eladawy
*
*******************************************************************************/

//********************Port Declaration*************************//

module Decoder_Unit # (

parameter alu_fun_WIDTH = 2  )       
  
(

input wire [alu_fun_WIDTH-1:0]        alu_fun_decoder      , //Declaring the Variable As an Input Port 
output reg                            arith_enable_decoder , //Declaring the Variable As an Output Port
output reg                            logic_enable_decoder , //Declaring the Variable As an Output Port
output reg                            cmp_enable_decoder   , //Declaring the Variable As an Output Port
output reg                            shift_enable_decoder   //Declaring the Variable As an Output Port

);


/******************************************************************/

//******************************The RTL Code********************************//

/********************Starting The Combiational Always Block********************/

always @ ( * )

begin 


if ( alu_fun_decoder == 2'b00 )      //Check if the Alu input equl 00 or not 
  
  begin 

    arith_enable_decoder = 1'b1 ;    //Enable the arithmatic unit Block
    logic_enable_decoder = 1'b0 ;    //Disable the logic Block Unit
    cmp_enable_decoder   = 1'b0 ;    //Disable the Compare Block Unit
    shift_enable_decoder = 1'b0 ;    //Disable the Shift Block Unit
    

  end  

else if ( alu_fun_decoder == 2'b01 )
  
  begin 
  
    arith_enable_decoder = 1'b0 ;    //Disable the arithmatic unit Block
    logic_enable_decoder = 1'b1 ;    //Enable the logic Block Unit 
    cmp_enable_decoder   = 1'b0 ;    //Disable the Compare Block Unit
    shift_enable_decoder = 1'b0 ;    //Disable the Shift Block Unit  
    
  end  

else if ( alu_fun_decoder == 2'b10 )
  
  begin 
  
    arith_enable_decoder = 1'b0 ;    //Disable the arithmatic unit Block
    logic_enable_decoder = 1'b0 ;    //Disable the logic Block Unit
    cmp_enable_decoder   = 1'b1 ;    //Enable the Compare Block Unit
    shift_enable_decoder = 1'b0 ;    //Disable the Shift Block Unit   
    
  end 
  
else 
  
  begin 
  
    arith_enable_decoder = 1'b0 ;    //Disable the arithmatic unit Block
    logic_enable_decoder = 1'b0 ;    //Disable the logic Block Unit
    cmp_enable_decoder   = 1'b0 ;    //Disable the Compare Block Unit
    shift_enable_decoder = 1'b1 ;    //Enable the Shift Block Unit     
    
  end 
   
    

end         

/*********************************************************************/

endmodule  
  
  



