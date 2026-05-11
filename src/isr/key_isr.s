.include "../constants/address_map_arm.s"
.include "../constants/defines.s"
.extern game_state
.extern reset_flag


/* This file:
 * 1. provides key ınterrupt service routine
 */


/* The function KEY_ISR:
 * 1. is the interrupt service routine (ISR) for handling key press events in the SOC-PONG game.
 * 2. it clears the interrupt, and updates the game state based on the current state of the game.
 * 3. if the game is in the title screen state, it transitions to the playing state when a key is pressed.
 * If the game is in the win screen state, it transitions back to the title screen when a key is pressed.
 * Arguments: None
 * Returns: None
 */

.global KEY_ISR
KEY_ISR:
    PUSH {R0-R3, LR}

    LDR R0, =KEY_BASE
    STR R0, [R0, #0xC]          // clear the interrupt by writing any value to the edge capture register

    /* Handle the key press event here */
    LDR R0, =game_state
    LDR R1, [R0]                // Load the current game state

TITLE_SCREEN:
    CMP R1, #STATE_TITLE
    BNE WIN_SCREEN
    MOV R1, #STATE_PLAYING    // If we are in the title screen, start the game
    MOV R0, #KEYS_IRQ
    BL DISABLE_INTERRUPT_SOURCE   // Disable keys interrupt since we only use it to start the game and going to start menu screen after winning
    B END_ISR

WIN_SCREEN:
    CMP R1, #STATE_WIN
    BNE END_ISR
    MOV R1, #STATE_TITLE      // If we are in the win screen, go back to the title screen
    LDR R2, =reset_flag
    MOV R3, #1
    STR R3, [R2]              // Set the reset flag to 1 to reset the game state in the main game loop

END_ISR:
    LDR R0, =game_state
    STR R1, [R0]                // Store the updated game state back to memory

    POP {R0-R3, PC}