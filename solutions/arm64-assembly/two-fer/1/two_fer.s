.section .rodata
pre: .string "One for "
you: .string "you"
post: .string ", one for me."

.text
.globl two_fer

two_fer:
        stp x29, x30, [sp, -16]!
        mov x29, sp

        mov x2, x1
        adr x1, pre
        bl .print

        mov x1, x2
        cbnz x1, .name_provided
        adr x1, you
.name_provided:
        bl .print

        adr x1, post
        bl .print

        strb wzr, [x0], 1
        ldp x29, x30, [sp], 16
        ret

.print:
        ldrb w4, [x1], 1
        cbz w4, .done
        strb w4, [x0], 1
        b .print
.done:
        ret
