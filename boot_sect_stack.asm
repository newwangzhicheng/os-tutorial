mov ah, 0x0e ;TTY mode

mov bp, 0x8000 ;设定栈底位置
mov sp ,bp ;栈为空

push 'A'
push 'B'
push 'C'

mov al, [0x7ffe] ; 0x8000 - 2
int 0x10

mov al, [0x8000] ;访问不到
int 0x10

pop bx
mov al, bl
int 0x10

pop bx
mov al, bl
int 0x10

pop bx
mov al, bl
int 0x10

mov al, [0x8000]
int 0x10

jmp $
times 510 - ($ - $$) db 0
dw 0xaa55