.include "../constants/address_map_arm.s"
.include "../constants/defines.s"
.extern game_state
.extern frame_ready
.extern p1_y
.extern p2_y
.extern ball_x
.extern ball_y
.extern ball_dx
.extern ball_dy
.extern p1_score
.extern p2_score


/* This file:
 * 1. provides timer interrupt service routine (ISR) for the ARM A9 processor
 */


/* The function TIMER_ISR:*/

.global TIMER_ISR
TIMER_ISR:

    LDR R0, =MPCORE_PRIV_TIMER
    MOV R1, #1
    STR R1, [R0, #0xC]          // Clear the timer interrupt by writing 1 to the timer's end-of-interrupt register

    LDR R0, =game_state
    LDR R1, [R0]                // Load the current game state

    PLAYING_SCREEN:
    CMP R1, #STATE_PLAYING
    BNE END_ISR

    BL MOVE_PADDLES             // Call the function to move the paddles based on player input

BALL_MOVE:
    // Load current ball position
    LDR R0, =ball_x
    LDR R1, [R0]
    LDR R2, =ball_y
    LDR R3, [R2]
    
    // Load ball velocity
    LDR R4, =ball_dx
    LDR R5, [R4]
    LDR R6, =ball_dy
    LDR R7, [R6]

    // Calculate ball position
    ADD R1, R1, R5      // Update ball_x
    ADD R3, R3, R7      // Update ball_y
    STR R1, [R0]
    STR R3, [R2]

CHECK_WALL_COLLISIONS:
    // Check for collision with top and bottom walls
    CMP R3, #0          // Check collision with top wall
    BLE WALL_COLLISION
    CMP R3, #(SCREEN_HEIGHT - BALL_SIZE - 1)        // Check collision with bottom wall
    BLT PADDLE_COLLISIONS
WALL_COLLISION:
    RSB R7, R7, #0      // Reverse ball_dy
    STR R7, [R6]

//code for checking paddle collisions and scoring would go here

    B END_ISR



