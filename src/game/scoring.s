.include "../constants/address_map_arm.s"
.include "../constants/defines.s"
.extern p1_score
.extern p2_score
.extern update_hex
.extern game_state
.extern winner

/* This file:
 * 1. provides the function to update the scores in the game and update the HEX display updating flag accordingly
 */


/* The function UPDATE_SCORES:
 * 1. updates the scores of the players based on the scoring conditions
 * 2. sets the update_hex flag to indicate that the HEX display needs to be updated
 * Arguments: R0 = player number (1 or 2) 
 * Returns: None
 */


.global UPDATE_SCORES
UPDATE_SCORES:
    PUSH {R1-R2, LR}

    CMP R0, 1
    LDREQ R2, =p1_score
    LDRNE R2, =p2_score

    // Update player score
    LDR R1, [R2] // Load current score
    ADD R1, R1, #1 // Increment score
    STR R1, [R2] // Store updated score back to memory

    CMP R1, #WINNING_SCORE
    BLGE END_GAME // Check if the game has ended after updating the score

    // Set update_hex flag to indicate that the HEX display needs to be updated
    LDR R1, =update_hex
    MOV R2, #1
    STR R2, [R1]

    END_UPDATE_SCORES:
    POP {R1-R2, PC}


/* The function END_GAME:
 * 1. sets the game state to STATE_WIN to indicate that the game has ended
 * Arguments: R0 = player number (1 or 2)
 * Returns: None
 */


END_GAME:

    PUSH {R1-R2, LR}

    LDR R1, =winner
    STR R0, [R1] // Store the winner player number in the winner variable

    // Set game state to STATE_WIN
    LDR R1, =game_state
    MOV R2, #STATE_WIN
    STR R2, [R1]

    POP {R1-R2, PC}
    


    