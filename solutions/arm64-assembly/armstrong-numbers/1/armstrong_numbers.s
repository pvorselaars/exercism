.text
.globl is_armstrong_number

is_armstrong_number:
        mov x20, x0                     // save input
        mov x10, 10                     // divisor
        mov x1, 0                       // count

.digits:                                // count decimal digits
        udiv x0, x0, x10
        add x1, x1, 1
        cbnz x0, .digits

        mov x7, 0
        mov x0, x20
.loop:
        udiv x2, x0, x10
        msub x4, x2, x10, x0            // compute digit

        mov x5, 1
        mov x6, x1
.power:
        mul x5, x5, x4                  // power = digit ^ count
        sub x6, x6, 1
        cbnz x6, .power

        add x7, x7, x5
        mov x0, x2
        cbnz x0, .loop

        cmp x20, x7                     // compare to original
        bne .is_not_armstrong_number

.is_armstrong_number:
        mov x0, 1
        ret

.is_not_armstrong_number:
        mov x0, 0
        ret
