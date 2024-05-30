// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.


// Initialize the flag
@flag
M=-1       // Set flag to -1 to indicate initial state
D=0        // Clear D register
@UPDATE_SCREEN
0;JMP      // Jump to UPDATE_SCREEN to start screen update

// Main loop to check keyboard input
(CHECK_KEY)
    @KBD
    D=M         // Read keyboard input
    @UPDATE_SCREEN
    D;JEQ       // If no key is pressed, jump to UPDATE_SCREEN
    D=-1        // Set D to -1 if a key is pressed

// Update the screen based on the flag
(UPDATE_SCREEN)
    @input_temp
    M=D         // Store D in input_temp
    @flag
    D=D-M       // Subtract flag from D
    @CHECK_KEY
    D;JEQ       // If D equals flag, jump to CHECK_KEY to continue checking

    @input_temp
    D=M         // Load input_temp into D
    @flag
    M=D         // Update flag with D

    @SCREEN
    D=A         // Load screen base address
    @8192
    D=D+A       // Offset for screen size
    @screen_index
    M=D         // Store result in screen_index

// Draw loop to update the screen pixels
(DRAW_LOOP)
    @screen_index
    D=M-1       // Decrement screen_index
    M=D         // Store decremented value in screen_index
    @CHECK_KEY
    D;JLT       // If screen_index is less than zero, jump to CHECK_KEY

    @flag
    D=M         // Load flag into D
    @screen_index
    A=M         // Set A to the value in screen_index
    M=D         // Set screen pixel to flag value

    // Loop to the next pixel
    @DRAW_LOOP
    0;JMP       // Repeat DRAW_LOOP

// Define constants
@16384
D=A
@SCREEN
M=D              // SCREEN base address

@24575
D=A
@SCREEN_END
M=D              // SCREEN end address

@24576
D=A
@KBD
M=D              // KBD address

// Initialize Position variable
@SCREEN
D=A
@Position
M=D              // Set initial position to SCREEN base address

// End of the program
(END)
@END
0;JMP            // Infinite loop to halt the program









