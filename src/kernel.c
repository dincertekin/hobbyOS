void main() {
    char* video_memory = (char*) 0x3FC00;
    const char* message = "Hello from the kernel!";
    int i = 0;

    while (message[i] != '\0') {
        video_memory[i * 2] = message[i];
        video_memory[i * 2 + 1] = 0x07; // Light grey on black background
        i++;
    }
}
