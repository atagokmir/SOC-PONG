/* This files provides address values that exist in the system */

/* Memory */
        .equ  DDR_BASE,             0x00000000
        .equ  DDR_END,              0x3FFFFFFF
        .equ  A9_ONCHIP_BASE,       0xFFFF0000
        .equ  A9_ONCHIP_END,        0xFFFFFFFF
        .equ  SDRAM_BASE,           0xC0000000
        .equ  SDRAM_END,            0xC3FFFFFF
        .equ  FPGA_PIXEL_BUF_BASE,     0xC8000000
        .equ  FPGA_PIXEL_BUF_END,      0xC803FFFF
        .equ  FPGA_CHAR_BASE,       0xC9000000
        .equ  FPGA_CHAR_END,        0xC9001FFF

/* Cyclone V FPGA devices */
	.equ  LED_BASE, 	     0xFF200000
        .equ  LEDR_BASE,             0xFF200000
        .equ  HEX3_HEX0_BASE,        0xFF200020
        .equ  HEX5_HEX4_BASE,        0xFF200030
        .equ  SW_BASE,               0xFF200040
        .equ  KEY_BASE,              0xFF200050
        .equ  JP1_BASE,              0xFF200060
        .equ  JP2_BASE,              0xFF200070
        .equ  PS2_BASE,              0xFF200100
        .equ  PS2_DUAL_BASE,         0xFF200108
        .equ  JTAG_UART_BASE,        0xFF201000
        .equ  JTAG_UART_2_BASE,      0xFF201008
        .equ  IrDA_BASE,             0xFF201020
        .equ  TIMER_BASE,            0xFF202000
        .equ  TIMER_2_BASE,          0xFF202020
        .equ  AV_CONFIG_BASE,        0xFF203000
        .equ  PIXEL_BUF_CTRL_BASE,   0xFF203020
        .equ  CHAR_BUF_CTRL_BASE,    0xFF203030
        .equ  AUDIO_BASE,            0xFF203040
        .equ  VIDEO_IN_BASE,         0xFF203060
        .equ  ADC_BASE,              0xFF204000

/* Cyclone V HPS devices */
        .equ   HPS_GPIO1_BASE,       0xFF709000
        .equ   I2C0_BASE,            0xFFC04000
        .equ   I2C1_BASE,            0xFFC05000
        .equ   I2C2_BASE,            0xFFC06000
        .equ   I2C3_BASE,            0xFFC07000
        .equ   HPS_TIMER0_BASE,      0xFFC08000
        .equ   HPS_TIMER1_BASE,      0xFFC09000
        .equ   HPS_TIMER2_BASE,      0xFFD00000
        .equ   HPS_TIMER3_BASE,      0xFFD01000
        .equ   FPGA_BRIDGE,          0xFFD0501C

/* ARM A9 MPCORE devices */
        .equ   PERIPH_BASE,          0xFFFEC000   /* base address of peripheral devices */
        .equ   MPCORE_PRIV_TIMER,    0xFFFEC600   /* PERIPH_BASE + 0x0600 */

        /* Interrupt controller (GIC) CPU interface(s) */
        .equ   MPCORE_GIC_CPUIF,     0xFFFEC100   /* PERIPH_BASE + 0x100 */
        .equ   ICCICR,               0x00         /* CPU interface control register */
        .equ   ICCPMR,               0x04         /* interrupt priority mask register */
        .equ   ICCIAR,               0x0C         /* interrupt acknowledge register */
        .equ   ICCEOIR,              0x10         /* end of interrupt register */
        /* Interrupt controller (GIC) distributor interface(s) */
        .equ   MPCORE_GIC_DIST,      0xFFFED000   /* PERIPH_BASE + 0x1000 */
        .equ   ICDDCR,               0x00         /* distributor control register */
        .equ   ICDISER,              0x100        /* interrupt set-enable registers */
        .equ   ICDICER,              0x180        /* interrupt clear-enable registers */
        .equ   ICDIPTR,              0x800        /* interrupt processor targets registers */
        .equ   ICDICFR,              0xC00        /* interrupt configuration registers */


/* Interrupt IDs */
/* This files provides interrupt IDs */

/* FPGA interrupts (there are 64 in total; only a few are defined below) */
    .equ    INTERVAL_TIMER_IRQ, 72
    .equ    KEYS_IRQ, 73
    .equ    FPGA_IRQ2, 74
    .equ    FPGA_IRQ3, 75
    .equ    FPGA_IRQ4, 76
    .equ    FPGA_IRQ5, 77
    .equ    FPGA_IRQ6, 78
    .equ    FPGA_IRQ7, 79
    .equ    JTAG_IRQ, 80
    .equ    FPGA_IRQ9, 81
    .equ    FPGA_IRQ10, 82
    .equ    JP1_IRQ, 83
    .equ    JP7_IRQ, 84
    .equ    ARDUINO_IRQ, 85
    .equ    FPGA_IRQ14, 86
    .equ    FPGA_IRQ15, 87
    .equ    FPGA_IRQ16, 88
    .equ    FPGA_IRQ17, 89
    .equ    FPGA_IRQ18, 90
    .equ    FPGA_IRQ19, 91

/* ARM A9 MPCORE devices (there are many; only a few are defined below) */
    .equ    MPCORE_GLOBAL_TIMER_IRQ, 27
    .equ    MPCORE_PRIV_TIMER_IRQ, 29
    .equ    MPCORE_WATCHDOG_IRQ, 30

