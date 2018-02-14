# Compiler
CC=gcc
# Files
MAIN=queue_test
SRC=$(wildcard *.c)
OBJ=$(SRC:.c=.o)
SUBDIR=lock_implementation
# Flags
OFLAGS=-O3
CFLAGS=-lpthread
LIBFLAGS=-L./$(SUBDIR) -lmylock

all: $(MAIN) clean-dirt

main.o: main.c queue.h
	$(CC) -o $@ -c $<  $(OFLAGS)
%.o: %.c
	$(CC) -o $@ -c $<  $(OFLAGS)

queue_test: $(OBJ)
	$(MAKE) -C $(SUBDIR)
	$(CC) $^ -o $@ $(CFLAGS) $(LIBFLAGS)

clean-dirt:
	rm -rf *.o	

clean: clean-dirt
	rm -rf $(MAIN) 
