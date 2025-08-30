module alu (
    input [7:0] a, b,       // 8-bit inputs
    input [3:0] op,         // 4-bit operation code
    output reg [7:0] result, // 8-bit result
    output reg zero,         // Zero flag
    output reg carry,        // Carry flag
    output reg overflow     // Overflow flag
);

    // Operation codes
    parameter OP_ADD  = 4'b0000; // Addition
    parameter OP_SUB  = 4'b0001; // Subtraction
    parameter OP_AND  = 4'b0010; // Bitwise AND
    parameter OP_OR   = 4'b0011; // Bitwise OR
    parameter OP_XOR  = 4'b0100; // Bitwise XOR
    parameter OP_NOT  = 4'b0101; // Bitwise NOT (on A)
    parameter OP_NEG  = 4'b0110; // 2's complement negation (of A)
    parameter OP_SHL  = 4'b0111; // Shift left logical
    parameter OP_SHR  = 4'b1000; // Shift right logical
    parameter OP_SAR  = 4'b1001; // Shift right arithmetic
    parameter OP_INC  = 4'b1010; // Increment A
    parameter OP_DEC  = 4'b1011; // Decrement A
    parameter OP_MUL  = 4'b1100; // Multiplication (lower 8 bits)
    parameter OP_CMP  = 4'b1101; // Compare (A - B, set flags only)

    reg [8:0] temp_result; // 9-bit for carry detection

    always @(*) begin
        carry = 0;
        overflow = 0;
        zero = 0;
        temp_result = 0;

        case (op)
            OP_ADD: begin
                temp_result = a + b;
                result = temp_result[7:0];
                carry = temp_result[8];
                overflow = (a[7] == b[7]) && (result[7] != a[7]);
            end
            
            OP_SUB: begin
                temp_result = a - b;
                result = temp_result[7:0];
                carry = temp_result[8];
                overflow = (a[7] != b[7]) && (result[7] != a[7]);
            end
            
            OP_AND: result = a & b;
            OP_OR:  result = a | b;
            OP_XOR: result = a ^ b;
            OP_NOT: result = ~a;
            
            OP_NEG: begin
                result = ~a + 1;
                overflow = (a == 8'b10000000); // Overflow if negating -128
            end
            
            OP_SHL: begin
                result = a << b[2:0]; // Shift by lower 3 bits of b
                carry = a[8 - b[2:0]];
            end
            
            OP_SHR: begin
                result = a >> b[2:0];
                carry = a[b[2:0] - 1];
            end
            
            OP_SAR: begin
                result = $signed(a) >>> b[2:0];
                carry = a[b[2:0] - 1];
            end
            
            OP_INC: begin
                temp_result = a + 1;
                result = temp_result[7:0];
                carry = temp_result[8];
                overflow = (a == 8'b01111111); // 127 + 1
            end
            
            OP_DEC: begin
                temp_result = a - 1;
                result = temp_result[7:0];
                carry = temp_result[8];
                overflow = (a == 8'b10000000); // -128 - 1
            end
            
            OP_MUL: begin
  temp_result = a * b;           // 16-bit multiplication
  result = temp_result[7:0];     // Lower 8 bits
  carry = (temp_result[15:8] != 0) ? 1'b1 : 1'b0;  // Carry=1 if upper bits ? 0
end
            end
            
            OP_CMP: begin
                temp_result = a - b;
                result = a; // Result doesn't change for compare
                carry = temp_result[8];
                overflow = (a[7] != b[7]) && (temp_result[7] != a[7]);
            end
            
            default: result = 8'b0;
        endcase

        // Zero flag is set when result is zero (except for CMP which is based on A-B)
        if (op == OP_CMP)
            zero = (temp_result[7:0] == 8'b0);
        else
            zero = (result == 8'b0);
    end

endmodule
