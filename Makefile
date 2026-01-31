# Variables
PANDOC = pandoc
REVEALJS_DIR = reveal.js
OUTPUT_DIR = .
CUSTOM_CSS = metropolis.css

# Find all markdown files in the current directory
# All presentation filenames are YYYY-MM-DD-title.md
SOURCES = $(wildcard 20*-??-??-*.md)
# Define output names (change .md to .html)
TARGETS = $(SOURCES:.md=.html)

# Default target
all: $(TARGETS)


%.html: %.md
	$(PANDOC) $< -t revealjs -s -o $@ \
	-V revealjs-url=$(REVEALJS_DIR) \
	-V theme=white \
	-c $(CUSTOM_CSS) \
	--mathjax \
	--highlight-style pygments \
	--metadata title="$(basename $<)"

# Clean up generated files
clean:
	rm -f $(TARGETS)

.PHONY: all clean
