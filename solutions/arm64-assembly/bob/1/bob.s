.section .rodata
whatever: .string "Whatever."
chill: .string "Whoa, chill out!"
sure: .string "Sure."
calm_down: .string "Calm down, I know what I'm doing!"
fine: .string "Fine. Be that way!"

.text
.globl response

response:
        mov x2, 0
        mov x3, 0
        mov x4, 0
.parse: 
        ldrb w1, [x0], 1
        cbz w1, .done           // check for end
        cmp w1, 46              // skip special chars
        blt .parse
        add x4, x4, 1           // count char
        cmp w1, 'A'
        blt .no_letter
        cmp w1, 'z'
        bgt .no_letter
        add x2, x2, 1           // count letter
        cmp w1, 'a'             // char >= 97 (a-z)
        bge .no_caps
        add x3, x3, 1           // count capital letter
.no_caps:
.no_letter:
        b .parse
.done:
        cbz x4, .say_fine
        sub x0, x0, 1
.check_question_mark:
        ldrb w1, [x0, -1]!
        cmp w1, ' '
        beq .check_question_mark
        cmp w1, '?'
        beq .question
        cbz x2, .say_whatever
        cmp x3, x2
        beq .say_chill

.say_whatever:
        adr x0, whatever
        ret

.question:
        cbz x2, .say_sure
        cmp x3, x2
        beq .say_calm_down

.say_sure:
        adr x0, sure
        ret

.say_calm_down:
        adr x0, calm_down
        ret

.say_chill:
        adr x0, chill
        ret

.say_fine:
        adr x0, fine
        ret

