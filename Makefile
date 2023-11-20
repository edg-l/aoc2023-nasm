.PHONY: clean debug

build: program

program.o: program.asm lib/*.asm
	nasm -f elf64 -F dwarf -g program.asm

program: program.o
	ld program.o -o program

clean:
	rm -rf *.o

debug:
	gdb ./program
