SOURCES=main.c
CC=avr-gcc
OBJCOPY=avr-objcopy
MMCU=atmega328p

CFLAGS=-mmcu=$(MMCU) -Wall -O3 -g

all: main.hex main.lst

main.hex: main.out
	$(OBJCOPY) -j .text -O ihex main.out main.hex

main.lst: main.hex
	avr-objdump -h -S main.out > main.lst

main.out: $(SOURCES)
	$(CC) $(CFLAGS) -I./ -o main.out $(SOURCES)

clean:
	rm -f main.lst
	rm -f main.out
	rm -f main.hex
