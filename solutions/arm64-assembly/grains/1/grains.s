.text
.globl square
.globl total

square:
        cmp x0, 0
        ble invalid
        cmp x0, 64
        bgt invalid
        mov x1, x0
        mov x0, 1
        sub x1, x1, 1
        lsl x0, x0, x1
        ret
invalid:
        mov x0, 0
        ret

total:
        mov x0, -1
        ret
