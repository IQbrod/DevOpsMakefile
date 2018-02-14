CC=gcc
CFLAGS=-O3 -fPIC
LDFLAGS=-lpthread -shared
TARGET=libmylock.so

%.o: %.c
	$(CC) -o $@ -c $<  $(CFLAGS)

sleepinglock: sleeping_lock.o
	$(CC) -o $(TARGET) $^ $(LDFLAGS)

spinlock: spin_lock.o
	$(CC) -o $(TARGET) $^ $(LDFLAGS)

clean:
	rm -rf $(TARGET) *.o
