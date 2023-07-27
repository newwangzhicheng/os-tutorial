mov ah, 0x0e

mov al, [the_secret] ;绝对地址，segment为0，无法得到预期的X，
int 0x10

mov bx, 0x7c0
mov ds, bx ;定义ds，后续的数据地址都隐式地加上ds<<4
mov al, [the_secret];成功显示
int 0x10

mov al, [es:the_secret] ;es未定义，是0，无法达到预期
int 0x10

mov bx, 0x7c0
mov es, bx
mov al, [es:the_secret] ;可以得到预期
int 0x10

jmp $

the_secret:
    db "X"

times 510 - ($ - $$) db 0
dw 0xaa55