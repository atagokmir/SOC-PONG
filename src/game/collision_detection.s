.include "../constants/address_map_arm.s"
.include "../constants/defines.s"
.extern p1_y
.extern p2_y
.extern ball_x
.extern ball_y
.extern ball_dx
.extern ball_dy
.extern p1_score
.extern p2_score

/* This file:
 * 1. provides the function to detect collisions in the game
 */

/* The function CHECK_COLLISIONS:
 * 1. checks for collisions between the ball and the walls or paddles and updates the ball's velocity accordingly
 * 2. checks for scoring conditions and updates the scores if necessary
 * Arguments: None
 * Returns: None
 */

.global CHECK_COLLISIONS
CHECK_COLLISIONS:
    PUSH {R0-R4, LR}
    
    // load ball position
    LDR R0, =ball_x
    LDR R0, [R0]
    LDR R1, =ball_y
    LDR R1, [R1]
    
    BL CHECK_WALL_COLLISIONS // Check for collisions with top and bottom walls
    CMP R2, #1
    BEQ REVERSE_Y_VELOCITY

    // load paddle positions
    LDR R2, =p1_y
    LDR R2, [R2]
    LDR R3, =p2_y
    LDR R3, [R3]

    BL CHECK_PADDLE_COLLISIONS // Check for collisions with paddles
    CMP R4, #1
    BEQ REVERSE_X_VELOCITY
    BEQ END_CHECK_COLLISIONS // If paddle collision detected no need to check for scoring conditions

    BL CHECK_SCORE // Check for scoring conditions

    END_CHECK_COLLISIONS:
    POP {R0-R4, PC}


/* The function CHECK_WALL_COLLISIONS:
 * 1. checks for collisions between the ball and the top/bottom walls
 * 2. sets a flag to reverse the y velocity if a collision is detected
 * Arguments: R1 = ball_y (current y position of the ball)
 * Returns: R2 = 1 if collision detected (reverse y velocity), 0 otherwise
 */


CHECK_WALL_COLLISIONS:
    PUSH {LR}

    MOV R2, #0          // Initialize flag to not reverse y velocity

    // Check for collision with top and bottom walls
    CMP R1, #0          // Check collision with top wall
    BLE COLLISION_DETECTED

    CMP R1, #(SCREEN_HEIGHT - BALL_SIZE - 1)        // Check collision with bottom wall
    BLT END_CHECK_WALL_COLLISIONS

    COLLISION_DETECTED:
    MOV R2, #1          // if detected, set flag to reverse y velocity
    
    END_CHECK_WALL_COLLISIONS:
    POP {PC}


/* The function CHECK_PADDLE_COLLISIONS:
 * 1. checks for collisions between the ball and the paddles
 * 2. sets a flag to reverse the x velocity if a collision is detected
 * Arguments: R0 = ball_x (current x position of the ball), R1 = ball_y (current y position of the ball), R2 = p1_y (current y position of player 1's paddle), R3 = p2_y (current y position of player 2's paddle)
 * Returns: R4 = 1 if collision detected (reverse x velocity), 0 otherwise
 */


