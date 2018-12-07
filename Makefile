AS=scas
CC=kcc
LD=scas
LDFLAGS=-fno-remove-unused-funcs
ASFLAGS=-fexplicit-export -fexplicit-import -Iinclude -fno-remove-unused-funcs
CFLAGS=-Iinclude --no-std-crt0 --std-c11 -mz80 #--nostdinc --nostdlib 

bin/src/%.asm.o:src/%.asm
	mkdir $(dir $@) -p
	$(AS) $(ASFLAGS) -c $< -o $@

bin/src/%.c.o:src/%.c $(wildcard include/*)
	mkdir $(dir $@) -p
	$(CC) -S $< -o $(basename $@).asm $(CFLAGS)
	$(AS) $(ASFLAGS) -c $(basename $@).asm -o $@
#	rm $(basename $@).asm

SRC=src/main.asm $(wildcard src/*)
OBJECTS=$(addprefix bin/, $(addsuffix .o, $(SRC)))

.PHONY:default install

default: bin/bios.rom

bin/bios.rom: $(OBJECTS)
	$(LD) $(LDFLAGS) $^ -o $@

install: bin/bios.rom
	mkdir -p $(DESTDIR)
	install $^ $(DESTDIR)/

clean:
	$(RM) -r bin/
