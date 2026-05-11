.include "../constants/address_map_arm.s"
.include "../constants/defines.s"
.extern ball_x
.extern ball_y
.extern ball_dx
.extern ball_dy

/* This file:
 * 1. provides the function to move the ball in the game
 */


/* The function MOVE_BALL:
 * 1. updates the position of the ball based on its velocity
 * Arguments: None
 * Returns: None
 */


.global MOVE_BALL
MOVE_BALL:
    PUSH {R0-R5, LR}

    // Load current ball position
    LDR R0, =ball_x
    LDR R1, [R0]
    LDR R2, =ball_y
    LDR R3, [R2]
    
    // Load ball velocity
    LDR R4, =ball_dx
    LDR R4, [R4]
    LDR R5, =ball_dy
    LDR R5, [R5]

    // Calculate ball position
    ADD R1, R1, R4      // Update ball_x
    ADD R3, R3, R5      // Update ball_y
    STR R1, [R0]
    STR R3, [R2]

    POP {R0-R5, PC}