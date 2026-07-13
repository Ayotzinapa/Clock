# ===========================
# Assembly Clock Makefile
# ===========================

ASM      = nasm
CC       = gcc

ASMFLAGS = -f win64
CFLAGS   = -Wall
LDFLAGS  =

SRC = src
BUILD = build

OBJS = \
	$(BUILD)/main.obj \
	$(BUILD)/clock.obj

TARGET = Clock.exe

all: $(TARGET)

$(BUILD):
	mkdir -p $(BUILD)

$(BUILD)/main.obj: $(SRC)/main.asm | $(BUILD)
	$(ASM) $(ASMFLAGS) $< -o $@

$(BUILD)/clock.obj: $(SRC)/clock.asm | $(BUILD)
	$(ASM) $(ASMFLAGS) $< -o $@

$(TARGET): $(OBJS)
	$(CC) $(OBJS) -o $(TARGET)

clean:
	rm -rf $(BUILD)
	rm -f $(TARGET)

run: all
	./$(TARGET)