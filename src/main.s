.include "constants/address_map_arm.s"
.include "constants/defines.s"
.include "constants/interrupt_ids.s"
.extern reset_flag
.extern frame_ready
.extern update_hex
.extern game_state         


/*********************************************************************************
 * Initialize the exception vector table
 ********************************************************************************/
.section    .vectors, "ax"              

        B       _start                      // reset vector
        B       SERVICE_UND                 // undefined instruction vector
        B       SERVICE_SVC                 // software interrrupt vector
        B       SERVICE_ABT_INST            // aborted prefetch vector
        B       SERVICE_ABT_DATA            // aborted data vector
.word       0                               // unused vector
        B       SERVICE_IRQ                 // IRQ interrupt vector
        B       SERVICE_FIQ                 // FIQ interrupt vector
/*********************************************************************************/


/*********************************************************************************
 * SOC-PONG: A two-player Pong game for the DE1-SoC board.                       *
 *                                                                               *
 * The game uses the VGA display for rendering, four pushbutton KEYs for player  * 
 * input, the HEX displays for score tracking, and the ARM A9 private timer for  *
 * generating 60 FPS game loop interrupts.                                       *
 *                                                                               *
 * KEY0/KEY1 control Player 1's paddle (up/down).                                *
 * KEY2/KEY3 control Player 2's paddle (up/down).                                *
 *                                                                               *               
 * The timer ISR handles game logic: paddle movement, ball physics, collision    *
 * detection, and scoring. The main loop handles rendering: clearing the screen, *
 * drawing game elements, and swapping buffers.                                  *
 *                                                                               *               
 * First player to reach 10 points wins. Press any key on the title or win       *
 * screen to start or restart the game.                                          *
 ********************************************************************************/


.text
.global _start
_start:
    // Initialize the stack pointers for ırq and svc modes
    BL CONFIG_STACK_POINTERS

    // Configure the GIC to enable interrupts for the timer and route it to CPU 0
    MOV R0, #MPCORE_PRIV_TIMER_IRQ
    MOV R1, #CPU0
    BL CONFIG_INTERRUPT_SOURCE

    // Configure the GIC to enable interrupts for the pushbutton keys and route them to CPU 0
    MOV R0, #KEYS_IRQ
    MOV R1, #CPU0
    BL CONFIG_INTERRUPT_SOURCE

    // Enable the GIC to allow it to forward interrupts to the processor
    BL ENABLE_GIC

    // Configure the KEYs to generate interrupts on falling edge (active low)
    MOV R0, #0b1111 // Enable interrupts for all 4 keys (KEY0-KEY3)
    BL CONFIG_PUSHBUTTON_KEY

    // Configure the ARM A9 private timer to generate interrupts at 60 FPS
    LDR R0, =TIMER_LOAD_60_FPS
    BL CONFIG_TIMER

    // Configure the VGA controller
    BL CONFIG_VGA

    // Enable interrupts globally on the ARM A9 processor
    BL ENABLE_IRQ

    // Main game loop
    MAIN_LOOP:
        // Wait for the frame_ready flag to be set by the timer ISR
        LDR R0, =frame_ready
        LDR R1, [R0]
        CMP R1, #0
        BEQ MAIN_LOOP

        //Clear the frame_ready flag
        MOV R1, #0
        STR R1, [R0]

        // Reset the game if the reset_flag is set by the timer ISR after a win
        LDR R0, =reset_flag
        LDR R0, [R0]
        CMP R0, #1
        BLEQ RESET_GAME

        // Render the current game state (TITLE, PLAYING, WIN)
        LDR R0, =game_state
        LDR R0, [R0]

        // Clear the screen for the current frame
        BL CLEAR_SCREEN

        // Check the game state and call the appropriate drawing function
        CMP R0, #STATE_TITLE
        BLEQ DRAW_TITLE

        CMP R0, #STATE_PLAYING
        BLEQ DRAW_GAME

        CMP R0, #STATE_WIN
        BLEQ DRAW_WIN

        // Update the HEX display with the current scores if any player has scored
        LDR R0, =update_hex
        LDR R0, [R0]
        CMP R0, #1
        BLEQ UPDATE_HEX

        BL SWAP_BUFFERS

        B MAIN_LOOP