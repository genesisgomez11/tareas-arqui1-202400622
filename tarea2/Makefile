AS = aarch64-linux-gnu-as
LD = aarch64-linux-gnu-ld

all: main

main: main.o
	$(LD) -o main main.o

main.o: main.s
	$(AS) -g -o main.o main.s

run: main
	qemu-aarch64 ./main; echo "X5 = $$?"

debug: main
	qemu-aarch64 -g 1234 ./main

clean:
	rm -f main main.o