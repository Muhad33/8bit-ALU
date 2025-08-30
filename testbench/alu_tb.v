`timescale 1ns/1ps

module alu_tb;
    reg [7:0] a, b;
    reg [3:0] op;
    wire [7:0] result;
    wire zero, carry, overflow;
    
    // Instantiate the ALU
    alu uut (
        .a(a),
        .b(b),
        .op(op),
        .result(result),
        .zero(zero),
        .carry(carry),
        .overflow(overflow)
    );
    
    initial begin
        // Initialize inputs
        a = 0;
        b = 0;
        op = 0;
        
        // Monitor changes
        $monitor("Time=%0t: A=%h B=%h OP=%b Result=%h Z=%b C=%b O=%b", 
                 $time, a, b, op, result, zero, carry, overflow);
        
        // Test cases
        
        // ADD
        #10 a = 8'h05; b = 8'h03; op = 4'b0000;
        #10 a = 8'h7F; b = 8'h01; // Test overflow (127 + 1)
        #10 a = 8'hFF; b = 8'h01; // Test carry (255 + 1)
        
        // SUB
        #10 a = 8'h0A; b = 8'h03; op = 4'b0001;
        #10 a = 8'h80; b = 8'h01; // Test overflow (-128 - 1)
        #10 a = 8'h00; b = 8'h01; // Test carry (0 - 1)
        
        // AND
        #10 a = 8'hAA; b = 8'h0F; op = 4'b0010;
        
        // OR
        #10 a = 8'hA0; b = 8'h0F; op = 4'b0011;
        
        // XOR
        #10 a = 8'hAA; b = 8'h55; op = 4'b0100;
        
        // NOT
        #10 a = 8'hAA; op = 4'b0101;
        
        // NEG
        #10 a = 8'h05; op = 4'b0110;
        #10 a = 8'h80; // Test overflow (-128)
        
        // SHL
        #10 a = 8'h01; b = 8'h03; op = 4'b0111; // Shift left by 3
        #10 a = 8'h80; b = 8'h01; // Test carry
        
        // SHR
        #10 a = 8'h80; b = 8'h03; op = 4'b1000; // Shift right by 3
        #10 a = 8'h01; b = 8'h01; // Test carry
        
        // SAR
        #10 a = 8'h80; b = 8'h03; op = 4'b1001; // Arithmetic shift right
        #10 a = 8'h40; b = 8'h01;
        
        // INC
        #10 a = 8'h05; op = 4'b1010;
        #10 a = 8'h7F; // Test overflow
        
        // DEC
        #10 a = 8'h05; op = 4'b1011;
        #10 a = 8'h80; // Test overflow
        
        // MUL
        #10 a = 8'h05; b = 8'h03; op = 4'b1100;
        #10 a = 8'h10; b = 8'h10; // Test carry
        
        // CMP
        #10 a = 8'h05; b = 8'h05; op = 4'b1101;
        #10 a = 8'h05; b = 8'h06;
        #10 a = 8'h80; b = 8'h7F; // Test overflow
        
        #10 $finish;
    end
    
endmodule