/* HPS devices (there are many; only a few are defined below) */
    .equ    HPS_UART0_IRQ, 194
    .equ    HPS_UART1_IRQ, 195
    .equ    HPS_GPIO0_IRQ, 196
    .equ    HPS_GPIO1_IRQ, 197
    .equ    HPS_GPIO2_IRQ, 198
    .equ    HPS_TIMER0_IRQ, 199
    .equ    HPS_TIMER1_IRQ, 200
    .equ    HPS_TIMER2_IRQ, 201
    .equ    HPS_TIMER3_IRQ, 202
    .equ    HPS_WATCHDOG0_IRQ, 203
    .equ    HPS_WATCHDOG1_IRQ, 204

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

    // Initial positions and speeds for the ball and paddles are defined in global_variables.s
    .equ BALL_INITIAL_DX, 2
    .equ BALL_INITIAL_DY, 1
    .equ BALL_INITIAL_X, 158 // middle of the screen (320/2) - 2 since ball 5 pixels wide
    .equ BALL_INITIAL_Y, 118 // middle of the screen (240/2) - 2 since ball 5 pixels tall
    .equ PADDLE_INITIAL_Y, 105 // middle of the screen (120 - PADDLE_HEIGHT/2)


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
    BL CONFIG_PBC

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

        // Clear the screen for the current frame
        LDR R0, =COLOR_BLACK
        BL CLEAR_SCREEN

        //Clear the character buffer for the current frame if the game state has changed
        LDR R0, =state_changed
        LDR R0, [R0]
        CMP R0, #1
        BLEQ CLEAR_CHAR_BUFFER

        // Render the current game state (TITLE, PLAYING, WIN)
        LDR R0, =game_state
        LDR R0, [R0]

        // Check the game state and call the appropriate drawing function
        CMP R0, #STATE_TITLE
        BNE IS_STATE_PLAYING 
        BL DRAW_TITLE
        B END_CHECK_GAME_STATE

        IS_STATE_PLAYING:
        CMP R0, #STATE_PLAYING
        BNE IS_STATE_WIN
        LDR R0, =COLOR_WHITE // Pass the color white to draw the ball
        MOV R1, R0 // Pass the color white to draw the paddles as well
        BL DRAW_GAME
        B END_CHECK_GAME_STATE

        IS_STATE_WIN:
        CMP R0, #STATE_WIN
        BNE END_CHECK_GAME_STATE
        BL DRAW_WIN

        END_CHECK_GAME_STATE:
        // Update the HEX display with the current scores if any player has scored
        LDR R0, =update_hex
        LDR R0, [R0]
        CMP R0, #1
        BLEQ DRAW_ON_HEX

        BL SWAP_BUFFERS

        B MAIN_LOOP

/* This file:
 * 1. defines exception vectors for the A9 processor
 */

