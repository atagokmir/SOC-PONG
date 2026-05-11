/* This file contains constant definitions for the SOC-PONG project.*/

    .equ    EDGE_TRIGGERED, 0x1
    .equ    LEVEL_SENSITIVE, 0x0
    .equ    CPU0, 0x01// bit-mask; bit 0 represents cpu0
    .equ    ENABLE, 0x1

    .equ    USER_MODE, 0b10000
    .equ    FIQ_MODE, 0b10001
    .equ    IRQ_MODE, 0b10010
    .equ    SVC_MODE, 0b10011
    .equ    ABORT_MODE, 0b10111
    .equ    UNDEF_MODE, 0b11011
    .equ    SYS_MODE, 0b11111

    .equ    INT_ENABLE, 0b01000000
    .equ    INT_DISABLE, 0b11000000

    .equ    TIMER_LOAD_60_FPS, 3333333 // 200 MHz for second for timer, 1/60 second for each frame, so 200000000/60 = 3333333

    // VGA
    .equ SCREEN_WIDTH,  320
    .equ SCREEN_HEIGHT, 240

    // Colors (16-bit RGB565)
    .equ COLOR_BLACK,   0x0000
    .equ COLOR_WHITE,   0xFFFF

    // Game constants
    .equ PADDLE_HEIGHT, 30
    .equ PADDLE_WIDTH,  5
    .equ PADDLE_SPEED,  2
    .equ BALL_SIZE,     4
    .equ WINNING_SCORE, 10
    .equ P1_X,          5
    .equ P2_X,          310

    // Game states
    .equ STATE_TITLE,   0
    .equ STATE_PLAYING, 1
    .equ STATE_WIN,     2

    //Key states (when pressed 0, active low)
    .equ PLAYER_UP,   0b10 //right button for player both players since we allign the bits in the code to have same bit positions for both players
    .equ PLAYER_DOWN, 0b01 //left button for player both players since we allign the bits in the code to have same bit positions for both players
    .equ NO_INPUT,    0b00
    .equ INVALID_INPUT, 0b11 //both buttons pressed at the same time, we will ignore this input in the code