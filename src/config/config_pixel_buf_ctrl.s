.include "../constants/address_map_arm.s"
.include "../constants/defines.s"
.extern back_buffer


/* This file:
 * 1. configures the pixel buffer controller (PBC) for the DE1-SoC board
 * 2. includes function to initialize the PBC by setting its back buffer address to the base address of SDRAM
 * 3. stores the back buffer address in a global variable for later use
 */


/* The function CONFIG_PBC:
 * 1. configures the pixel buffer controller (PBC) for the DE1-SoC board by setting its back buffer address to the base address of SDRAM.
 * Arguments: None
 * Returns: None
 */


.global CONFIG_PBC
CONFIG_PBC:
    PUSH {R0-R1, LR}

    LDR R0, =PIXEL_BUF_CTRL_BASE
    LDR R1, =SDRAM_BASE
    STR R1, [R0, #4] // Set back buffer address to SDRAM base address

    LDR R0, =back_buffer
    STR R1, [R0] // Store back buffer address in global variable

    POP {R0-R1, PC}