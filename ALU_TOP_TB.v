module ALU_TOP_TB  () ;
  

// all design inputs are defined in testbench as reg to be used inside initial block 
// all design outputs are defined in testbench as wire   
  reg    [15:0]    A_tb , B_tb   ; 
  reg    [3:0]     ALU_FUN_tb    ;
  reg              CLK_tb        ;
  reg              RST_ARITH_tb, RST_LOGIC_tb, RST_CMP_tb, RST_SHIFT_tb       ;  
  wire   [15:0]    Arith_OUT_tb  ; 
  wire             Carry_OUT_tb  ; 
  wire   [15:0]    Logic_OUT_tb  ;
  wire   [3:0]     CMP_OUT_tb    ;
  wire   [15:0]    SHIFT_OUT_tb  ; 
  wire             Arith_Flag_tb, Logic_Flag_tb , Cmp_Flag_tb , Shift_Flag_tb ;
/***********************************************************************/ 
initial 
  begin
    $dumpfile("ALU_TOP.vcd") ;
    $dumpvars ;
    //initial values
    A_tb         = 16'b0 ;   
    B_tb         = 16'b0 ;
    ALU_FUN_tb   = 4'b0  ;
    RST_ARITH_tb = 1'b1  ;
    RST_LOGIC_tb = 1'b1  ;
    RST_CMP_tb   = 1'b1  ;
    RST_SHIFT_tb = 1'b1  ;
    CLK_tb       = 1'b0  ;
