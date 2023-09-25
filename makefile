# Makefile for Simple TCP Echo Server in x86_64 assembly

# Directories
SRC_DIR=src
BIN_DIR=bin
TESTS_DIR=tests

# Assembler and linker
AS=nasm
LD=ld

# Source and target files
SRC=$(SRC_DIR)/server.asm
OBJ=$(BIN_DIR)/server.o
TARGET=$(BIN_DIR)/server

# Include directories
INC_DIRS=$(SRC_DIR) $(TESTS_DIR)

# Assembler and linker flags
ASFLAGS=-f elf64 $(addprefix -I,$(INC_DIRS))
LDFLAGS=

all: $(TARGET)

$(TARGET): $(OBJ)
	$(LD) $(LDFLAGS) $< -o $@

$(OBJ): $(SRC) $(wildcard $(addsuffix /*.inc,$(INC_DIRS)))
	$(AS) $(ASFLAGS) $< -o $@

clean:
	rm -f $(OBJ) $(TARGET)

.PHONY: all clean
