; bootloader.asm
BITS 16          ; 16-bit mode
ORG 0x7C00       ; BIOS loads the bootloader at 0x7C00

start:
    mov ax, 0x07C0
    add ax, 288
    mov ss, ax
    mov sp, 4096

    mov si, msg
    call print_string

    jmp $

print_string:
    mov ah, 0x0E
.print_char:
    lodsb
    cmp al, 0
    je .done
    int 0x10
    jmp .print_char
.done:
    ret

msg db 'Welcome to dtOS!', 0

times 510-($-$$) db 0  ; Fill the rest of the 512 bytes with zeros
dw 0xAA55              ; Boot signature
