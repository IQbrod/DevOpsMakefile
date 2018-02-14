CC=gcc
OFLAGS=-O3
CFLAGS=-lpthread
LIBFLAGS=-L./lock_implementation -lmylock
MAIN=queue_test

all: $(MAIN)

main.o: main.c queue.h
	$(CC) -o $@ -c $<  $(OFLAGS)

%.o: %.c
	$(CC) -o $@ -c $<  $(OFLAGS)

queue_test: main.o queue.o
	$(CC) $^ -o $@ $(CFLAGS) $(LIBFLAGS)

clean:
	rm -rf $(MAIN) *.o
