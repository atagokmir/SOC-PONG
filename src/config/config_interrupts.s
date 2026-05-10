.include "../constants/address_map_arm.s"
.include "../constants/defines.s"


/* This file:
 * 1. configures the generic interrupt controller (GIC) for the ARM A9 processor
 * 2. includes function to configure the GIC to enable interrupts for specified sources
 * 3. includes function to enable the GIC itself to allow it to forward interrupts to the processor
 * 4. includes function to set up stack pointers for IRQ and SVC processor modes
 * 5. includes function to enable IRQ interrupts 
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


/* The function CONFIG_GIC:
 * 1. configures the GIC to enable interrupts for specified sources and routes them to desired CPU(s).
 * 2. it takes R0 as a parameter to specify which interrupt sources to enable. Each bit in R0 corresponds to a specific interrupt source, and setting a bit to 1 enables that source to generate interrupts.
 * For example, if bit 0 corresponds to the timer interrupt and bit 1 corresponds to the pushbutton key interrupt, setting R0 to 0b11 (3 in decimal) would enable both the timer and pushbutton key interrupts.
 * 3. it takes R1 as a parameter to specify the target CPU(s) for the enabled interrupts. Each bit in R1 corresponds to a specific CPU, and setting a bit to 1 routes the enabled interrupts to that CPU.
 * Arguments: R0 (interrupt sources) and R1 (target CPU(s))
 * Returns: None
 */


.global CONFIG_GIC
CONFIG_GIC:
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
    LDR	R3, [R4]	        // read current register value
    ORR	R3, R3, R2          // set the enable bit
    STR	R3, [R4]            // store the new register value

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