.equ UNEQUAL_LENGTHS, -1

.text
.globl distance

distance:
        mov x4, 0
loop:
        ldrb w2, [x0], 1
        ldrb w3, [x1], 1
        cbz w2, done
        cbz w3, done
        cmp w2, w3
        beq loop
        add x4, x4, 1
        b loop
done:
        cmp w2, w3
        bne invalid
        mov x0, x4
        ret
invalid:
        mov x0, -1
        ret
