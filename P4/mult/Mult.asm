

// Initialize variables
@result
M=0          // Set result to 0
@counter
M=0          // Set counter to 0

// Main loop to perform addition
(LOOP)
    @counter
    D=M      // Load counter
    @limit
    D=D-M    // Compare counter with limit (0)
    @END
    D;JGE    // If counter >= limit, jump to END

    @operand
    D=M      // Load operand
    @result
    M=D+M    // Add operand to result
    @counter
    M=M+1    // Increment counter
    @LOOP
    0;JMP    // Repeat LOOP

// End of the program
(END)
    @END
    0;JMP    // Infinite loop to halt the program

// Constants
@0
D=A
@limit
M=D          // Set limit to 0

@1
D=A
@operand
M=D          // Set operand to 1

@2
D=A
@result
M=D          // Set result to 2 (initial value, if needed)
