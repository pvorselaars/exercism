.text
.globl square_of_sum
.globl sum_of_squares
.globl difference_of_squares

square_of_sum:
        mov x1, x0
        mov x0, xzr
1:
        add x0, x0, x1
        sub x1, x1, 1
        cbnz x1, 1b
        mul x0, x0, x0
        ret

sum_of_squares:
        mov x1, x0
        mov x0, xzr
1:
        madd x0, x1, x1, x0
        sub x1, x1, 1
        cbnz x1, 1b
        ret

difference_of_squares:
        mov x1, xzr
        mov x2, xzr
1:      
        add x1, x1, x0
        madd x2, x0, x0, x2
        sub x0, x0, 1
        cbnz x0, 1b
        mul x1, x1, x1
        sub x0, x1, x2
        ret
