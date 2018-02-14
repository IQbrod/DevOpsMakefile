CC=gcc
CFLAGS=-W -Wall -g -O2
LDLIBS=-lpthread
TESTS=test

all: $(TESTS)

%.o: %.c
	$(CC) -o $@ -c $<  $(CFLAGS)

test: test.o stdes.o
	$(CC) -o $@ $^ $(CFLAGS)

clean:
	rm -rf $(TESTS) *.o
