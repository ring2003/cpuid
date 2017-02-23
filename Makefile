cpuid: fetch.o test.c
        rm -rf cpuid
        gcc -v -o cpuid fetch.o test.c
fetch.o: fetch.asm
        nasm -f elf -g -F stabs -o fetch.o fetch.asm
