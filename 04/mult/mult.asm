// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Initialize a to the value of R0 (RAM[0])
@R0 
D=M
@a
M=D

// Initialize b to the value of R1 (RAM[0])
@R1
D=M
@b
M=D

// Initialize result to 0
@result 
M=0

// Loop as long as b > 0
(LOOP)

    // If b == 0 exit loop
    @b
    D=M
    @SAVE
    D;JEQ

    //b--
    D=D-1
    @b
    M=D

    // add a to result
    @a
    D=M // save a in D
    @result
    M=M+D

    // Continue looping
    @LOOP
    0;JMP

(SAVE)

// Save a to R2 (RAM[2])
@result
D=M
@R2
M=D

@END
0;JMP

(END)
@END
0;JMP