/***********************************************************************/    
    $display ("TEST CASE 1") ;  // test Addition Function
    #3
    A_tb  = 16'b0011 ;
    B_tb  = 16'b0010 ;
    ALU_FUN_tb = 4'b0000 ; 
    #7
    if(Arith_OUT_tb != 16'b0101)
      $display ("TEST CASE 1 IS FAILED") ;
    else
      $display ("TEST CASE 1 IS PASSED") ;
    if(Arith_Flag_tb != 1'b1)  
      $display (" ARITHMATIC FLAG IS NOT RAISED ") ;
    else
      $display (" ARITHMATIC FLAG IS RAISED ") ;
/***********************************************************************/    
    $display ("TEST CASE 2") ;  // Test Subtraction 
    #3
    A_tb  = 16'b0011 ;
    B_tb  = 16'b0010 ;
    ALU_FUN_tb = 4'b0001 ; 
    #7
    if(Arith_OUT_tb != 16'b0001)
      $display ("TEST CASE 2 IS FAILED") ;
    else
      $display ("TEST CASE 2 IS PASSED") ;   
    if(Arith_Flag_tb != 1'b1)  
      $display (" ARITHMATIC FLAG IS NOT RAISED ") ;
    else
      $display (" ARITHMATIC FLAG IS RAISED ") ;  
/***********************************************************************/    
    $display ("TEST CASE 3") ;  // Test Multiblication
    #3
    A_tb  = 16'b0011 ;
    B_tb  = 16'b0010 ;
    ALU_FUN_tb = 4'b0010 ; 
    #27
    if(Arith_OUT_tb != 16'b0110 )
      $display ("TEST CASE 3 IS FAILED") ;
    else
      $display ("TEST CASE 3 IS PASSED") ;   
    if(Arith_Flag_tb != 1'b1)  
      $display (" ARITHMATIC FLAG IS NOT RAISED ") ;
    else
      $display (" ARITHMATIC FLAG IS RAISED ") ;     
/***********************************************************************/ 
    $display ("TEST CASE 4") ;  // Test Division
    #3
    A_tb  = 16'b0011 ;
    B_tb  = 16'b0010 ;
    ALU_FUN_tb = 4'b0011 ; 
    #27
    if(Arith_OUT_tb != 16'b0001)
      $display ("TEST CASE 4 IS FAILED") ;
    else
      $display ("TEST CASE 4 IS PASSED") ;   
    if(Arith_Flag_tb != 1'b1)  
      $display (" ARITHMATIC FLAG IS NOT RAISED ") ;
    else
      $display (" ARITHMATIC FLAG IS RAISED ") ;     
/***********************************************************************/ 
    $display ("TEST CASE 5") ;  // Test Logical And
    #3
    A_tb  = 16'b0011 ;
    B_tb  = 16'b0010 ;
    ALU_FUN_tb = 4'b0100 ; 
    #27
    if(Logic_OUT_tb != 16'b0010)
      $display ("TEST CASE 5 IS FAILED") ;
    else
      $display ("TEST CASE 5 IS PASSED") ;   
    if(Logic_Flag_tb != 1'b1)  
      $display (" Logical FLAG IS NOT RAISED ") ;
    else
      $display (" Logical FLAG IS RAISED ") ;     
/***********************************************************************/
    $display ("TEST CASE 6") ;  // Test Logical Or
    #3
    A_tb  = 16'b0011 ;
    B_tb  = 16'b0010 ;
    ALU_FUN_tb = 4'b0101; 
    #37
    if(Logic_OUT_tb != 16'b0011)
      $display ("TEST CASE 6 IS FAILED") ;
    else
      $display ("TEST CASE 6 IS PASSED") ;   
    if(Logic_Flag_tb != 1'b1)  
      $display (" Logical FLAG IS NOT RAISED ") ;
    else
      $display (" Logical FLAG IS RAISED ") ;     
/***********************************************************************/
    $display ("TEST CASE 7") ;  // Test Logical Nand
    #3
    A_tb  = 16'b0011 ;
    B_tb  = 16'b0010 ;
    ALU_FUN_tb = 4'b0110; 
    #47
    if(Logic_OUT_tb != (~(A_tb & B_tb ) ) )
      $display ("TEST CASE 7 IS FAILED") ;
    else
      $display ("TEST CASE 7 IS PASSED") ;   
    if(Logic_Flag_tb != 1'b1)  
      $display (" Logical FLAG IS NOT RAISED ") ;
    else
      $display (" Logical FLAG IS RAISED ") ;     
/***********************************************************************/ 
    $display ("TEST CASE 8") ;  // Test Logical NOR
    #3
    A_tb  = 16'b0011 ;
    B_tb  = 16'b0010 ;
    ALU_FUN_tb = 4'b0111; 
    #57
    if(Logic_OUT_tb != (~(A_tb | B_tb ) ) )
      $display ("TEST CASE 8 IS FAILED") ;
    else
      $display ("TEST CASE 8 IS PASSED") ;   
    if(Logic_Flag_tb != 1'b1)  
      $display (" Logical FLAG IS NOT RAISED ") ;
    else
      $display (" Logical FLAG IS RAISED ") ;     

/***********************************************************************/
    $display ("TEST CASE 9") ;  // Test Compare Equality 
    #3
    A_tb  = 16'b0011 ;
    B_tb  = 16'b0011 ;
    ALU_FUN_tb = 4'b1001; 
    #78
    if(CMP_OUT_tb  != 4'b0001)
      $display ("TEST CASE 9 IS FAILED") ;
    else
      $display ("TEST CASE 9 IS PASSED") ;   
    if(Cmp_Flag_tb != 1'b1)  
      $display (" Cmp_Flag_tb IS NOT RAISED ") ;
    else
      $display (" Cmp_Flag_tb IS RAISED ") ;     
/***********************************************************************/  
    $display ("TEST CASE 10") ;  // Test Greater Than Or not 
    #3
    A_tb  = 16'b0011 ;
    B_tb  = 16'b0010 ;
    ALU_FUN_tb = 4'b1010; 
    #97
    if(CMP_OUT_tb  != 4'b0010)
      $display ("TEST CASE 10 IS FAILED") ;
    else
      $display ("TEST CASE 10 IS PASSED") ;   
    if(Cmp_Flag_tb != 1'b1)  
      $display (" Cmp_Flag_tb IS NOT RAISED ") ;
    else
      $display (" Cmp_Flag_tb IS RAISED ") ;     
/***********************************************************************/  
    $display ("TEST CASE 11") ;  // Test Less Than Or not 
    #3
    A_tb  = 16'b0010 ;
    B_tb  = 16'b0011 ;
    ALU_FUN_tb = 4'b1011 ; 
    #107
    if(CMP_OUT_tb  != 16'b0011  )
      $display ("TEST CASE 11 IS FAILED") ;
    else
      $display ("TEST CASE 11 IS PASSED") ;   
    if(Cmp_Flag_tb != 1'b1)  
      $display (" Cmp_Flag_tb IS NOT RAISED ") ;
    else
      $display (" Cmp_Flag_tb IS RAISED ") ; 
/***********************************************************************/  
    $display ("TEST CASE 12") ;  // Test No Operation  
    #3
    A_tb  = 16'b0010 ;
    B_tb  = 16'b0011 ;
    ALU_FUN_tb = 4'b1000 ; 
    #107
    if(CMP_OUT_tb  != 16'b0000  )
      $display ("TEST CASE 12 IS FAILED") ;
    else
      $display ("TEST CASE 12 IS PASSED") ;   
    if(Cmp_Flag_tb != 1'b1)  
      $display (" Cmp_Flag_tb IS NOT RAISED ") ;
    else
      $display (" Cmp_Flag_tb IS RAISED ") ;            
/***********************************************************************/  
    $display ("TEST CASE 13") ;  // SHIFT A RIGHT WITH 1
    #3
    A_tb  = 16'b0010 ;
    ALU_FUN_tb = 4'b1100 ; 
    #107
    if(SHIFT_OUT_tb  != 16'b0001  )
      $display ("TEST CASE 13 IS FAILED") ;
    else
      $display ("TEST CASE 13 IS PASSED") ;   
    if(Shift_Flag_tb != 1'b1)  
      $display (" Shift_Flag_tb IS NOT RAISED ") ;
    else
      $display (" Shift_Flag_tb IS RAISED ") ; 
/***********************************************************************/   
    $display ("TEST CASE 14") ;  // SHIFT A LEFT WITH 1
    #3
    A_tb  = 16'b0010 ;
    ALU_FUN_tb = 4'b1101 ; 
    #107
    if(SHIFT_OUT_tb  != 16'b0100  )
      $display ("TEST CASE 14 IS FAILED") ;
    else
      $display ("TEST CASE 14 IS PASSED") ;   
    if(Shift_Flag_tb != 1'b1)  
      $display (" Shift_Flag_tb IS NOT RAISED ") ;
    else
      $display (" Shift_Flag_tb IS RAISED ") ; 
/***********************************************************************/ 
    $display ("TEST CASE 15") ;  // SHIFT B RIGHT WITH 1
    #3
    B_tb  = 16'b0010 ;
    ALU_FUN_tb = 4'b1110 ; 
    #107
    if(SHIFT_OUT_tb  != 16'b0001  )
      $display ("TEST CASE 15 IS FAILED") ;
    else
      $display ("TEST CASE 15 IS PASSED") ;   
    if(Shift_Flag_tb != 1'b1)  
      $display (" Shift_Flag_tb IS NOT RAISED ") ;
    else
      $display (" Shift_Flag_tb IS RAISED ") ; 
/***********************************************************************/  
    $display ("TEST CASE 16") ;  // SHIFT B LEFT WITH 1
    #3
    B_tb  = 16'b0010 ;
    ALU_FUN_tb = 4'b1111 ; 
    #107
    if(SHIFT_OUT_tb  != 16'b0100  )
      $display ("TEST CASE 16 IS FAILED") ;
    else
      $display ("TEST CASE 16 IS PASSED") ;   
    if(Shift_Flag_tb != 1'b1)  
      $display (" Shift_Flag_tb IS NOT RAISED ") ;
    else
      $display (" Shift_Flag_tb IS RAISED ") ; 
/***********************************************************************/  
    $display ("TEST CASE 17") ;  // TESR ENABLE OF ARITHMATIC BLOCK 
    #3
    A_tb  = 16'b0011 ;
    B_tb  = 16'b0010 ;
    ALU_FUN_tb = 4'b1000 ; 
    #7
    if(Arith_OUT_tb != 16'b0000)
      $display ("TEST CASE 1 IS FAILED") ;
    else
      $display ("TEST CASE 1 IS PASSED") ;
    if(Arith_Flag_tb != 1'b1)  
      $display (" ARITHMATIC FLAG IS NOT RAISED ") ;
    else
      $display (" ARITHMATIC FLAG IS RAISED ") ;
/***********************************************************************/
    $display ("TEST CASE 18") ;  // TEST ENABLE OF LOGIC BLOCK
    #3
    A_tb  = 16'b0011 ;
    B_tb  = 16'b0010 ;
    ALU_FUN_tb = 4'b1001; 
    #37
    if(Logic_OUT_tb != 16'b0000)
      $display ("TEST CASE 18 IS FAILED") ;
    else
      $display ("TEST CASE 18 IS PASSED") ;   
    if(Logic_Flag_tb != 1'b1)  
      $display (" Logical FLAG IS NOT RAISED ") ;
    else
      $display (" Logical FLAG IS RAISED ") ;  
/***********************************************************************/
    $display ("TEST CASE 19") ;  // TEST ENABLE OF COMPARE BLOCK 
    #3
    A_tb  = 16'b0011 ;
    B_tb  = 16'b0011 ;
    ALU_FUN_tb = 4'b0101; 
    #78
    if(CMP_OUT_tb  != 4'b0000)
      $display ("TEST CASE 19 IS FAILED") ;
    else
      $display ("TEST CASE 19 IS PASSED") ;   
    if(Cmp_Flag_tb != 1'b1)  
      $display (" Cmp_Flag_tb IS NOT RAISED ") ;
    else
      $display (" Cmp_Flag_tb IS RAISED ") ;     
/***********************************************************************/
    $display ("TEST CASE 20") ;  // TEST ENABLE OF SHIFT BLOCK
    #3
    A_tb  = 16'b0010 ;
    ALU_FUN_tb = 4'b1000 ; 
    #107
    if(SHIFT_OUT_tb  != 16'b0000  )
      $display ("TEST CASE 20 IS FAILED") ;
    else
      $display ("TEST CASE 20 IS PASSED") ;   
    if(Shift_Flag_tb != 1'b1)  
      $display (" Shift_Flag_tb IS NOT RAISED ") ;
    else
      $display (" Shift_Flag_tb IS RAISED ") ; 
/***********************************************************************/
    $display ("TEST CASE 21") ;  // TEST RESET OF THE ARITHMATIC BLOCK
    #3
    A_tb  = 16'b0011 ;
    B_tb  = 16'b0010 ;
    ALU_FUN_tb = 4'b0000 ; 
    RST_ARITH_tb = 1'b0  ; 
    #7
    if(Arith_OUT_tb != 16'b0000)
      $display ("TEST CASE 21 IS FAILED") ;
    else
      $display ("TEST CASE 21 IS PASSED") ;
    if(Arith_Flag_tb != 1'b1)  
      $display (" ARITHMATIC FLAG IS NOT RAISED ") ;
    else
      $display (" ARITHMATIC FLAG IS RAISED ") ;
/***********************************************************************/ 
    $display ("TEST CASE 22") ;  // TEST RESET OF THE LOGIC BLOCK
    #3
    A_tb  = 16'b0011 ;
    B_tb  = 16'b0010 ;
    RST_LOGIC_tb = 1'b0  ;
    ALU_FUN_tb = 4'b0100 ; 
    
    #27
    if(Logic_OUT_tb != 16'b0000)
      $display ("TEST CASE 22 IS FAILED") ;
    else
      $display ("TEST CASE 22 IS PASSED") ;   
    if(Logic_Flag_tb != 1'b1)  
      $display (" Logical FLAG IS NOT RAISED ") ;
    else
      $display (" Logical FLAG IS RAISED ") ;     
/***********************************************************************/ 
    $display ("TEST CASE 23") ;  // TEST RESET OF THE COMPARE BLOCK 
    #3
    A_tb  = 16'b0011 ;
    B_tb  = 16'b0011 ;
    ALU_FUN_tb = 4'b1001; 
    RST_CMP_tb   = 1'b0 ;
    #78
    if(CMP_OUT_tb  != 4'b0000)
      $display ("TEST CASE 23 IS FAILED") ;
    else
      $display ("TEST CASE 23 IS PASSED") ;   
    if(Cmp_Flag_tb != 1'b1)  
      $display (" Cmp_Flag_tb IS NOT RAISED ") ;
    else
      $display (" Cmp_Flag_tb IS RAISED ") ;     
/***********************************************************************/
    $display ("TEST CASE 24") ;  // TEST RESET OF THE SHIFT BLOCK 
    #3
    B_tb  = 16'b0010 ;
    ALU_FUN_tb = 4'b1110 ;
    RST_SHIFT_tb = 1'b0  ; 
    #107
    if(SHIFT_OUT_tb  != 16'b0000  )
      $display ("TEST CASE 24 IS FAILED") ;
    else
      $display ("TEST CASE 24 IS PASSED") ;   
    if(Shift_Flag_tb != 1'b1)  
      $display (" Shift_Flag_tb IS NOT RAISED ") ;
    else
      $display (" Shift_Flag_tb IS RAISED ") ; 
/***********************************************************************/                    
    #100
    $finish ;  
  
      
end 

// Clock Generator  
always begin
  #6 CLK_tb = 1'b1 ;
  #4 CLK_tb = 1'b0 ;
end
  
// instaniate design instance 
ALU_TOP DUT (
 .A(A_tb)                  ,
 .B(B_tb)                  ,
 .ALU_FUN(ALU_FUN_tb )     , 
 .CLK(CLK_tb)              ,
 .Arith_OUT(Arith_OUT_tb)  ,
 .Arith_Flag(Arith_Flag_tb),
 .Carry_OUT(Carry_OUT_tb)  ,
 .Logic_OUT(Logic_OUT_tb)  ,
 .Logic_Flag(Logic_Flag_tb),
 .CMP_OUT(CMP_OUT_tb)      ,
 .CMP_Flag(Cmp_Flag_tb)    ,
 .SHIFT_OUT(SHIFT_OUT_tb)  ,
 .SHIFT_Flag(Shift_Flag_tb),
 .RST_ARITH(RST_ARITH_tb)  ,
 .RST_LOGIC(RST_LOGIC_tb)  , 
 .RST_CMP(RST_CMP_tb)      ,
 .RST_SHIFT(RST_SHIFT_tb) 
);

  
endmodule
  