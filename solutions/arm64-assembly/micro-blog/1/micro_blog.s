.text
.globl truncate

truncate:
        mov x5, 5
loop:
        ldrb w2, [x1], 1
        cbz w2, done
        strb w2, [x0], 1
        tbz w2, 7, end
        tbz w2, 6, loop
end:
        sub x5, x5, 1
        cbnz x5, loop

drain:
        ldrb w2, [x1]
        tbz w2, 7, done
        tbnz w2, 6, done
        ldrb w2, [x1], 1
        strb w2, [x0], 1
        b drain
done:
        str wzr, [x0]
        ret
