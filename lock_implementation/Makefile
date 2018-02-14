CC=gcc
OFLAGS=-O3 -fPIC
SOFLAGS=-lpthread -shared
SLNAME=libmylock.so

%.o: %.c
	$(CC) -o $@ -c $<  $(OFLAGS)

sleepinglock: sleeping_lock.o
	$(CC) -o $(SLNAME) $^ $(SOFLAGS)

spinlock: spin_lock.o
	$(CC) -o $(SLNAME) $^ $(SOFLAGS)

clean:
	rm -rf $(SLNAME) *.o
