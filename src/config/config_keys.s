.include "../constants/address_map_arm.s"
.include "../constants/defines.s"


/* This file:
 * 1. configurates the pushbutton key paralel port for the ARM A9 processor
 * 2. the pushbutton key is connected to the FPGA and is used to generate interrupts when pressed.
 * 3. the interrupts are enabled for given pushbutton keys and are configured to trigger on the falling edge (when the button is pressed).
 */


/* The function CONFIG_PUSHBUTTON_KEY:
 * 1. takes R0 as a parameter to specify which pusbuttons to enable
 * 2.for key 0, R0 should be 0b0001, for key 1, R0 should be 0b0010, for key 2, R0 should be 0b0100 and for key 3, R0 should be 0b1000. 
 * To enable multiple keys, the corresponding bits in R0 should be set to 1. For example, to enable keys 0 and 2, R0 should be set to 0b0101 (5 in decimal).
 * Arguments: R0 (pushbutton keys to enable)
 * Returns: None
 */


 .global CONFIG_PUSHBUTTON_KEY
CONFIG_PUSHBUTTON_KEY:
    PUSH {R1-R2, LR}

    LDR R1, =KEY_BASE
    MOV R2, #0xF
    STR R2, [R1, #0xC] //Clearing edge capture register to clean any previous interrupts
    MOV R2, R0
    STR R2, [R1, #0x8] //Enabling specified the pushbutton keys in R0 to generate interrupts with writting 1 to the interrupt mask register (offset 0x8) of the pushbutton key parallel port.

    POP {R1-R2, PC}