;=========================================================
; main.asm
; Assembly Clock - Main Entry
;=========================================================

default rel

extern UpdateClock
extern Sleep

section .text
global main

main:
.loop:
    call UpdateClock

    mov ecx, 1000        ; Sleep(1000 ms)
    sub rsp, 32          ; Shadow space (Win64 ABI)
    call Sleep
    add rsp, 32

    jmp .loop