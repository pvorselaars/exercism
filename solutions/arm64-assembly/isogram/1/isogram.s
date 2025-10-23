.text
.globl is_isogram

is_isogram:
        mov x1, xzr       // letter bitmap
loop:
        ldrb w2, [x0], 1
        cbz w2, isogram
        cmp w2, 'A'
        blt loop
        cmp w2, 'a'
        bge 1f
        sub w2, w2, 32
1:
        sub w2, w2, 'a'
        mov x3, 1
        lsl x3, x3, x2
        tst x1, x3
        bne no_isogram
        orr x1, x1, x3
        b loop

no_isogram:
        mov x0, xzr
        ret
isogram:
        mov x0, 1
        ret
