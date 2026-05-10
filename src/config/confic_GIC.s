.include "../constants/address_map_arm.s"
.include "../constants/defines.s"

/* This file:
 * 1. configures the generic interrupt controller (GIC) for the ARM A9 processor
 * 2. configurates the GIC to enable interrupts from private timer and pushbuttons
 */

.global CONFIG_GIC
CONFIG_GIC:
    