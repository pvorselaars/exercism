.text
.globl egg_count

egg_count:
.loop:
        tst x0, 1
        cinc x1, x1, ne
        lsr x0, x0, 1
        cbnz x0, .loop

        mov x0, x1
        ret
