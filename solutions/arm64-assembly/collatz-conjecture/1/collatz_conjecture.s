.equ INVALID_NUMBER, -1

.text
.globl steps

steps:
        cmp x0, 0
        ble error
        mov x1, x0
        mov x0, 0
        mov x2, 2
        mov x3, 3
loop:
        cmp x1, 1
        beq done
        add x0, x0, 1
        tbnz x1, 0, odd
even:
        udiv x1, x1, x2
        b loop
odd:
        mul x1, x1, x3
        add x1, x1, 1
        b loop
error:
        mov x0, INVALID_NUMBER
done:
        ret