/*--- IRQ ---------------------------------------------------------------------*/
.global     SERVICE_IRQ             
SERVICE_IRQ:                            
        PUSH {R0-R12, LR}             

        /* Read the ICCIAR from the CPU interface */
        LDR R4, =MPCORE_GIC_CPUIF   
        LDR R5, [R4, #ICCIAR]       // read the interrupt ID

        KEY_CHECK:
        CMP R5, #KEYS_IRQ
        BNE TIMER_CHECK

        BL KEY_ISR
        B EXIT_IRQ

        TIMER_CHECK:
        CMP R5, #MPCORE_PRIV_TIMER_IRQ
        BNE UNKNOWN_IRQ

        BL TIMER_ISR
        B EXIT_IRQ

        UNKNOWN_IRQ:
        /* Handle spurious interrupts or other unhandled cases here */
        B UNKNOWN_IRQ

        EXIT_IRQ:                               
        /* Write to the End of Interrupt Register (ICCEOIR) */
        STR R5, [R4, #ICCEOIR]      

        POP {R0-R12, LR}             
        SUBS PC, LR, #4              


/*--- Undefined instructions --------------------------------------------------*/
.global     SERVICE_UND             
SERVICE_UND:                            
        B       SERVICE_UND             

/*--- Software interrupts -----------------------------------------------------*/
.global     SERVICE_SVC             
SERVICE_SVC:                            
        B       SERVICE_SVC             

/*--- Aborted data reads ------------------------------------------------------*/
.global     SERVICE_ABT_DATA        
SERVICE_ABT_DATA:                       
        B       SERVICE_ABT_DATA        

/*--- Aborted instruction fetch -----------------------------------------------*/
.global     SERVICE_ABT_INST        
SERVICE_ABT_INST:                       
        B       SERVICE_ABT_INST        

/*--- FIQ ---------------------------------------------------------------------*/
.global     SERVICE_FIQ             
SERVICE_FIQ:                            
        B       SERVICE_FIQ

/* This file:
 * 1. configures the generic interrupt controller (GIC) for the ARM A9 processor
 * 2. includes function to configure the GIC to enable interrupts for specified sources
 * 3. includes function to enable the GIC for given interrupt sources to allow it to forward interrupts to the processor
 * 4. includes function to disable interrupts for specified sources in the GIC
 * 5. includes function to set up stack pointers for IRQ and SVC processor modes
 * 6. includes function to enable IRQ interrupts 
 */


/* The function ENABLE_GIC:
 * 1. enables the GIC to allow it to forward interrupts to the processor.
 * 2. it sets the Interrupt Priority Mask Register (ICCPMR) to enable interrupts of all priority levels, and it sets the enable bit in both the CPU Interface Control Register (ICCICR) and the Distributor Control Register (ICDDCR) to allow the GIC to forward interrupts to the CPU(s).
 * Arguments: None
 * Returns: None
 */


.global ENABLE_GIC
ENABLE_GIC:
    PUSH {R0-R1, LR}

    LDR R0, =MPCORE_GIC_CPUIF	// base address of CPU interface
    /* Set Interrupt Priority Mask Register (ICCPMR) */
    LDR	R1, =0xFFFF 			// enable interrupts of all priorities levels
    STR	R1, [R0, #ICCPMR]

    /* Set the enable bit in the CPU Interface Control Register (ICCICR). This bit
	 * allows interrupts to be forwarded to the CPU(s) */
    MOV	R1, #1
    STR	R1, [R0]
    
    /* Set the enable bit in the Distributor Control Register (ICDDCR). This bit
	 * allows the distributor to forward interrupts to the CPU interface(s) */
    LDR	R0, =MPCORE_GIC_DIST
    STR	R1, [R0]

    POP {R0-R1, PC}


/* The function CONFIG_INTERRUPT_SOURCE:
 * 1. configures the GIC to enable interrupts for specified sources and routes them to desired CPU(s).
 * 2. it takes R0 as a parameter to specify which interrupt sources to enable. Each bit in R0 corresponds to a specific interrupt source, and setting a bit to 1 enables that source to generate interrupts.
 * For example, if bit 0 corresponds to the timer interrupt and bit 1 corresponds to the pushbutton key interrupt, setting R0 to 0b11 (3 in decimal) would enable both the timer and pushbutton key interrupts.
 * 3. it takes R1 as a parameter to specify the target CPU(s) for the enabled interrupts. Each bit in R1 corresponds to a specific CPU, and setting a bit to 1 routes the enabled interrupts to that CPU.
 * Arguments: R0 (interrupt id in interrupt_ids.s) and R1 (target CPU(s))
 * Returns: None
 */


.global CONFIG_INTERRUPT_SOURCE
CONFIG_INTERRUPT_SOURCE:
    PUSH {R2-R5, LR}

    /* Configure Interrupt Set-Enable Registers (ICDISERn). 
    * reg_offset = (integer_div(N / 32) * 4
    * value = 1 << (N mod 32) */
    LSR	R4, R0, #3          // calculate reg_offset
    BIC	R4, R4, #3          // R4 = reg_offset
	LDR	R2, =MPCORE_GIC_DIST+ICDISER
	ADD	R4, R2, R4          // R4 = address of ICDISER
    
    AND	R2, R0, #0x1F       // N mod 32
	MOV	R5, #1              // enable
    LSL	R2, R5, R2          // R2 = value

	/* now that we have the register address (R4) and value (R2), we need to set the
	 * correct bit in the GIC register */
    STR	R2, [R4]            // store the new register value

    /* Configure Interrupt Processor Targets Register (ICDIPTRn)
     * reg_offset = integer_div(N / 4) * 4
     * index = N mod 4 */
    BIC	R4, R0, #3          // R4 = reg_offset
	LDR	R2, =MPCORE_GIC_DIST+ICDIPTR
	ADD	R4, R2, R4          // R4 = word address of ICDIPTR
    AND	R2, R0, #0x3        // N mod 4
	ADD	R4, R2, R4          // R4 = byte address in ICDIPTR

	/* now that we have the register address (R4) and value (R2), write to (only)
	 * the appropriate byte */
	STRB R1, [R4]
    
    POP {R2-R5, PC}


/* The function DISABLE_INTERRUPT_SOURCE:
 * 1. configures the GIC to disable interrupts for specified sources.
 * 2. it takes R0 as a parameter to specify which interrupt sources to disable. Each bit in R0 corresponds to a specific interrupt source, and setting a bit to 1 disables that source from generating interrupts.
 * For example, if bit 0 corresponds to the timer interrupt and bit 1 corresponds to the pushbutton key interrupt, setting R0 to 0b11 (3 in decimal) would disable both the timer and pushbutton key interrupts.
 * Arguments: R0 (interrupt id in interrupt_ids.s)
 * Returns: None
 */


.global DISABLE_INTERRUPT_SOURCE
DISABLE_INTERRUPT_SOURCE:
    PUSH {R2-R5, LR}
    /* Configure Interrupt Clear-Enable Registers (ICDICERn). 
    * reg_offset = (integer_div(N / 32) * 4
    * value = 1 << (N mod 32) */
    LSR	R4, R0, #3          // calculate reg_offset
    BIC	R4, R4, #3          // R4 = reg_offset
	LDR	R2, =MPCORE_GIC_DIST+ICDICER
	ADD	R4, R2, R4          // R4 = address of ICDICER
    
    AND	R2, R0, #0x1F       // N mod 32
	MOV	R5, #1              // move 1 to disable
    LSL	R2, R5, R2          // R2 = value

	/* now that we have the register address (R4) and value (R2), we need to set the
	 * correct bit in the GIC register */
    STR	R2, [R4]            // store the new register value

    POP {R2-R5, PC}


/* The function CONFIG_STACK_POINTERS:
 * 1. sets up stack pointers for IRQ and SVC processor modes.
 * 2. it initializes the stack pointer for the IRQ mode to point to the top of the IRQ stack, and it initializes the stack pointer for the SVC mode to point to the top of the SVC stack.
 * Arguments: None
 * Returns: None
 */


.global CONFIG_STACK_POINTERS
CONFIG_STACK_POINTERS:
    // Since we are setting up stack pointers we can't use push and pop so we used BX command to return from the function instead of POP {PC}
    /* Set up stack pointers for IRQ and SVC processor modes */
    MOV R1, #0b11010010         // interrupts masked, MODE = IRQ
    MSR CPSR_c, R1              // change to IRQ mode
    LDR SP, =A9_ONCHIP_END - 3  // set IRQ stack to top of A9 onchip memory
    /* Change to SVC (supervisor) mode with interrupts disabled */
    MOV R1, #0b11010011         // interrupts masked, MODE = SVC
    MSR CPSR_c, R1              // change to supervisor mode
    LDR SP, =DDR_END - 3        // set SVC stack to top of DDR3 memory

    BX LR


/* The function ENABLE_IRQ:
 * 1. enables IRQ interrupts by clearing the I bit in the CPSR register, allowing the processor to respond to IRQ interrupts.
 * Arguments: None
 * Returns: None
 */


.global ENABLE_IRQ
ENABLE_IRQ:
    PUSH {R0, LR}

    // enable IRQ interrupts in the processor
    MOV R0, #0b01010011     // IRQ unmasked, MODE = SVC
    MSR CPSR_c, R0

    POP {R0, PC}

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
    PUSH {R1, LR}

    LDR R1, =KEY_BASE
    STR R0, [R1, #0xC] //Clearing edge capture register to clean any previous interrupts with writing any value to the edge capture register (offset 0xC) of the pushbutton key parallel port.
    STR R0, [R1, #0x8] //Enabling specified the pushbutton keys in R0 to generate interrupts with writting 1 to the interrupt mask register (offset 0x8) of the pushbutton key parallel port.

    POP {R1, PC}

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
    STR R0, [R1] // Load the timer load value into the timer's load register
    MOV R2, #0b1
    STR R2, [R1, #0xC] // Clear the interrupt status by writing 1 to the timer's interrupt clear register (offset 0xC)
    MOV R2, #0b111 // Enable the timer, enable interrupts, and set it to auto-reload mode by writing 0b111 to the timer's control register (offset 0x8)
    STR R2, [R1, #0x8]

    POP {R1-R2, PC}

/* This file:
 * 1. provides the function to move the ball in the game
 */


/* The function MOVE_BALL:
 * 1. updates the position of the ball based on its velocity
 * Arguments: None
 * Returns: None
 */


.global MOVE_BALL
MOVE_BALL:
    PUSH {R0-R5, LR}

    // Load current ball position
    LDR R0, =ball_x
    LDR R1, [R0]
    LDR R2, =ball_y
    LDR R3, [R2]
    
    // Load ball velocity
    LDR R4, =ball_dx
    LDR R4, [R4]
    LDR R5, =ball_dy
    LDR R5, [R5]

    // Calculate ball position
    ADD R1, R1, R4      // Update ball_x
    ADD R3, R3, R5      // Update ball_y
    STR R1, [R0]
    STR R3, [R2]

    POP {R0-R5, PC}

/* This file:
 * 1. provides the function to detect collisions in the game
 */

/* The function CHECK_COLLISIONS:
 * 1. checks for collisions between the ball and the walls or paddles and updates the ball's velocity accordingly
 * 2. checks for scoring conditions and updates the scores if necessary
 * Arguments: None
 * Returns: None
 */

.global CHECK_COLLISIONS
CHECK_COLLISIONS:
    PUSH {R0-R4, LR}
    
    // load ball position
    LDR R0, =ball_x
    LDR R0, [R0]
    LDR R1, =ball_y
    LDR R1, [R1]
    
    BL CHECK_WALL_COLLISIONS // Check for collisions with top and bottom walls
    CMP R2, #1
    BLEQ REVERSE_Y_VELOCITY

    // load paddle positions
    LDR R2, =p1_y
    LDR R2, [R2]
    LDR R3, =p2_y
    LDR R3, [R3]

    BL CHECK_PADDLE_COLLISIONS // Check for collisions with paddles
    CMP R4, #1
    BLEQ REVERSE_X_VELOCITY
    BEQ END_CHECK_COLLISIONS // If paddle collision detected no need to check for scoring conditions

    BL CHECK_SCORE // Check for scoring conditions

    END_CHECK_COLLISIONS:
    POP {R0-R4, PC}


/* The function CHECK_WALL_COLLISIONS:
 * 1. checks for collisions between the ball and the top/bottom walls
 * 2. sets a flag to reverse the y velocity if a collision is detected
 * Arguments: R1 = ball_y (current y position of the ball)
 * Returns: R2 = 1 if collision detected (reverse y velocity), 0 otherwise
 */


CHECK_WALL_COLLISIONS:
    PUSH {LR}

    MOV R2, #0          // Initialize flag to not reverse y velocity

    // Check for collision with top and bottom walls
    CMP R1, #0          // Check collision with top wall
    BLE COLLISION_DETECTED

    CMP R1, #(SCREEN_HEIGHT - BALL_SIZE)        // Check collision with bottom wall
    BLT END_CHECK_WALL_COLLISIONS

    COLLISION_DETECTED:
    MOV R2, #1          // if detected, set flag to reverse y velocity
    
    END_CHECK_WALL_COLLISIONS:
    POP {PC}


/* The function CHECK_PADDLE_COLLISIONS:
 * 1. checks for collisions between the ball and the paddles
 * 2. sets a flag to reverse the x velocity if a collision is detected
 * Arguments: R0 = ball_x (current x position of the ball), R1 = ball_y (current y position of the ball), R2 = p1_y (current y position of player 1's paddle), R3 = p2_y (current y position of player 2's paddle)
 * Returns: R4 = 1 if collision detected (reverse x velocity), 0 otherwise
 */


CHECK_PADDLE_COLLISIONS:
    PUSH {R5-R8, LR}

    // Initialize flag to not reverse x velocity
    MOV R4, #0
    MOV R5, #0 // Initialize flag to check for possible collision with players 0 no collision, 1 collision with player 1, 2 collision with player 2

    // Check if the ball is on the collision line for both paddles
    // Check collision with player 1's paddle
    CMP R0, #(P1_X + PADDLE_WIDTH +1) // Check if ball is at the x position of player 1's paddle
    MOVLE R5, #1 // Set flag to check for possible collision with player 1's paddle
    BLE CHECK_REAL_COLLISION

    // Check collision with player 2's paddle
    LDR R8, =(P2_X - BALL_SIZE - 1) // Load the x position of the collision line for player 2's paddle into R8
    CMP R0, R8 // Check if ball is at the x position of player 2's paddle
    MOVGE R5, #2 // Set flag to check for possible collision with player 2's paddle
    BGE CHECK_REAL_COLLISION

    B CHECK_PADDLE_COLLISIONS_END // If ball is not at the x position of either paddle, skip collision check

    CHECK_REAL_COLLISION:
    /* Collision if R1 (top corner of the ball) <= R7 (bottom of the paddle) AND R8 (bottom corner of the ball) >= R6 (top of the paddle) since top left pixel is origin */

    // Check for which paddle is possible collision zone
    CMP R5, #1 // Check if possible collision with player 1's paddle
    MOVEQ R6, R2 // If possible collision with player 1's paddle, load player 1's paddle y position into R6
    MOVNE R6, R3 // If possible collision with player 2's paddle, load player 2's paddle y position into R6

    // Load the bottom corner of the paddle into R7
    ADD R7, R6, #PADDLE_HEIGHT // R7 now has the y position of the bottom of the paddle

    // Load the bottom corner of the ball into R8
    ADD R8, R1, #BALL_SIZE // R8 now has the y position

    // Check for collision
    CMP R1, R7 // Check if top corner of the ball is below the bottom of the paddle
    BGT CHECK_PADDLE_COLLISIONS_END // If top corner of the ball is below the bottom of the paddle, no collision
    CMP R8, R6 // Check if bottom corner of the ball is above the top of the paddle
    BLT CHECK_PADDLE_COLLISIONS_END // If bottom corner of the ball is above the top of the paddle, no collision
    MOV R4, #1 // If both conditions are satisfied, set flag to reverse x velocity

    CHECK_PADDLE_COLLISIONS_END:
    POP {R5-R8, PC}


/* The function CHECK_SCORE:
 * 1. checks if the ball has passed the left or right edge of the screen, indicating a score for player 2 or player 1 respectively
 * 2. updates the scores and resets the ball position and velocity if a score is detected
 * Arguments: R0 = ball_x (current x position of the ball)
 * Returns: None
 */


CHECK_SCORE:
    PUSH {R1-R5, LR}

    // Check if player 2 scored (ball passed left edge)
    CMP R0, #0
    BGT CHECK_PLAYER_1_SCORE // If ball has not passed left edge, check for player 1 score

    // Player 2 scored
    MOV R0, #2
    BL UPDATE_SCORES // Update player 2's score and set update_hex flag
    

    BL RESET_BALL // Reset ball position and velocity after score
    B END_CHECK_SCORE

    CHECK_PLAYER_1_SCORE:
    // Check if player 1 scored (ball passed right edge)
    LDR R5, =(SCREEN_WIDTH - BALL_SIZE)
    CMP R0, R5
    BLT END_CHECK_SCORE // If ball has not passed right edge, end score check

    // Player 1 scored
    MOV R0, #1
    BL UPDATE_SCORES // Update player 1's score and set update_hex flag

    BL RESET_BALL // Reset ball position and velocity after score

    END_CHECK_SCORE:
    POP {R1-R5, PC}


/* The function REVERSE_Y_VELOCITY:
 * 1. reverses the y velocity of the ball
 * Arguments: None
 * Returns: None
 */


REVERSE_Y_VELOCITY:
    PUSH {R0-R1, LR}

    LDR R0, =ball_dy
    LDR R1, [R0]
    RSB R1, R1, #0     // Reverse the y velocity
    STR R1, [R0]

    POP {R0-R1, PC}


/* The function REVERSE_X_VELOCITY:
 * 1. reverses the x velocity of the ball
 * Arguments: None
 * Returns: None
 */


REVERSE_X_VELOCITY:
    PUSH {R0-R1, LR}

    LDR R0, =ball_dx
    LDR R1, [R0]
    RSB R1, R1, #0     // Reverse the x velocity
    STR R1, [R0]

    POP {R0-R1, PC}


/* The function RESET_BALL:
 * 1. resets the ball's position to the center of the screen and its x velocity to the opposite values no change to y velocity
 * Arguments: None
 * Returns: None
 */


RESET_BALL:
    PUSH {R0-R1, LR}

    // Reset ball position to center of the screen
    LDR R0, =ball_x
    MOV R1, #BALL_INITIAL_X
    STR R1, [R0]

    LDR R0, =ball_y
    MOV R1, #BALL_INITIAL_Y
    STR R1, [R0]

    // Reverse ball x velocity
    BL REVERSE_X_VELOCITY

    POP {R0-R1, PC}

/* This file:
 * 1. provides the implementation of the paddle movement in the SOC-PONG game.
 * 2. it defines the function MOVE_PADDLES, which takes the current position of the paddle and the direction of movement as input, and updates the position of the paddle accordingly.
 * 3. it defines the function MOVE_PLAYER, which is called by MOVE_PADDLES to update the position of a specific player's paddle based on the input command (up or down) while ensuring that the paddle does not move outside the boundaries of the game screen.
 * 4. the paddle position is left top corner of the paddle.
 */


/* The function MOVE_PADDLES:
 * 1. reads the current state of the pushbutton keys to determine the movement commands for both players.
 * 2. calls the MOVE_PLAYER function for each player to update their paddle positions based on the input commands.
 * Arguments: None (reads input from pushbutton keys)
 * Returns: None
 */


.global MOVE_PADDLES
MOVE_PADDLES:
    PUSH {R0-R3, LR}

    /* Masking the commands of players and allinging to optain same bit positions for both players.
     * R2 will hold the command for player 1 and R3 will hold the command for player 2 after masking and aligning.
     */
    LDR R0, =KEY_BASE
    LDR R1, [R0]              // Read the current key state and store it in R1
    AND R2, R1, #0b0011     // Mask out bits 0 and 1 for player 1
    AND R3, R1, #0b1100     // Mask out bits 2 and 3 for player 2
    LSR R3, R3, #2            // Shift player 2 bits to the right by 2 to align with player 1 bits

    CHECK_PLAYER1:
    CMP R2, #NO_INPUT
    CMPNE R2, #INVALID_INPUT
    BEQ CHECK_PLAYER2        // If player 1 has no input, check player
    // Loading arguments for the function MOVE_PLAYER to move player 1's paddle
    MOV R0, R2                // Move player 1's command to R0
    LDR R1, =p1_y             // Load current y position value address of player 1's paddle to R1
    BL MOVE_PLAYER            // Call the function to move player 1's paddle based on the command in R0

    CHECK_PLAYER2:
    CMP R3, #NO_INPUT
    CMPNE R3, #INVALID_INPUT
    BEQ END_MOVE_PADDLES      // If player 2 has no input, end the function
    // Loading arguments for the function MOVE_PLAYER to move player 2's paddle
    MOV R0, R3                // Move player 2's command to R0
    LDR R1, =p2_y             // Load current y position value address of player 2's paddle to R1
    BL MOVE_PLAYER            // Call the function to move player 2's paddle based on the command in R0

    END_MOVE_PADDLES:
    POP {R0-R3, PC}


/* The function MOVE_PLAYER:
 * 1. takes R0 as a parameter to specify the direction of movement (up or down) and R1 as a parameter to specify the address of the current y position of the paddle.
 * 2. updates the y position of the paddle based on the direction of movement while ensuring that the paddle does not move outside the boundaries of the game screen.
 * Arguments: R0 (command of player), R1 (address of current y position of the paddle)
 * Returns: None
 */


MOVE_PLAYER:
    PUSH {R2, LR}  
    
    LDR R2, [R1]             // Load current y position value of the paddle to R3

    // Check player input
    CMP R0, #PLAYER_UP      // Check if the command is to move up
    BNE PLAYER_DOWN_MOVE

    PLAYER_UP_MOVE:
    CMP R2, #1          // Check if the paddle is at the top edge of the screen
    BLE END_MOVE_PLAYER
    SUB R2, R2, #PADDLE_SPEED // Move the paddle up by subtracting the speed from the current position
    STR R2, [R1]           // Store the updated y position back to memory
    B END_MOVE_PLAYER

    PLAYER_DOWN_MOVE:
    CMP R2, #(SCREEN_HEIGHT - PADDLE_HEIGHT) // Check if the paddle is at the bottom edge of the screen
    BGE END_MOVE_PLAYER 
    ADD R2, R2, #PADDLE_SPEED // Move the paddle down by adding the speed to the current position
    STR R2, [R1]          // Store the updated y position back to memory

    END_MOVE_PLAYER:
    POP {R2, PC}

/* This file:
 * 1. provides the function to update the scores in the game and update the HEX display updating flag accordingly
 * 2. provides the function to end the game by setting the game state to STATE_WIN and storing the winner player number
 * 3. provides the function to clear the scores of both players and reset the game for a new game
 */


/* The function UPDATE_SCORES:
 * 1. updates the scores of the players based on the scoring conditions
 * 2. sets the update_hex flag to indicate that the HEX display needs to be updated
 * Arguments: R0 = player number (1 or 2) 
 * Returns: None
 */


.global UPDATE_SCORES
UPDATE_SCORES:
    PUSH {R1-R2, LR}

    CMP R0, #1
    LDREQ R2, =p1_score
    LDRNE R2, =p2_score

    // Update player score
    LDR R1, [R2] // Load current score
    ADD R1, R1, #1 // Increment score
    STR R1, [R2] // Store updated score back to memory

    CMP R1, #WINNING_SCORE
    BLGE END_GAME // Check if the game has ended after updating the score

    // Set update_hex flag to indicate that the HEX display needs to be updated
    LDR R1, =update_hex
    MOV R2, #1
    STR R2, [R1]

    END_UPDATE_SCORES:
    POP {R1-R2, PC}


/* The function END_GAME:
 * 1. sets the game state to STATE_WIN to indicate that the game has ended
 * Arguments: R0 = player number (1 or 2)
 * Returns: None
 */


END_GAME:

    PUSH {R1-R2, LR}

    LDR R1, =winner
    STR R0, [R1] // Store the winner player number in the winner variable

    // Set game state to STATE_WIN
    LDR R1, =game_state
    MOV R2, #STATE_WIN
    STR R2, [R1]

    // Clear Edge Capture Register for KEYS to prevent any pending key interrupts from affecting the game after it has ended
    // Edge capture temizle - biriken key interrupt'ları sil
    LDR R1, =KEY_BASE
    MOV R2, #0xF
    STR R2, [R1, #0xC]

    // Set keys interrupts to be enabled again to allow players to start a new game by pressing a button
    MOV R0, #KEYS_IRQ
    MOV R1, #CPU0

    BL CONFIG_INTERRUPT_SOURCE

    POP {R1-R2, PC}


/* The function RESET_GAME:
 * 1. clears the scores of both players by setting them to 0
 * 2. resets the game to initial state
 * Arguments: None
 * Returns: None
 */


.global RESET_GAME
RESET_GAME:
    PUSH {R0-R1, LR}

    MOV R1, #0 // Value to reset scores and winner variable

    LDR R0, =p1_score
    STR R1, [R0] // Clear player 1 score

    LDR R0, =p2_score
    STR R1, [R0] // Clear player 2 score

    LDR R0, =winner
    STR R1, [R0] // Clear winner variable

    MOV R1, #BALL_INITIAL_DX
    LDR R0, =ball_dx
    STR R1, [R0] // Reset ball's x speed to initial value

    MOV R1, #BALL_INITIAL_DY
    LDR R0, =ball_dy
    STR R1, [R0] // Reset ball's y speed to initial value

    MOV R1, #BALL_INITIAL_X
    LDR R0, =ball_x
    STR R1, [R0] // Reset ball's x position to initial value

    MOV R1, #BALL_INITIAL_Y
    LDR R0, =ball_y
    STR R1, [R0] // Reset ball's y position to initial value

    MOV R1, #PADDLE_INITIAL_Y
    LDR R0, =p1_y
    STR R1, [R0] // Reset player 1 paddle's y position to initial value

    LDR R0, =p2_y
    STR R1, [R0] // Reset player 2 paddle's y position to initial value
    
    MOV R1, #0
    LDR R0, =reset_flag
    STR R1, [R0] // Clear reset flag to indicate normal operation

    // Set update_hex flag to indicate that the HEX display needs to be updated
    MOV R1, #1
    LDR R0, =update_hex
    STR R1, [R0]

    // Clear edge capture and re-enable key interrupt so the title screen can respond to key presses
    LDR R0, =KEY_BASE
    MOV R1, #0xF
    STR R1, [R0, #0xC]    // Clear any accumulated key edges before re-enabling
    MOV R0, #KEYS_IRQ
    MOV R1, #CPU0
    BL CONFIG_INTERRUPT_SOURCE

    POP {R0-R1, PC}

/* This file:
 * 1. provides key ınterrupt service routine
 */


/* The function KEY_ISR:
 * 1. is the interrupt service routine (ISR) for handling key press events in the SOC-PONG game.
 * 2. it clears the interrupt, and updates the game state based on the current state of the game.
 * 3. if the game is in the title screen state, it transitions to the playing state when a key is pressed.
 * If the game is in the win screen state, it transitions back to the title screen when a key is pressed.
 * Arguments: None
 * Returns: None
 */

.global KEY_ISR
KEY_ISR:
    PUSH {R0-R3, LR}

    LDR R0, =KEY_BASE
    STR R0, [R0, #0xC]          // clear the interrupt by writing any value to the edge capture register

    /* Handle the key press event here */
    LDR R0, =game_state
    LDR R1, [R0]                // Load the current game state
    MOV R2, #0                   // Default to 0 (no state change)

TITLE_SCREEN:
    CMP R1, #STATE_TITLE
    BNE WIN_SCREEN
    MOV R1, #STATE_PLAYING    // If we are in the title screen, start the game
    MOV R2, #1
    MOV R0, #KEYS_IRQ
    BL DISABLE_INTERRUPT_SOURCE   // Disable keys interrupt since we only use it to start the game and going to start menu screen after winning
    B END_ISR_KEY

WIN_SCREEN:
    CMP R1, #STATE_WIN
    BNE END_ISR_KEY
    MOV R1, #STATE_TITLE      // If we are in the win screen, go back to the title screen
    LDR R2, =reset_flag
    MOV R3, #1
    STR R3, [R2]              // Set the reset flag to 1 to reset the game state in the main game loop
    MOV R0, #KEYS_IRQ
    BL DISABLE_INTERRUPT_SOURCE   // Disable key interrupt to prevent button bounce from skipping the title screen
    MOV R2, #1

END_ISR_KEY:
    LDR R0, =game_state
    STR R1, [R0]                // Store the updated game state back to memory
    LDR R0, =state_changed
    STR R2, [R0]                // Store the updated state changed flag back to memory
    POP {R0-R3, PC}

/* This file:
 * 1. provides timer interrupt service routine (ISR) for the ARM A9 processor
 */


/* The function TIMER_ISR:*/

.global TIMER_ISR
TIMER_ISR:
    PUSH {R0-R1, LR}

    LDR R0, =MPCORE_PRIV_TIMER
    MOV R1, #1
    STR R1, [R0, #0xC]          // Clear the timer interrupt by writing 1 to the timer's end-of-interrupt register

    LDR R0, =game_state
    LDR R1, [R0]                // Load the current game state

    PLAYING_SCREEN:
    CMP R1, #STATE_PLAYING
    BNE END_ISR

    BL MOVE_PADDLES             // Call the function to move the paddles based on player input

    BL MOVE_BALL                // Call the function to move the ball based on its velocity

    BL CHECK_COLLISIONS         // Call the function to check for collisions and update ball velocity and scores


    END_ISR:
    LDR R0, =frame_ready
    MOV R1, #1
    STR R1, [R0]                // Set frame_ready to 1 to indicate that the game state has been updated and the screen can be redrawn

    POP {R0-R1, PC}

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
    LDR R1, [R0, #0xC] // Read status register
    TST R1, #1 // Check if S bit is set
    BNE WAIT_VSYNC // If S bit is set, we are still in vertical sync, so keep waiting

    LDR R1, [R0, #4] // Read new back buffer address from pixel buffer controller
    LDR R0, =back_buffer // Load address of back buffer variable into R0
    STR R1, [R0] // Update back buffer address in global variable

    POP {R0-R1, PC}

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
    MOV R2, #P1_X // Load paddle 1 x position into R2 since it's constant dont need to load from memory
    LDR R3, =p1_y
    LDR R3, [R3] // Load paddle 1 y position into R3

    BL DRAW_PADDLE // Call function to draw paddle 1 at (R2, R3) with color in R0

    // Load paddle 2 cordinates for drawing
    MOV R2, #P2_X // Load paddle 2 x position into R2 since it's constant dont need to load from memory
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

/* This file:
 * 1. includes function to show the score on the hex display by writing data to the hex display registers.
 */


/* The function DRAW_ON_HEX:
 * 1. shows the score on the hex display by writing data to the hex display registers.
 * 2. it takes no parameters and returns nothing.
 * Arguments: None
 * Returns: None
 */


.global DRAW_ON_HEX
DRAW_ON_HEX:
    PUSH {R0-R3, LR}

    LDR R0, =HEX3_HEX0_BASE // Base address of HEX3-HEX0

    LDR R1, =p1_score
    LDR R1, [R1] // Load player 1 score into R1

    LDR R2, =HEX_Table

    CMP R1, #10       // Check if player 1 score is 10
    BEQ OVER_SCREEN

    LDRB R1, [R2, R1] // Get the corresponding hex
    LSL R1, R1, #24 // Shift to the correct position for HEX3

    LDR R3, =p2_score
    LDR R3, [R3] // Load player 2 score into R3

    CMP R3, #10       // Check if player 2 score is 10
    BEQ OVER_SCREEN

    LDRB R3, [R2, R3] // Get the corresponding hex no need to shift since it's for HEX0
    ORR R1, R1, R3 // Combine player 1 and player 2 scores into one value

    /* Line between player 1 and player 2 scores on the hex display */
    MOV R3, #0x40 // 0b01000000 to light up the middle segment of HEX
    LSL R3, R3, #8 // Shift to the correct position for HEX1
    ORR R3, R3, R3, LSL #8 // Shift again to the correct position for HEX2 and combine with the existing value  
    ORR R1, R1, R3 // Combine with the existing score value
    B END_DRAW_ON_HEX

    OVER_SCREEN:
    LDR R1, =0x3F3E7931 // Hex value to display "OVER" on the hex display

    END_DRAW_ON_HEX:
    STR R1, [R0] // Write the combined value to the HEX display
    LDR R0, =update_hex
    MOV R1, #0 // Clear the update_hex flag after updating the hex display
    STR R1, [R0]

    POP {R0-R3, PC}

/* This file:
 * 1. icludes functions to draw the title screen and the win screen by writing pixel data to character buffer.
 * 2. includes called function to write strings to the character buffer.
 * 3. The DRAW_TITLE function displays the title screen with the game title and a prompt to start the game.
 * 4. The DRAW_WIN function displays the win screen with the winner's name and the final scores of both players.
 */


/* The function DRAW_TITLE:
 * 1. displays the title screen with the game title and a prompt to start the game.
 * 2. it takes no parameters and returns nothing.
 * Arguments: None
 * Returns: None
 */


.global DRAW_TITLE
DRAW_TITLE:
    PUSH {R0-R4, LR}

    LDR R0, =title_str
    MOV R1, #34            // x = (80-12)/2 since title is 12 characters long
    MOV R2, #25            // y = 25 to be in the upper half of the screen
    BL WRITE_STRING

    LDR R0, =press_str
    MOV R1, #28            // x = (80-24)/2 since prompt is 24 characters long
    MOV R2, #30            // y = 30 to be below the title   
    BL WRITE_STRING

    POP {R0-R4, PC}


/* The function DRAW_WIN:
 * 1. displays the win screen with the winner's name and the final scores of both players.
 * 2. it takes no parameters and returns nothing.
 * Arguments: None
 * Returns: None
 */


.global DRAW_WIN
DRAW_WIN:
    PUSH {R0-R5, LR}

    LDR R5, =winner
    LDR R5, [R5]

    CMP R5, #1       // Check if player 1 is the winner
    LDREQ R0, =p1_wins_str
    LDRNE R0, =p2_wins_str
    MOV R1, #33            // x = (80-14)/2 since win message is 14 characters long
    MOV R2, #25            // y = 25 to be in the upper half of the screen
    BL WRITE_STRING

    // P1 score writing
    LDR R0, =score_p1_str
    MOV R1, #30
    MOV R2, #30
    BL WRITE_STRING

    LDR R3, =p1_score
    LDR R3, [R3]
    LDR R4, =FPGA_CHAR_BASE
    MOV R1, #30           // y = 30
    LSL R1, R1, #7        // y * 128
    ADD R1, R1, #35       // x = 35
    ADD R4, R4, R1
    CMP R5, #1            // Is P1 the winner? (score = 10)
    BNE P1_SINGLE_DIGIT
    MOV R3, #'1'
    STRB R3, [R4], #1
    MOV R3, #'0'
    STRB R3, [R4]
    B P1_SCORE_DONE
P1_SINGLE_DIGIT:
    ADD R3, R3, #48
    STRB R3, [R4]
P1_SCORE_DONE:

    // P2 score writing
    LDR R0, =score_p2_str
    MOV R1, #41
    MOV R2, #30
    BL WRITE_STRING

    LDR R3, =p2_score
    LDR R3, [R3]
    LDR R4, =FPGA_CHAR_BASE
    MOV R1, #30           // y = 30
    LSL R1, R1, #7        // y * 128
    ADD R1, R1, #46       // x = 46
    ADD R4, R4, R1
    CMP R5, #2            // Is P2 the winner? (score = 10)
    BNE P2_SINGLE_DIGIT
    MOV R3, #'1'
    STRB R3, [R4], #1
    MOV R3, #'0'
    STRB R3, [R4]
    B P2_SCORE_DONE
P2_SINGLE_DIGIT:
    ADD R3, R3, #48
    STRB R3, [R4]
P2_SCORE_DONE:

    POP {R0-R5, PC}


/* The function WRITE_STRING:
 * Arguments: R0 = string address, R1 = x, R2 = y
 * Returns: None
 */
WRITE_STRING:
    PUSH {R3-R5, LR}

    LSL R3, R2, #7         // y * 128
    ADD R3, R3, R1         // + x
    LDR R4, =FPGA_CHAR_BASE
    ADD R4, R4, R3

    WRITE_LOOP:
        LDRB R5, [R0], #1
        CMP R5, #0
        BEQ WRITE_DONE
        STRB R5, [R4], #1
        B WRITE_LOOP

    WRITE_DONE:
    POP {R3-R5, PC}


/* The function CLEAR_CHAR_BUFFER:
 * 1. clears the character buffer by writing spaces to all positions.
 * 2. it takes no parameters and returns nothing.
 * Arguments: None
 * Returns: None
 */


.global CLEAR_CHAR_BUFFER
CLEAR_CHAR_BUFFER:
    PUSH {R0-R3, LR}

    //Clear state change flag since we are redrawing the whole screen
    LDR R0, =state_changed
    MOV R1, #0
    STR R1, [R0]

    LDR R0, =FPGA_CHAR_BASE
    MOV R1, #0              // satır sayacı
    CHAR_CLEAR_Y:
        MOV R2, #0          // sütun sayacı
        CHAR_CLEAR_X:
            MOV R3, #0x20   // boşluk karakteri
            STRB R3, [R0]
            ADD R0, R0, #1
            ADD R2, R2, #1
            CMP R2, #80
            BNE CHAR_CLEAR_X
        ADD R0, R0, #48     // 128 - 80 = 48 byte atla (padding)
        ADD R1, R1, #1
        CMP R1, #60
        BNE CHAR_CLEAR_Y

    POP {R0-R3, PC}

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

    .global update_hex
    update_hex:     .word 1     // 0 = no need to update HEX display, 1 = update HEX display

    .global state_changed
    state_changed:  .word 0     // 0 = game state has not changed, 1 = game state has changed and needs to be redrawn

    title_str:    .asciz "SOC-MEF-PONG"
    press_str:    .asciz "PRESS ANY KEY TO START"
    p1_wins_str:  .asciz "PLAYER 1 WINS!"
    p2_wins_str:  .asciz "PLAYER 2 WINS!"
    score_p1_str: .asciz "P1:"
    score_p2_str: .asciz "P2:"
    HEX_Table: .byte 0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F // Hex values for digits 0-9
    
.end