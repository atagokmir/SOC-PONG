.include    "../constants/address_map_arm.s"     
.include    "../constants/defines.s"             
.include    "../constants/interrupt_ID.s"

/* This file:
 * 1. defines exception vectors for the A9 processor
 */

/*--- IRQ ---------------------------------------------------------------------*/
.global     SERVICE_IRQ             
SERVICE_IRQ:                            
        PUSH    {R0-R12, LR}             

/* Read the ICCIAR from the CPU interface */
        LDR     R4, =MPCORE_GIC_CPUIF   
        LDR     R5, [R4, #ICCIAR]       // read the interrupt ID

                
EXIT_IRQ:                               
/* Write to the End of Interrupt Register (ICCEOIR) */
        STR     R5, [R4, #ICCEOIR]      

        POP     {R0-R12, LR}             
        SUBS    PC, LR, #4              


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