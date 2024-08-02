# Diretórios
SRC_DIR = src
BIN_DIR = bin

# Opções do compilador
JAVAC = javac
JAVAC_FLAGS = -d $(BIN_DIR) -sourcepath $(SRC_DIR) -cp $(BIN_DIR)

# Arquivos .java
SOURCES = $(wildcard $(SRC_DIR)/*.java)

# Arquivos .class
CLASSES = $(SOURCES:$(SRC_DIR)/%.java=$(BIN_DIR)/%.class)

# Nome do executável principal
MAIN_CLASS = Pong

# Regras do Makefile
.PHONY: all compile clean run

all: compile

compile: $(CLASSES)

$(BIN_DIR)/%.class: $(SRC_DIR)/%.java
	$(JAVAC) $(JAVAC_FLAGS) $<

clean:
	rm -rf $(BIN_DIR)/*.class

run: all
	java -cp $(BIN_DIR) $(MAIN_CLASS)
