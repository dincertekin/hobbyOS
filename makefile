# Assemble bootloader
nasm -f bin -o bootloader.bin src/bootloader.asm

# Compile kernel
gcc -m32 -c -o kernel.o src/kernel.c -ffreestanding -O2 -Wall -Wextra

# Link kernel
ld -m elf_i386 -T linker.ld -o kernel.bin kernel.o

# Create disk image
cat bootloader.bin kernel.bin > os_image.bin

# Final step: qemu-system-x86_64 -drive format=raw,file=os_image.bin