.include "../constants/address_map_arm.s"
.include "../constants/defines.s"
.extern p1_y
.extern p2_y


/* This file:
 * 1. provides the implementation of the paddle movement in the SOC-PONG game.
 * 2. it defines the function MOVE_PADDLES, which takes the current position of the paddle and the direction of movement as input, and updates the position of the paddle accordingly.
 * 3. it defines the function MOVE_PLAYER, which is called by MOVE_PADDLES to update the position of a specific player's paddle based on the input command (up or down) while ensuring that the paddle does not move outside the boundaries of the game screen.
 * 4. the paddle position is left top corner of the paddle.
 */


/* The function MOVE_PADDLES:
 * 1. reads the current state of the pushbutton keys to determine the movement commands for both players.
 * 2. calls the MOVE_PLAYER function for each player to update their paddle positions based on the input commands.
 * Arguments: None (reads input from pushbutton keys)
 * Returns: None
 */


.global MOVE_PADDLES
MOVE_PADDLES:
    PUSH {R0-R3, LR}

    /* Masking the commands of players and allinging to optain same bit positions for both players.
     * R2 will hold the command for player 1 and R3 will hold the command for player 2 after masking and aligning.
     */
    LDR R0, =KEY_BASE
    LDR R1, [R0]              // Read the current key state and store it in R1
    AND R2, R1, #0b1100     // Mask out bits 0 and 1 for player 1
    LSR R2, R2, #2            // Shift player 1 bits to the right by 2 to align with player 2 bits
    AND R3, R1, #0b0011     // Mask out bits 2 and 3 for player 2


    CHECK_PLAYER1:
    CMP R2, #NO_INPUT
    CMPNE R2, #INVALID_INPUT
    BEQ CHECK_PLAYER2        // If player 1 has no input, check player
    // Loading arguments for the function MOVE_PLAYER to move player 1's paddle
    MOV R0, R2                // Move player 1's command to R0
    LDR R1, =p1_y             // Load current y position value address of player 1's paddle to R1
    BL MOVE_PLAYER            // Call the function to move player 1's paddle based on the command in R0

    CHECK_PLAYER2:
    CMP R3, #NO_INPUT
    CMPNE R3, #INVALID_INPUT
    BEQ END_MOVE_PADDLES      // If player 2 has no input, end the function
    // Loading arguments for the function MOVE_PLAYER to move player 2's paddle
    MOV R0, R3                // Move player 2's command to R0
    LDR R1, =p2_y             // Load current y position value address of player 2's paddle to R1
    BL MOVE_PLAYER            // Call the function to move player 2's paddle based on the command in R0

    END_MOVE_PADDLES:
    POP {R0-R3, PC}


/* The function MOVE_PLAYER:
 * 1. takes R0 as a parameter to specify the direction of movement (up or down) and R1 as a parameter to specify the address of the current y position of the paddle.
 * 2. updates the y position of the paddle based on the direction of movement while ensuring that the paddle does not move outside the boundaries of the game screen.
 * Arguments: R0 (command of player), R1 (address of current y position of the paddle)
 * Returns: None
 */


MOVE_PLAYER:
    PUSH {R2, LR}  
    
    LDR R2, [R1]             // Load current y position value of the paddle to R3

    // Check player input
    CMP R0, #PLAYER_UP      // Check if the command is to move up
    BNE PLAYER_DOWN_MOVE

    PLAYER_UP_MOVE:
    CMP R2, #1          // Check if the paddle is at the top edge of the screen
    BLE END_MOVE_PLAYER
    SUB R2, R2, #PADDLE_SPEED // Move the paddle up by subtracting the speed from the current position
    STR R2, [R1]           // Store the updated y position back to memory
    B END_MOVE_PLAYER

    PLAYER_DOWN_MOVE:
    CMP R2, #(SCREEN_HEIGHT - PADDLE_HEIGHT) // Check if the paddle is at the bottom edge of the screen
    BGE END_MOVE_PLAYER 
    ADD R2, R2, #PADDLE_SPEED // Move the paddle down by adding the speed to the current position
    STR R2, [R1]          // Store the updated y position back to memory

    END_MOVE_PLAYER:
    POP {R2, PC}