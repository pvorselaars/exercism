.text
.globl leap_year

leap_year:
        mov x1, x0
        and x0, x0, 3
        cbnz x0, not_a_leap_year        

        mov x2, 100
        udiv x3, x1, x2
        msub x5, x3, x2, x1
        cbnz x5, a_leap_year        

        mov x2, 400
        udiv x3, x1, x2
        msub x5, x3, x2, x1
        cbnz x5, not_a_leap_year

a_leap_year:
        mov x0, 1
        ret

not_a_leap_year:
        mov x0, 0
        ret
