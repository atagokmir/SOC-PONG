.include "../constants/address_map_arm.s"
.include "../constants/defines.s"


/* This file:
 * 1. configurates the A9 core private timer
 * 2. the timer is used to generate interrupts at a regular interval, which can be used for various purposes such as updating the game state or refreshing the display.
 * 3. the timer is configured to generate interrupts at a frequency of 60 Hz for sustain 60 frames per second (FPS) in the game.
 */


/* The function CONFIG_TIMER:
 * 1. takes R0 as a parameter to specify the timer load value
 * 2. clears any previous interrupts by writing 1 to the timer's interrupt clear register (offset 0xC)
 * 3. enables the timer, enables interrupts, and sets it to auto-reload mode
 * Arguments: R0 (timer load value)
 * Returns: None
 */


 .global CONFIG_TIMER
CONFIG_TIMER:
    PUSH {R1-R2, LR}
    
    LDR R1, =MPCORE_PRIV_TIMER
    MOV R2, R0 // Load the value in the argument register R0 into R2 to use it as the timer load value
    STR R2, [R1] // Load the timer load value into the timer's load register
    MOV R2, #0b1
    STR R2, [R1, #0xC] // Clear the interrupt status by writing 1 to the timer's interrupt clear register (offset 0xC)
    MOV R2, #0b111 // Enable the timer, enable interrupts, and set it to auto-reload mode by writing 0b111 to the timer's control register (offset 0x8)
    STR R2, [R1, #0x8]

    POP {R1-R2, PC}