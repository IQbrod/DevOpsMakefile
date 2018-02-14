# Compiler
CC=gcc
# Flags
OFLAGS=-O3
CFLAGS=-lpthread
LIBFLAGS=-L./lock_implementation -lmylock
# Files
MAIN=queue_test
SRC=$(wildcard *.c)
OBJ=$(SRC:.c=.o)

all: $(MAIN)

main.o: main.c queue.h
	$(CC) -o $@ -c $<  $(OFLAGS)
%.o: %.c
	$(CC) -o $@ -c $<  $(OFLAGS)

queue_test: $(OBJ)
	$(CC) $^ -o $@ $(CFLAGS) $(LIBFLAGS)

clean:
	rm -rf $(MAIN) *.o
