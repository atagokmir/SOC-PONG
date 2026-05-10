.include "../constants/address_map_arm.s"
.include "../constants/defines.s"

*/ this file:
 * 1. configurates the pushbutton key paralel port for the ARM A9 processor
 * 2. the pushbutton key is connected to the FPGA and is used to generate interrupts when pressed.
 * 3. the interrupts are enabled for all the pushbutton keys and are configured to trigger on the falling edge (when the button is pressed).
 */

 .global CONFIG_PUSHBUTTON_KEY
CONFIG_PUSHBUTTON_KEY:
    PUSH {R0-R1, LR} 
    LDR R0, =KEY_BASE
    MOV R1, #0xF
    STR R1, [R0, #0xC] //Clearing edge capture register to any clean previous interrupts
    STR R1, [R0, #0x8] //Enabling all the pushbutton keys to generate interrupts with writting 0b1111 to the interrupt mask register (offset 0x8) of the pushbutton key parallel port.
    POP {R0-R1, PC}

