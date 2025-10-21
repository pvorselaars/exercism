.text
.globl reverse

reverse:
        mov x1, x0

find_end_of_string:
        ldrb w2, [x1]
        cbz x2, end_of_string
        add x1, x1, 1
        b find_end_of_string

end_of_string:
        cmp x1, x0
        beq done
        sub x1, x1, 1
reverse_bytes:
        ldrb w3, [x0]
        ldrb w4, [x1]
        strb w4, [x0]
        strb w3, [x1]  
        sub x1, x1, 1
        add x0, x0, 1
        cmp x1, x0
        ble done
        b reverse_bytes
done:
        ret
