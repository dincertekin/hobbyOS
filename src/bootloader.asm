    .section .text
    .global _start

_start:
    // Set up stack pointer (SP)
    ldr x0, =0x8000     // Set stack pointer to 0x8000
    mov sp, x0          // Set stack pointer

    // Print the message
    ldr x0, =msg        // Load the address of the message
    bl print_string     // Branch to print_string function

    // Infinite loop (halt)
1:  b 1b                // Branch back to itself

print_string:
    mov x1, x0          // Move address of string to x1
.next_char:
    ldrb w0, [x1], #1   // Load byte from address in x1 and increment
    cmp w0, #0          // Check if it's the null terminator
    beq .done           // If so, branch to done
    mov x2, #1          // Set length for write
    mov x8, #64         // syscall number for write (sys_write)
    mov x0, #1          // file descriptor: stdout
    svc #0              // make the syscall
    b .next_char        // Repeat for next character
.done:
    ret                  // return from function

msg:
    .asciz "Welcome to pineappleOS!"

    .section .bss
    .space 512            // Reserve space for 512 bytes 
