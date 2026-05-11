.include "../constants/address_map_arm.s"
.include "../constants/defines.s"
.extern winner
.extern p1_score
.extern p2_score


/* This file:
 * 1. icludes functions to draw the title screen and the win screen by writing pixel data to character buffer.
 * 2. includes called function to write strings to the character buffer.
 * 3. The DRAW_TITLE function displays the title screen with the game title and a prompt to start the game.
 * 4. The DRAW_WIN function displays the win screen with the winner's name and the final scores of both players.
 */


/* The function DRAW_TITLE:
 * 1. displays the title screen with the game title and a prompt to start the game.
 * 2. it takes no parameters and returns nothing.
 * Arguments: None
 * Returns: None
 */


.global DRAW_TITLE
DRAW_TITLE:
    PUSH {R0-R4, LR}

    LDR R0, =title_str
    MOV R1, #36            // x = (80-8)/2 since title is 8 characters long
    MOV R2, #25            // y = 25 to be in the upper half of the screen
    BL WRITE_STRING

    LDR R0, =press_str
    MOV R1, #28            // x = (80-24)/2 since prompt is 24 characters long
    MOV R2, #30            // y = 30 to be below the title   
    BL WRITE_STRING

    POP {R0-R4, PC}


/* The function DRAW_WIN:
 * 1. displays the win screen with the winner's name and the final scores of both players.
 * 2. it takes no parameters and returns nothing.
 * Arguments: None
 * Returns: None
 */


.global DRAW_WIN
DRAW_WIN:
    PUSH {R0-R5, LR}

    LDR R5, =winner
    LDR R5, [R5]

    CMP R5, #1       // Check if player 1 is the winner
    LDREQ R0, =p1_wins_str
    LDRNE R0, =p2_wins_str
    MOV R1, #33            // x = (80-14)/2 since win message is 14 characters long
    MOV R2, #25            // y = 25 to be in the upper half of the screen
    BL WRITE_STRING

    // P1 score writing
    LDR R0, =score_p1_str
    MOV R1, #30
    MOV R2, #30
    BL WRITE_STRING

    LDR R3, =p1_score
    LDR R3, [R3]
    ADD R3, R3, #48       // ASCII conversion for score digit
    LDR R4, =FPGA_CHAR_BASE
    MOV R5, #30           // y = 30 to be below the win message
    LSL R5, R5, #7        // y * 128
    ADD R5, R5, #39       // x=39
    ADD R4, R4, R5
    STRB R3, [R4]

    // P2 score writing
    LDR R0, =score_p2_str
    MOV R1, #41
    MOV R2, #30
    BL WRITE_STRING

    LDR R3, =p2_score
    LDR R3, [R3]
    ADD R3, R3, #48       // ASCII conversion for score digit
    LDR R4, =FPGA_CHAR_BASE
    MOV R5, #30           // y = 30 to be below the win message
    LSL R5, R5, #7        // y * 128
    ADD R5, R5, #50       // x=50
    ADD R4, R4, R5
    STRB R3, [R4]

    POP {R0-R5, PC}


/* The function WRITE_STRING:
 * Arguments: R0 = string address, R1 = x, R2 = y
 * Returns: None
 */
WRITE_STRING:
    PUSH {R3-R5, LR}

    LSL R3, R2, #7         // y * 128
    ADD R3, R3, R1         // + x
    LDR R4, =FPGA_CHAR_BASE
    ADD R4, R4, R3

    WRITE_LOOP:
        LDRB R5, [R0], #1
        CMP R5, #0
        BEQ WRITE_DONE
        STRB R5, [R4], #1
        B WRITE_LOOP

    WRITE_DONE:
    POP {R3-R5, PC}


/* data section for strings used in the title and win screens, since special to this file, not in globals or constants */
.data
title_str:    .asciz "SOC-PONG"
press_str:    .asciz "PRESS ANY KEY TO START"
p1_wins_str:  .asciz "PLAYER 1 WINS!"
p2_wins_str:  .asciz "PLAYER 2 WINS!"
score_p1_str: .asciz "P1:"
score_p2_str: .asciz "P2:"