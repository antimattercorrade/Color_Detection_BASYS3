`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/12/2015 09:24:30 PM
// Design Name: 
// Module Name: clkdivider
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module clkdivider(
input clk,
output clkout1,
output clkout2,
output clkOut
);

wire Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, Q9, Q10, Q11, Q12, Q13, Q14, Q15, Q16, Q17, Q18, Q19, Q20, Q21,Q22,Q23,Q24,Q25;
assign clkout1 = Q17;
assign clkout2 = Q18;


// input clock is 100Mhz, Q = 50MHz

FDCE #(
.INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_0 (
      .Q(Q0),      // Data output
      .C(clk),      // Clock input
      .CE(1'b1),    // Clock enable input
      .CLR(1'b0),  // Asynchronous clear input
      .D(!Q0)       // Data input
);

// input clock is 50Mhz, Q = 25MHz
FDCE #(
.INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_1 (
      .Q(Q1),      // Data output
      .C(Q0),      // Clock input
      .CE(1'b1),    // Clock enable input
      .CLR(1'b0),  // Asynchronous clear input
      .D(!Q1)       // Data input
);

// input clock is 25Mhz, Q = 12.5MHz
FDCE #(
.INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_2 (
      .Q(Q2),      // Data output
      .C(Q1),      // Clock input
      .CE(1'b1),    // Clock enable input
      .CLR(1'b0),  // Asynchronous clear input
      .D(!Q2)       // Data input
);

// input clock is 12.5Mhz, Q = 6.25MHz
FDCE #(
.INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_3 (
      .Q(Q3),      // Data output
      .C(Q2),      // Clock input
      .CE(1'b1),    // Clock enable input
      .CLR(1'b0),  // Asynchronous clear input
      .D(!Q3)       // Data input
);

// input clock is 6.25Mhz, Q = 3.125MHz
FDCE #(
.INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_4 (
      .Q(Q4),      // Data output
      .C(Q3),      // Clock input
      .CE(1'b1),    // Clock enable input
      .CLR(1'b0),  // Asynchronous clear input
      .D(!Q4)       // Data input
);

// input clock is 3.125Mhz, Q = 1.5625MHz
FDCE #(
.INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_5 (
      .Q(Q5),      // Data output
      .C(Q4),      // Clock input
      .CE(1'b1),    // Clock enable input
      .CLR(1'b0),  // Asynchronous clear input
      .D(!Q5)       // Data input
);

// input clock is 1.5625Mhz, Q = 781.25kHz
FDCE #(
.INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_6 (
      .Q(Q6),      // Data output
      .C(Q5),      // Clock input
      .CE(1'b1),    // Clock enable input
      .CLR(1'b0),  // Asynchronous clear input
      .D(!Q6)       // Data input
);

// input clock is 781.25khz, Q = 390.625kHz
FDCE #(
.INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_7 (
      .Q(Q7),      // Data output
      .C(Q6),      // Clock input
      .CE(1'b1),    // Clock enable input
      .CLR(1'b0),  // Asynchronous clear input
      .D(!Q7)       // Data input
);

// input clock is 1390.625khz, Q = 195.3125kHz
FDCE #(
.INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_8 (
      .Q(Q8),      // Data output
      .C(Q7),      // Clock input
      .CE(1'b1),    // Clock enable input
      .CLR(1'b0),  // Asynchronous clear input
      .D(!Q8)       // Data input
);

// input clock is 195.3125khz, Q = 97.65625kHz
FDCE #(
.INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_9 (
      .Q(Q9),      // Data output
      .C(Q8),      // Clock input
      .CE(1'b1),    // Clock enable input
      .CLR(1'b0),  // Asynchronous clear input
      .D(!Q9)       // Data input
);

// input clock is 97.65625khz, Q = 48.828125kHz
FDCE #(
.INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_10 (
      .Q(Q10),      // Data output
      .C(Q9),      // Clock input
      .CE(1'b1),    // Clock enable input
      .CLR(1'b0),  // Asynchronous clear input
      .D(!Q10)       // Data input
);

// input clock is 48.828125khz, Q = 24.4140625kHz
FDCE #(
.INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_11 (
      .Q(Q11),      // Data output
      .C(Q10),      // Clock input
      .CE(1'b1),    // Clock enable input
      .CLR(1'b0),  // Asynchronous clear input
      .D(!Q11)       // Data input
);

// input clock is 24.4140625khz, Q = 12.20703125KHz
FDCE #(
.INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_12 (
      .Q(Q12),      // Data output
      .C(Q11),      // Clock input
      .CE(1'b1),    // Clock enable input
      .CLR(1'b0),  // Asynchronous clear input
      .D(!Q12)       // Data input
);

// input clock is 12.20703125Khz, Q = 6.103515625KHz
FDCE #(
.INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_13 (
      .Q(Q13),      // Data output
      .C(Q12),      // Clock input
      .CE(1'b1),    // Clock enable input
      .CLR(1'b0),  // Asynchronous clear input
      .D(!Q13)       // Data input
);

// input clock is 6.103515625Khz, Q = 3.0517578125KHz
FDCE #(
.INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_14 (
      .Q(Q14),      // Data output
      .C(Q13),      // Clock input
      .CE(1'b1),    // Clock enable input
      .CLR(1'b0),  // Asynchronous clear input
      .D(!Q14)       // Data input
);

// input clock is 3.0517578125Khz, Q = 1.52587890625KHz
FDCE #(
.INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_15 (
      .Q(Q15),      // Data output
      .C(Q14),      // Clock input
      .CE(1'b1),    // Clock enable input
      .CLR(1'b0),  // Asynchronous clear input
      .D(!Q15)       // Data input
);

// input clock is 1.52587890625Khz, Q = 762.939453125Hz
FDCE #(
.INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_16 (
      .Q(Q16),      // Data output
      .C(Q15),      // Clock input
      .CE(1'b1),    // Clock enable input
      .CLR(1'b0),  // Asynchronous clear input
      .D(!Q16)       // Data input
);

// input clock is 762.939453125hz, Q = 381.4697265625Hz
FDCE #(
.INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_17 (
      .Q(Q17),      // Data output
      .C(Q16),      // Clock input
      .CE(1'b1),    // Clock enable input
      .CLR(1'b0),  // Asynchronous clear input
      .D(!Q17)       // Data input
);

// input clock is 381.46972656251hz, Q = 190.73486328125Hz
FDCE #(
.INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_18 (
      .Q(Q18),      // Data output
      .C(Q17),      // Clock input
      .CE(1'b1),    // Clock enable input
      .CLR(1'b0),  // Asynchronous clear input
      .D(!Q18)       // Data input
);

// input clock is 190.73486328125hz, Q = 95.367431640625Hz
FDCE #(
.INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_19 (
      .Q(Q19),      // Data output
      .C(Q18),      // Clock input
      .CE(1'b1),    // Clock enable input
      .CLR(1'b0),  // Asynchronous clear input
      .D(!Q19)       // Data input
);

// input clock is 95.367431640625hz, Q = 47.6837158203125Hz
FDCE #(
.INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_20 (
      .Q(Q20),      // Data output
      .C(Q19),      // Clock input
      .CE(1'b1),    // Clock enable input
      .CLR(1'b0),  // Asynchronous clear input
      .D(!Q20)       // Data input
);

// input clock is 47.6837158203125hz, Q = 23.84185791015625Hz
FDCE #(
.INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_21 (
      .Q(Q21),      // Data output
      .C(Q20),      // Clock input
      .CE(1'b1),    // Clock enable input
      .CLR(1'b0),  // Asynchronous clear input
      .D(!Q21)       // Data input
);

// input clock is 23.84185791015625Hz, Q = 11.92092895507813Hz
FDCE #(
.INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_22 (
      .Q(Q22),      // Data output
      .C(Q21),      // Clock input
      .CE(1'b1),    // Clock enable input
      .CLR(1'b0),  // Asynchronous clear input
      .D(!Q22)       // Data input
);

// input clock is 11.92092895507813Hz, Q = 5.96046445Hz
FDCE #(
.INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_23 (
      .Q(Q23),      // Data output
      .C(Q22),      // Clock input
      .CE(1'b1),    // Clock enable input
      .CLR(1'b0),  // Asynchronous clear input
      .D(!Q23)       // Data input
);

// input clock is 5.96046445Hz, Q = 2.98023223Hz
FDCE #(
.INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_24 (
      .Q(Q24),      // Data output
      .C(Q23),      // Clock input
      .CE(1'b1),    // Clock enable input
      .CLR(1'b0),  // Asynchronous clear input
      .D(!Q24)       // Data input
);

// input clock is 2.9802322Hz, Q = 1.49011611Hz
FDCE #(
.INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_25 (
      .Q(Q25),      // Data output
      .C(Q24),      // Clock input
      .CE(1'b1),    // Clock enable input
      .CLR(1'b0),  // Asynchronous clear input
      .D(!Q25)       // Data input
);


BUFG U_BUFG (
      .O(clkOut),     // Clock buffer output
      .I(Q25)      // Clock buffer input
);





endmodule


/*********************************************************
can also use the normal counter to do clock divider
module clkdiv (
input masterclk,
input clear,
input clk x
);
reg [n:0] q
always @(posedge mclk or posedge clear)
 begin 
   if (clear ==1)
      q<=0;
   else q <= q+1;
 end
 
 assign clk x = q[a];
 
endmodule
***********************************************/