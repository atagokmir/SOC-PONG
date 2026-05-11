.include "../constants/address_map_arm.s"
.include "../constants/defines.s"
.extern p1_score
.extern p2_score
.extern update_hex
.extern game_state
.extern winner
.extern ball_dx
.extern ball_dy
.extern ball_x
.extern ball_y
.extern p1_y
.extern p2_y
.extern reset_flag

/* This file:
 * 1. provides the function to update the scores in the game and update the HEX display updating flag accordingly
 * 2. provides the function to end the game by setting the game state to STATE_WIN and storing the winner player number
 * 3. provides the function to clear the scores of both players and reset the game for a new game
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

    CMP R0, #1
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

    // Set keys interrupts to be enabled again to allow players to start a new game by pressing a button
    MOV R0, #KEYS_IRQ
    MOV R1, #CPU0

    BL CONFIG_INTERRUPT_SOURCE

    POP {R1-R2, PC}


/* The function RESET_GAME:
 * 1. clears the scores of both players by setting them to 0
 * 2. resets the game to initial state
 * Arguments: None
 * Returns: None
 */


.global RESET_GAME
RESET_GAME:
    PUSH {R0-R1, LR}

    MOV R1, #0 // Value to reset scores and winner variable

    LDR R0, =p1_score
    STR R1, [R0] // Clear player 1 score

    LDR R0, =p2_score
    STR R1, [R0] // Clear player 2 score

    LDR R0, =winner
    STR R1, [R0] // Clear winner variable

    MOV R1, #BALL_INITIAL_DX
    LDR R0, =ball_dx
    STR R1, [R0] // Reset ball's x speed to initial value

    MOV R1, #BALL_INITIAL_DY
    LDR R0, =ball_dy
    STR R1, [R0] // Reset ball's y speed to initial value

    MOV R1, #BALL_INITIAL_X
    LDR R0, =ball_x
    STR R1, [R0] // Reset ball's x position to initial value

    MOV R1, #BALL_INITIAL_Y
    LDR R0, =ball_y
    STR R1, [R0] // Reset ball's y position to initial value

    MOV R1, #PADDLE_INITIAL_Y
    LDR R0, =p1_y
    STR R1, [R0] // Reset player 1 paddle's y position to initial value

    LDR R0, =p2_y
    STR R1, [R0] // Reset player 2 paddle's y position to initial value
    
    MOV R1, #0
    LDR R0, =reset_flag
    STR R1, [R0] // Clear reset flag to indicate normal operation

    // Set update_hex flag to indicate that the HEX display needs to be updated
    MOV R1, #1
    LDR R0, =update_hex
    STR R1, [R0]

    POP {R0-R1, PC}