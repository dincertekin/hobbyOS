# Assemble bootloader
as -o bootloader.o src/bootloader.asm
ld -o bootloader.bin -T linker.ld bootloader.o

# Compile kernel
gcc -c -o kernel.o src/kernel.c -ffreestanding -O2 -Wall -Wextra

# Link kernel
ld -T linker.ld -o kernel.bin kernel.o

# Create disk image
cat bootloader.bin kernel.bin > os_image.bin

# Final step: run the OS image using QEMU
# qemu-system-aarch64 -drive format=raw,file=os_image.bin