.include "../constants/address_map_arm.s"
.include "../constants/defines.s"
.extern winner
.extern p1_score
.extern p2_score
.extern state_changed


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
    LDR R4, =FPGA_CHAR_BASE
    MOV R1, #30           // y = 30
    LSL R1, R1, #7        // y * 128
    ADD R1, R1, #39       // x = 39
    ADD R4, R4, R1
    CMP R5, #1            // Is P1 the winner? (score = 10)
    BNE P1_SINGLE_DIGIT
    MOV R3, #'1'
    STRB R3, [R4], #1
    MOV R3, #'0'
    STRB R3, [R4]
    B P1_SCORE_DONE
P1_SINGLE_DIGIT:
    ADD R3, R3, #48
    STRB R3, [R4]
P1_SCORE_DONE:

    // P2 score writing
    LDR R0, =score_p2_str
    MOV R1, #41
    MOV R2, #30
    BL WRITE_STRING

    LDR R3, =p2_score
    LDR R3, [R3]
    LDR R4, =FPGA_CHAR_BASE
    MOV R1, #30           // y = 30
    LSL R1, R1, #7        // y * 128
    ADD R1, R1, #50       // x = 50
    ADD R4, R4, R1
    CMP R5, #2            // Is P2 the winner? (score = 10)
    BNE P2_SINGLE_DIGIT
    MOV R3, #'1'
    STRB R3, [R4], #1
    MOV R3, #'0'
    STRB R3, [R4]
    B P2_SCORE_DONE
P2_SINGLE_DIGIT:
    ADD R3, R3, #48
    STRB R3, [R4]
P2_SCORE_DONE:

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


/* The function CLEAR_CHAR_BUFFER:
 * 1. clears the character buffer by writing spaces to all positions.
 * 2. it takes no parameters and returns nothing.
 * Arguments: None
 * Returns: None
 */


.global CLEAR_CHAR_BUFFER
CLEAR_CHAR_BUFFER:
    PUSH {R0-R3, LR}

    //Clear state change flag since we are redrawing the whole screen
    LDR R0, =state_changed
    MOV R1, #0
    STR R1, [R0]

    LDR R0, =FPGA_CHAR_BASE
    MOV R1, #0              // satır sayacı
    CHAR_CLEAR_Y:
        MOV R2, #0          // sütun sayacı
        CHAR_CLEAR_X:
            MOV R3, #0x20   // boşluk karakteri
            STRB R3, [R0]
            ADD R0, R0, #1
            ADD R2, R2, #1
            CMP R2, #80
            BNE CHAR_CLEAR_X
        ADD R0, R0, #48     // 128 - 80 = 48 byte atla (padding)
        ADD R1, R1, #1
        CMP R1, #60
        BNE CHAR_CLEAR_Y

    POP {R0-R3, PC}


/* data section for strings used in the title and win screens, since special to this file, not in globals or constants */
.data
title_str:    .asciz "SOC-PONG"
press_str:    .asciz "PRESS ANY KEY TO START"
p1_wins_str:  .asciz "PLAYER 1 WINS!"
p2_wins_str:  .asciz "PLAYER 2 WINS!"
score_p1_str: .asciz "P1:"
score_p2_str: .asciz "P2:"