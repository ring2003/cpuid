[BITS 32]
section .bss
str: RESB 13
section .text
global fetch
main:
    push ebp
    mov ebp,esp
    sub esp,16

    mov eax,0x0
    push str
    push eax
    call fetch

    leave
    ret

fetch:
    push ebp
    mov ebp,esp

    mov eax,[esp+8]
    cpuid
    mov edi,[esp+12]
    push ebx
    xor ebx,ebx
    mov bh,0x04
    cld
    .1:
        stosb
        shr eax,8
        dec bh
        jnz .1
    pop ebx
    xor eax,eax
    mov ah,0x04
    .2:
        mov al,bl
        stosb
        shr ebx,8
        dec ah
        jnz .2
    mov ah,0x04
    .3:
        mov al,cl
        stosb
        shr ecx,8
        dec ah
        jnz .3
    mov ah,0x04
    .4:
        mov al,dl
        stosb
        shr edx,8
        dec ah
        jnz .4

    leave
    ret
