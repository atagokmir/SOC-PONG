.include "../constants/address_map_arm.s"
.include "../constants/defines.s"

*/ This file:
 * 1. configurates the A9 core private timer
 * 2. the timer is used to generate interrupts at a regular interval, which can be used for various purposes such as updating the game state or refreshing the display.
 * 3. the timer is configured to generate interrupts at a frequency of 60 Hz for sustain 60 frames per second (FPS) in the game.
 */

 .global CONFIG_TIMER
CONFIG_TIMER:
    PUSH {R0-R1, LR}
    LDR R0, =MPCORE_PRIV_TIMER
    LDR R1, =60_FPS_TIMER_LOAD
    STR R1, [R0] // Load the timer load value (60_FPS_TIMER_LOAD = 3333333) into the timer's load register
    MOV R1, #0b1
    STR R1 , [R0, #0xC] // Clear the interrupt status by writing 1 to the timer's interrupt clear register (offset 0xC)
    MOV R1, #0b111 // Enable the timer, enable interrupts, and set it to auto-reload mode by writing 0b111 to the timer's control register (offset 0x8)
    STR R1, [R0, #0x8]
    POP {R0-R1, PC}
