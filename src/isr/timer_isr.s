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
    PUSH {R0-R1, LR}

    LDR R0, =MPCORE_PRIV_TIMER
    MOV R1, #1
    STR R1, [R0, #0xC]          // Clear the timer interrupt by writing 1 to the timer's end-of-interrupt register

    LDR R0, =game_state
    LDR R1, [R0]                // Load the current game state

    PLAYING_SCREEN:
    CMP R1, #STATE_PLAYING
    BNE END_ISR

    BL MOVE_PADDLES             // Call the function to move the paddles based on player input

    BL MOVE_BALL                // Call the function to move the ball based on its velocity

    BL CHECK_COLLISIONS         // Call the function to check for collisions and update ball velocity and scores


    END_ISR:
    LDR R0, =frame_ready
    MOV R1, #1
    STR R1, [R0]                // Set frame_ready to 1 to indicate that the game state has been updated and the screen can be redrawn

    POP {R0-R1, PC}