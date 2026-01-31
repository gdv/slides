# Variables
PANDOC = pandoc
REVEALJS_DIR = reveal.js
OUTPUT_DIR = .

# Find all markdown files in the current directory
# All presentation filenames are YYYY-MM-DD-title.md
SOURCES = $(wildcard 20*-??-??-*.md)
# Define output names (change .md to .html)
TARGETS = $(SOURCES:.md=.html)

# Default target
all: $(TARGETS)

# Rule to convert .md to .html
%.html: %.md
	$(PANDOC) $< -t revealjs -s -o $@ \
		-V revealjs-url=$(REVEALJS_DIR) \
		--metadata title="$(basename $<)"

# Clean up generated files
clean:
	rm -f $(TARGETS)

.PHONY: all clean
