# Makefile — APS Lex/Syntax only (Flex/Bison)
# Uso:
#   make            # compila
#   make run FILE=tests/ex1_ok.src
#   make clean

FLEX   ?= flex
BISON  ?= bison
CC     ?= cc

ROOT   := $(CURDIR)
SRC    := $(ROOT)/src
BUILD  := $(ROOT)/build
BIN    := $(ROOT)/bin

PARSER_C := $(BUILD)/parser.tab.c
PARSER_H := $(BUILD)/parser.tab.h
LEX_C    := $(BUILD)/lex.yy.c

TARGET := $(BIN)/aps_parser

all: $(TARGET)

$(TARGET): $(PARSER_C) $(LEX_C) $(SRC)/main.c | $(BIN)
	$(CC) -o $@ $(PARSER_C) $(LEX_C) $(SRC)/main.c

$(PARSER_C) $(PARSER_H): $(SRC)/parser.y | $(BUILD)
	$(BISON) -d -o $(PARSER_C) $(SRC)/parser.y

$(LEX_C): $(SRC)/lexer.l $(PARSER_H) | $(BUILD)
	$(FLEX) -o $(LEX_C) $(SRC)/lexer.l

$(BUILD):
	mkdir -p $(BUILD)

$(BIN):
	mkdir -p $(BIN)

run: $(TARGET)
	@ if [ -z "$(FILE)" ]; then echo "Use: make run FILE=tests/ex1_ok.src"; exit 1; fi
	@ $(TARGET) $(FILE)

clean:
	rm -rf $(BUILD) $(BIN)
	mkdir -p $(BUILD) $(BIN)
