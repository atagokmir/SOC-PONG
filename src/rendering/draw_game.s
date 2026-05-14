.include "../constants/address_map_arm.s"
.include "../constants/defines.s"
.extern back_buffer
.extern ball_x
.extern ball_y
.extern p1_y
.extern p2_y


/* This file:
 * 1. includes all in one function to draw the game elements (ball, paddles) on the screen by writing pixel data to the back buffer.
 * 2. includes called function to draw paddles
 * 3. includes called function to draw ball
 *


/* NOTE: We can use just one function to draw both the ball and the paddles since they are all rectangles, we just need to pass different sizes for the ball and paddles as parameters.
 * However, for clarity and simplicity, we have implemented separate functions for drawing the ball and the paddles. 
 * This way, we can easily adjust the drawing logic for each element in the future if needed without affecting the other. 
 */


/* The function DRAW_GAME:
 * 1. draws the game elements (ball, paddles) on the screen by writing pixel data to the back buffer.
 * 2. it takes the positions of the ball and paddles, as well as the current score, as parameters in registers R0-R4.
 * Arguments: R0 Ball color, R1 paddles color
 * Returns: None
 */


.global DRAW_GAME
DRAW_GAME:
    PUSH {R2-R3, LR}

    // Load ball cordinates for drawing
    LDR R2, =ball_x
    LDR R2, [R2] // Load ball x position into R2
    LDR R3, =ball_y
    LDR R3, [R3] // Load ball y position into R3

    BL DRAW_BALL // Call function to draw ball at (R2, R3) with color in R0

    MOV R0, R1 // Set R0 to paddles color for drawing

    // Load paddle 1 cordinates for drawing
    LDR R2, =P1_X // Load paddle 1 x position into R2 since it's constant dont need to load from memory
    LDR R3, =p1_y
    LDR R3, [R3] // Load paddle 1 y position into R3

    BL DRAW_PADDLE // Call function to draw paddle 1 at (R2, R3) with color in R0

    // Load paddle 2 cordinates for drawing
    LDR R2, =P2_X // Load paddle 2 x position into R2 since it's constant dont need to load from memory
    LDR R3, =p2_y
    LDR R3, [R3] // Load paddle 2 y position into R3

    BL DRAW_PADDLE // Call function to draw paddle 2 at (R2, R3) with color in R0

    POP {R2-R3, PC}


/* The function DRAW_BALL:
 * 1. draws the ball on the screen by writing pixel data to the back buffer.
 * 2. it takes the position of the ball and its color as parameters in registers R0, R2, R3.
 * 3. the math to calculate the pixel address is as follows: base + y*1024 + x*4
 * Arguments: R0 Ball color, R2 Ball x position, R3 Ball y position
 * Returns: None
 */


DRAW_BALL:
    PUSH {R4-R8, LR}

    LDR R4, =back_buffer // Load address of back buffer pointer into R4
    LDR R4, [R4] // Load back buffer pointer into R4
    MOV R7, #0 // Initialize loop counter for ball size
    MOV R8, R2

    // Draw the ball as a square of size BALL_SIZE x BALL_SIZE
    BALL_Y:
        MOV R5, #0
        MOV R2, R8 // Reset R2 to the original x position for each new row of the ball
        BALL_X:
            LSL R6, R3, #10
            ADD R6, R6, R2, LSL #1
            STRH R0, [R4, R6]   // tek pixel yaz
            ADD R2, R2, #1 // Move to the next pixel in x direction
            ADD R5, R5, #1 // Increment inner loop counter for ball size
            CMP R5, #BALL_SIZE
            BNE BALL_X
        ADD R3, R3, #1 // Move to the next pixel in y direction
        ADD R7, R7, #1 // Increment outerloop counter for ball size
        CMP R7, #BALL_SIZE
        BNE BALL_Y


    POP {R4-R8, PC}


/* The function DRAW_PADDLE:
 * 1. draws a paddle on the screen by writing pixel data to the back buffer.
 * 2. it takes the position of the paddle and its color as parameters in registers R0, R2, R3.
 * 3. the math to calculate the pixel address is as follows: base + y*1024 + x*4
 * Arguments: R0 Paddle color, R2 Paddle x position, R3 Paddle y position
 * Returns: None
 */


DRAW_PADDLE:
    PUSH {R4-R8, LR}

    LDR R4, =back_buffer // Load address of back buffer pointer into R4
    LDR R4, [R4] // Load back buffer pointer into R4
    MOV R7, #0 // Initialize loop counter for paddle size
    MOV R8, R2

    // Draw the paddle as a rectangle of size PADDLE_WIDTH x PADDLE_HEIGHT
    PADDLE_Y:
        MOV R5, #0
        MOV R2, R8 // Reset R2 to the original x position for each new row of the paddle
        PADDLE_X:
            LSL R6, R3, #10
            ADD R6, R6, R2, LSL #1
            STRH R0, [R4, R6]   // tek pixel yaz
            ADD R2, R2, #1 // Move to the next pixel in x direction
            ADD R5, R5, #1 // Increment inner loop counter for paddle size
            CMP R5, #PADDLE_WIDTH
            BNE PADDLE_X
        ADD R3, R3, #1 // Move to the next pixel in y direction
        ADD R7, R7, #1 // Increment outerloop counter for paddle size
        CMP R7, #PADDLE_HEIGHT
        BNE PADDLE_Y


    POP {R4-R8, PC}