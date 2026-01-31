# Variables
PANDOC = pandoc
REVEALJS_DIR = reveal.js
OUTPUT_DIR = .
CUSTOM_CSS = solarized-inter.css

# Find all markdown files in the current directory
# All presentation filenames are YYYY-MM-DD-title.md
SOURCES = $(wildcard 20*-??-??-*.md)
# Define output names (change .md to .html)
TARGETS = $(SOURCES:.md=.html)

# GitHub Pages URL (Update these!)
USER = gdv
REPO = slides
BASE_URL = https://$(USER).github.io/$(REPO)


# Default target
all: $(TARGETS)



%.html: %.md
	$(PANDOC) $< -t revealjs -s -o $@ \
	-V revealjs-url=$(REVEALJS_DIR) \
	-V theme=solarized \
	-c $(CUSTOM_CSS) \
	--highlight-style tango

update-readme:
	@echo "# Gianluca Della Vedova" > README.md
	@echo "Available slides:" >> README.md
	@echo "" >> README.md
	@for file in $(TARGETS); do \
		echo "* [ $${file%.html} ]($(BASE_URL)/$$file)" >> README.md; \
	done
	@echo "\n*Last updated: $$(date)*" >> README.md

# Clean up generated files
clean:
	rm -f $(TARGETS)

.PHONY: all clean update-readme
