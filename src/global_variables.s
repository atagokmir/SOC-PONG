/* This file defines global variables for the SOC-PONG project. */


.data

    .global game_state
    game_state:     .word 0     // 0 = TITLE, 1 = PLAYING, 2 = WIN

    .global ball_x
    ball_x:         .word 158   // start: middle of the screen (320/2) - 2 since ball 5 pixels wide

    .global ball_y
    ball_y:         .word 118   // start: middle of the screen (240/2) - 2 since ball 5 pixels tall

    .global ball_dx
    ball_dx:        .word 2   // the speed of the ball in x direction

    .global ball_dy
    ball_dy:        .word 1     // the speed of the ball in y direction

    .global p1_y
    p1_y:           .word 105   // start: middle of the screen (120 - PADDLE_HEIGHT/2)

    .global p2_y
    p2_y:           .word 105   // start: middle of the screen (120 - PADDLE_HEIGHT/2)

    .global p1_score
    p1_score:       .word 0

    .global p2_score
    p2_score:       .word 0

    .global back_buffer
    back_buffer:    .word 0

    .global winner
    winner:         .word 0     // 1 = Player 1, 2 = Player 2

    .global reset_flag
    reset_flag:     .word 0     // 0 = normal operation, 1 = reset the game

    .global frame_ready
    frame_ready:    .word 0     // 0 = frame not ready, 1 = frame ready to be drawn