CHECK_PADDLE_COLLISIONS:
    PUSH {R5-R8, LR}

    // Initialize flag to not reverse x velocity
    MOV R4, #0
    MOV R5, #0 // Initialize flag to check for possible collision with players 0 no collision, 1 collision with player 1, 2 collision with player 2

    // Check if the ball is on the collision line for both paddles
    // Check collision with player 1's paddle
    CMP R0, #(P1_X + PADDLE_WIDTH +1) // Check if ball is at the x position of player 1's paddle
    MOVLE R5, #1 // Set flag to check for possible collision with player 1's paddle
    BLE CHECK_REAL_COLLISION

    // Check collision with player 2's paddle
    CMP R0, #(P2_X - BALL_SIZE - 1) // Check if ball is at the x position of player 2's paddle
    MOVGE R5, #2 // Set flag to check for possible collision with player 2's paddle
    BGE CHECK_REAL_COLLISION

    B CHECK_PADDLE_COLLISIONS_END // If ball is not at the x position of either paddle, skip collision check

    CHECK_REAL_COLLISION:
    /* Collision if R1 (top corner of the ball) >= R7 (bottom of the paddle) AND R8 (bottom corner of the ball) <= R6 (top of the paddle) */

    // Check for which paddle is possible collision zone
    CMP R5, #1 // Check if possible collision with player 1's paddle
    MOVEQ R6, R2 // If possible collision with player 1's paddle, load player 1's paddle y position into R6
    MOVNE R6, R3 // If possible collision with player 2's paddle, load player 2's paddle y position into R6

    // Load the bottom corner of the paddle into R7
    SUB R7, R6, #PADDLE_HEIGHT // R7 now has the y position of the bottom of the paddle

    // Load the bottom corner of the ball into R8
    SUB R8, R1, #BALL_SIZE // R8 now has the y position

    // Check for collision
    CMP R1, R7 // Check if top corner of the ball is below the bottom of the paddle
    BLT CHECK_PADDLE_COLLISIONS_END // If top corner of the ball is below the bottom of the paddle, no collision
    CMP R8, R6 // Check if bottom corner of the ball is above the top of the paddle
    BGT CHECK_PADDLE_COLLISIONS_END // If bottom corner of the ball is above the top of the paddle, no collision
    MOV R4, #1 // If both conditions are satisfied, set flag to reverse x velocity

    CHECK_PADDLE_COLLISIONS_END:
    POP {R5-R8, PC}


/* The function CHECK_SCORE:
 * 1. checks if the ball has passed the left or right edge of the screen, indicating a score for player 2 or player 1 respectively
 * 2. updates the scores and resets the ball position and velocity if a score is detected
 * Arguments: R0 = ball_x (current x position of the ball)
 * Returns: None
 */


CHECK_SCORE:
    PUSH {R1-R4, LR}

    // Check if player 2 scored (ball passed left edge)
    CMP R0, #0
    BGT CHECK_PLAYER_1_SCORE // If ball has not passed left edge, check for player 1 score

    // Player 2 scored
    MOV R0, 2
    BL UPDATE_SCORES // Update player 2's score and set update_hex flag
    

    BL RESET_BALL // Reset ball position and velocity after score
    B END_CHECK_SCORE

    CHECK_PLAYER_1_SCORE:
    // Check if player 1 scored (ball passed right edge)
    CMP R0, #(SCREEN_WIDTH - BALL_SIZE - 1)
    BLT END_CHECK_SCORE // If ball has not passed right edge, end score check

    // Player 1 scored
    MOV R0, 1
    BL UPDATE_SCORES // Update player 1's score and set update_hex flag

    BL RESET_BALL // Reset ball position and velocity after score

    END_CHECK_SCORE:
    POP {R1-R4, PC}


/* The function REVERSE_Y_VELOCITY:
 * 1. reverses the y velocity of the ball
 * Arguments: None
 * Returns: None
 */


REVERSE_Y_VELOCITY:
    PUSH {R0-R1, LR}

    LDR R0, =ball_dy
    LDR R1, [R0]
    RSB R1, R1, #0     // Reverse the y velocity
    STR R1, [R0]

    POP {R0-R1, PC}


/* The function REVERSE_X_VELOCITY:
 * 1. reverses the x velocity of the ball
 * Arguments: None
 * Returns: None
 */


REVERSE_X_VELOCITY:
    PUSH {R0-R1, LR}

    LDR R0, =ball_dx
    LDR R1, [R0]
    RSB R1, R1, #0     // Reverse the x velocity
    STR R1, [R0]

    POP {R0-R1, PC}


/* The function RESET_BALL:
 * 1. resets the ball's position to the center of the screen and its x velocity to the opposite values no change to y velocity
 * Arguments: None
 * Returns: None
 */


RESET_BALL:
    PUSH {R0-R1, LR}

    // Reset ball position to center of the screen
    LDR R0, =ball_x
    MOV R1, #BALL_INITIAL_X
    STR R1, [R0]

    LDR R0, =ball_y
    MOV R1, #BALL_INITIAL_Y
    STR R1, [R0]

    // Reverse ball x velocity
    BL REVERSE_X_VELOCITY

    POP {R0-R1, PC}