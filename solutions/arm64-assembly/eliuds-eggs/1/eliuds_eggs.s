.text
.globl egg_count

egg_count:
        mov x2, 64

.loop:
        tst x0, 1
        cinc x1, x1, ne
        lsr x0, x0, 1
        sub x2, x2, 1
        cbnz x2, .loop

        mov x0, x1
        ret
