default rel

global UpdateClock

extern GetLocalTime
extern GetStdHandle
extern WriteConsoleA

STD_OUTPUT_HANDLE equ -11

section .bss

SYSTEMTIME      resb 16
TIME_BUFFER     resb 11
CONSOLE_HANDLE  resq 1
WRITTEN         resd 1


section .text



UpdateClock:

   
    sub rsp, 40


    

    lea rcx, [SYSTEMTIME]
    call GetLocalTime


   
    movzx eax, word [SYSTEMTIME + 8]
    lea rdi, [TIME_BUFFER]
    call Convert2Digits


    
    mov byte [TIME_BUFFER + 2], ':'


  
    movzx eax, word [SYSTEMTIME + 10]
    lea rdi, [TIME_BUFFER + 3]
    call Convert2Digits


    
    mov byte [TIME_BUFFER + 5], ':'


    
    movzx eax, word [SYSTEMTIME + 12]
    lea rdi, [TIME_BUFFER + 6]
    call Convert2Digits


    
    mov byte [TIME_BUFFER + 8], 13
    mov byte [TIME_BUFFER + 9], 10


  
    mov ecx, STD_OUTPUT_HANDLE
    call GetStdHandle

    mov [CONSOLE_HANDLE], rax




    mov rcx, [CONSOLE_HANDLE]
    lea rdx, [TIME_BUFFER]
    mov r8d, 10

    lea r9, [WRITTEN]

    mov qword [rsp + 32], 0

    call WriteConsoleA


    add rsp, 40
    ret




Convert2Digits:

    xor edx, edx
    mov ecx, 10

    div ecx

  
    add al, '0'
    mov [rdi], al


  
    mov eax, edx
    add al, '0'
    mov [rdi + 1], al


    ret