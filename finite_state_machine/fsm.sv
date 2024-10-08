// Code your design here

module examplfsm(input logic clk,
                 input logic rst,
                 input logic X,
                 output logic Y);
  
  typedef enum logic [2:0]{A,B,C,D,E} State;
  State currentState, nextState;
  
  always_ff @(posedge clk)
    if(rst) currentState <= A;
  else currentState<= nextState;
  
  always_comb
    case (currentState)
      A:{nextState,Y} = X?{C,1'b0}:{B,1'b1};
//       A:if(X) nextState = C;
//       	else nextState = B;
      B:if(X) nextState = D;
      	else nextState = B;
      C:if(X) nextState = C;
      	else nextState = E;
      D:if(X) nextState = C;
      	else nextState = E;
      E:if(X) nextState = D;
      	else nextState = B;
      default: nextState = A;
    endcase
//   assign Y = (currentState == D | currentState == E);
        
endmodule
        
