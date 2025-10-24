.text
.globl nucleotide_counts

nucleotide_counts:
        mov x3, xzr
        mov x4, 1
        lsl x5, x4, 16
        lsl x6, x4, 32
        lsl x7, x4, 48
loop:
        ldrb w2, [x1], 1
        cbz x2, end
        cmp x2, 'A'
        beq A 
        cmp x2, 'C'
        beq C
        cmp x2, 'G'
        beq G
        cmp x2, 'T'
        beq T 

        mov x1, -1
        str x1, [x0]
        ret
A:
        add x3, x3, x4
        b loop
C:
        add x3, x3, x5
        b loop
G:
        add x3, x3, x6
        b loop
T:
        add x3, x3, x7
        b loop
end:
        str x3, [x0]
        ret
