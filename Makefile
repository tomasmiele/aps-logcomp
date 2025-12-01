FLEX   ?= flex
BISON  ?= bison
CC     ?= cc

ROOT   := .
SRC    := .
BUILD  := build
BIN    := bin

SRC_MAIN := $(SRC)/main.c
SRC_LEX  := $(SRC)/lexer.l
SRC_YACC := $(SRC)/parser.y

PARSER_C := $(BUILD)/parser.tab.c
PARSER_H := $(BUILD)/parser.tab.h
LEX_C    := $(BUILD)/lex.yy.c

TARGET := $(BIN)/aps_parser

.PHONY: all run clean

all: $(TARGET)

$(TARGET): $(PARSER_C) $(LEX_C) $(SRC_MAIN) | $(BIN)
	$(CC) -o $@ $(PARSER_C) $(LEX_C) $(SRC_MAIN)

$(PARSER_C) $(PARSER_H): $(SRC_YACC) | $(BUILD)
	$(BISON) -d -o $(PARSER_C) $(SRC_YACC)

$(LEX_C): $(SRC_LEX) $(PARSER_H) | $(BUILD)
	$(FLEX) -o $(LEX_C) $(SRC_LEX)

$(BUILD):
	mkdir -p $(BUILD)

$(BIN):
	mkdir -p $(BIN)

run: $(TARGET)
	@ if [ -z "$(FILE)" ]; then echo "Use: make run FILE=ex1_ok.src"; exit 1; fi
	@ $(TARGET) $(FILE)

clean:
	rm -rf $(BUILD) $(BIN)
	mkdir -p $(BUILD) $(BIN)
