// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

(INPUT)
    @SCREEN
    D=A
    @currentFill
    M=D         // @current is the word we want to fill
    @currentClear
    M=D


    @KBD // get current key value
    D=M

    @FILL // if key > 0, jump to FILL
    D; JGT

    @CLEAR // if key == 0, jump to CLEAR
    D; JEQ

    @INPUT
    0;JMP

(FILL)
    @24576      // This is the last screen address. 
    D=A
    @currentFill
    D=M-D       // Check if A is the last screen address.
    @INPUT
    D; JEQ      // jump to end if A held the last screen address.

    @currentFill
    A=M
    M=-1
    D=A
    @currentFill
    M=M+1


    @FILL
    0;JMP

(CLEAR)
    @24576      // This is the last screen address. 
    D=A
    @currentClear
    D=M-D       // Check if A is the last screen address.
    @INPUT
    D; JEQ      // jump to end if A held the last screen address.

    @currentClear
    A=M
    M=0
    D=A
    @currentClear
    M=M+1

    @CLEAR
    0;JMP

(END)
@END
0;JMP