.section .rodata
pre: .string ", you are the "
post: .string " customer we serve today. Thank you!"
th: .string "th"
st: .string "st"
nd: .string "nd"
rd: .string "rd"

.text
.globl format

format:
        stp x29, x30, [sp, -16]!
        bl print
        adr x1, pre
        bl print

        mov x3, 100
        mov x5, 10
        mov x6, 0
        mov x7, x2
loop:
        udiv x4, x2, x3 
        bl print_number

        msub x2, x4, x3, x2
        udiv x3, x3, x5
        cbnz x3, loop

        mov x5, 100
        udiv x8, x7, x5
        msub x9, x8, x5, x7
        cmp x9, 11
        beq other
        cmp x9, 12
        beq other
        cmp x9, 13
        beq other

        mov x5, 10
        udiv x8, x7, x5
        msub x9, x8, x5, x7

        cmp x9, 1
        bne 2f
        adr x1, st
        b 4f

2:
        cmp x9, 2
        bne 3f
        adr x1, nd
        b 4f

3:
        cmp x9, 3
        bne other
        adr x1, rd
        b 4f

other:
        adr x1, th
4:
        bl print
        b continue

continue:
        adr x1, post
        bl print

        strb wzr, [x0]

        ldp x29, x30, [sp], 16
        ret

print_number:
        cbnz x4, 1f
        cbz x6, 2f
1:
        mov x6, 1
        add x4, x4, 48
        strb w4, [x0], 1
        sub x4, x4, 48
2:
        ret

print:
        ldrb w3, [x1], 1
        cbz w3, 1f
        strb w3, [x0], 1
        b print
1:
        ret
