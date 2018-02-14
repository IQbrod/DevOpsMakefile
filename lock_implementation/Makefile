CC=gcc
CFLAGS=-O3 -fPIC
LDFLAGS=-lpthread -shared
TARGET=libmylock.so

all: spinlock clean-dirt

%.o: %.c
	$(CC) -o $@ -c $<  $(CFLAGS)

sleepinglock: sleeping_lock.o
	$(CC) -o $(TARGET) $^ $(LDFLAGS)

spinlock: spin_lock.o
	$(CC) -o $(TARGET) $^ $(LDFLAGS)

clean-dirt:
	rm -rf *.o

clean: clean-dirt
	rm -rf $(TARGET)
