FILES = $(patsubst %.qmd,%.docx,$(wildcard *.qmd))
FILES += $(patsubst %.qmd,%.pdf,$(wildcard *.qmd))

LATEX_FORMAT = --pdf-engine=xelatex
FONT_OPTIONS = -V mainfont="Liberation Serif" -V monofont="Liberation Mono"

%.docx: %.qmd
	@pandoc $< -o $@

%.pdf: %.qmd
	@pandoc $< $(LATEX_FORMAT) $(FONT_OPTIONS) -o $@

all: $(FILES)
	@echo "All files generated: $(FILES)"

clean:
	@rm -f $(FILES)
	@echo "Cleaned generated files"

.PHONY: all clean
