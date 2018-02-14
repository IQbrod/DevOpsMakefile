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
	#Standard GNU Make Environnement Variable = $(MAKE)
	#https://www.gnu.org/software/make/manual/make.html#Recursion
	$(MAKE) -C $(SUBDIR)
	$(CC) $^ -o $@ $(CFLAGS) $(LIBFLAGS)

test: $(OBJ)
	#Specifying $TEST
	$(MAKE) -C $(SUBDIR) $(TEST)
	$(CC) $^ -o $(MAIN) $(CFLAGS) $(LIBFLAGS)
	./$(MAIN) $(NB_THREAD)

clean-dirt:
	rm -rf *.o	

clean: clean-dirt
	rm -rf $(MAIN)
	$(MAKE) -C $(SUBDIR) clean
