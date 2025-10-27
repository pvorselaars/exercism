.text
.globl is_pangram

is_pangram:
        mov w1, 0
        movz w5, 0xFFFF
        movk w5, 0x03FF, lsl 16  // w5 = bitmap of 26 letters
loop:
        ldrb w2, [x0], 1
        cbz w2, done
        orr w3, w2, 0x20
        subs w3, w3, 'a' // index 0 .. 25
        cmp w3, 25
        bhi loop
        mov w4, 1
        lsl w4, w4, w3
        orr w1, w1, w4
        cmp w1, w5
        beq done
        b loop
done:
        cmp w1, w5
        cset w0, eq
        ret
