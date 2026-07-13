default rel

extern UpdateClock
extern Sleep

section .text
global main

main:
.loop:
    call UpdateClock

    mov ecx, 1000       
    sub rsp, 32          
    call Sleep
    add rsp, 32

    jmp .loop
