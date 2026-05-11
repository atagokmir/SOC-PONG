.include "../constants/address_map_arm.s"
.include "../constants/defines.s"
.extern back_buffer


/* This file:
 * 1. includes function to clear the screen by writing a specified color value to every pixel in the frame buffer
 * 2. icludes function to swap the front and back buffers by writing 1 to front buffer register of the pixel buffer controller
 */


/* The function CLEAR_SCREEN:
 * 1. clears the screen by writing a specified color value to every pixel in the frame buffer.
 * 2. it takes R0 as a parameter to specify the color value to write to each pixel. 15-11 represent red, 10-5 represent green, and 4-0 represent blue.
 * Arguments: R0 (color value)
 * Returns: None
 */


.global CLEAR_SCREEN
CLEAR_SCREEN:
    PUSH {R1-R4, LR}

    ORR R0, R0, R0, LSL #16   // Since we use 32 bits to represent each pixel, we need to replicate the color value in the upper 16 bits as well to write the full 32-bit value to each pixel

    MOV R1, #0 // Load outer loop counter (y) with 0

    LDR R2, =back_buffer // Load address of back buffer variable into R3
    LDR R2, [R2] // Load real back buffer address into R3

    // Loop through each pixel and write the color value
    CLEAR_LOOP_Y:
        MOV R3, #0 // Reset R1 to screen width for each new row inner loop counter (x) with 0
        LSL R4, R1, #10 
        CLEAR_LOOP_X:
            STR R0, [R2, R4] // Write color value to pixel
            ADD R4, R4, #4 // Calculate pixel address: base + (y * screen_width + x) * 4
            ADD R3, R3, #1 // Increment x counter
            CMP R3, #(SCREEN_WIDTH / 2) // Compare x counter to screen width
            BNE CLEAR_LOOP_X // If x counter is not equal to screen width, repeat inner loop
        ADD R1, R1, #1 // Increment y counter
        CMP R1, #SCREEN_HEIGHT // Compare y counter to screen height
        BNE CLEAR_LOOP_Y // If y counter is not equal to screen height, repeat outer loop
    
    POP {R1-R4, PC}


/* The function SWAP_BUFFERS:
 * 1. swaps the front and back buffers by writing 1 to front buffer register of the pixel buffer controller.
 * 2. waits for the vertical sync signal to ensure the buffer swap occurs during the vertical blanking interval, preventing screen tearing.
 * 3. updates the back buffer address in the global variable to reflect the new back buffer after the swap.
 * Arguments: None
 * Returns: None
 */


.global SWAP_BUFFERS
SWAP_BUFFERS:
    PUSH {R0-R1, LR}

    LDR R0, =PIXEL_BUF_CTRL_BASE
    MOV R1, #1
    STR R1, [R0] // Write 1 to front buffer register to swap buffers

    // Wait for vertical sync S bit will be set to 1 when in vertical sync, so we wait until it is 0 before proceeding to ensure we are in the vertical blanking interval
    WAIT_VSYNC:
    LDR R1, [R0] // Read status register
    TST R1, #1 // Check if S bit is set
    BNE WAIT_VSYNC // If S bit is set, we are still in vertical sync, so keep waiting

    LDR R1, [R0, #4] // Read new back buffer address from pixel buffer controller
    LDR R0, =back_buffer // Load address of back buffer variable into R0
    STR R1, [R0] // Update back buffer address in global variable

    POP {R0-R1, PC}