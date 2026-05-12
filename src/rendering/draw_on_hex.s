.include "../constants/address_map_arm.s"
.include "../constants/defines.s"
.extern p1_score
.extern p2_score
.extern update_hex


/* This file:
 * 1. includes function to show the score on the hex display by writing data to the hex display registers.
 */


/* The function DRAW_ON_HEX:
 * 1. shows the score on the hex display by writing data to the hex display registers.
 * 2. it takes no parameters and returns nothing.
 * Arguments: None
 * Returns: None
 */


.global DRAW_ON_HEX
DRAW_ON_HEX:
    PUSH {R0-R3, LR}

    LDR R0, =HEX3_HEX0_BASE // Base address of HEX3-HEX0

    LDR R1, =p1_score
    LDR R1, [R1] // Load player 1 score into R1

    LDR R2, =HEX_Table

    CMP R1, #10       // Check if player 1 score is 10
    BEQ OVER_SCREEN

    LDRB R1, [R2, R1] // Get the corresponding hex
    LSL R1, R1, #24 // Shift to the correct position for HEX3

    LDR R3, =p2_score
    LDR R3, [R3] // Load player 2 score into R3

    CMP R3, #10       // Check if player 2 score is 10
    BEQ OVER_SCREEN

    LDRB R3, [R2, R3] // Get the corresponding hex no need to shift since it's for HEX0
    ORR R1, R1, R3 // Combine player 1 and player 2 scores into one value

    /* Line between player 1 and player 2 scores on the hex display */
    MOV R3, #0x40 // 0b01000000 to light up the middle segment of HEX
    LSL R3, R3, #8 // Shift to the correct position for HEX1
    ORR R3, R3, R3, LSL #8 // Shift again to the correct position for HEX2 and combine with the existing value  
    ORR R1, R1, R3 // Combine with the existing score value
    B END_DRAW_ON_HEX

    OVER_SCREEN:
    LDR R1, =0x5C1C7B50 // Hex value to display "OVER" on the hex display

    END_DRAW_ON_HEX:
    STR R1, [R0] // Write the combined value to the HEX display
    LDR R0, =update_hex
    MOV R1, #0 // Clear the update_hex flag after updating the hex display
    STR R1, [R0]

    POP {R0-R3, PC}


/* reading values with ldrb command*/
.data
HEX_Table: .byte 0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F // Hex values for digits 0-9