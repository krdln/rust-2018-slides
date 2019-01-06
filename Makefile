default: slides.pdf

# Dear Make, why can't you just join strings?
EMPTY =
SPACE = $(EMPTY) $(EMPTY)
COMMA = ,
comma-separated = $(subst $(SPACE),$(COMMA),$(1))

REVEAL = node_modules/reveal-md/bin/cli.js

CONFS = style.css
STATIC_DIRS = alfa-slab pics
STATIC_FILES = $(shell find $(STATIC_DIRS) -type f)
RFLAGS = --css style.css --highlight-theme obsidian

slides.pdf: slides.md $(CONFS)
	$(REVEAL) $(RFLAGS) --print $@ $<

rendered: slides.md $(CONFS) $(STATIC_FILES)
	$(REVEAL) $(RFLAGS) --static $@ --static-dirs $(call comma-separated,$(STATIC_DIRS)) $<

serve: slides.md $(CONFS)
	$(REVEAL) $(RFLAGS) -w $<

clean:
	rm -f rendered

disable-embedding:
	sed 's|\(markdown = markdown.replace(imgMarkdown, `!\[$${imgTitle\}]($${dataUri})`);\)|// \1|' \
		-i node_modules/reveal-md/lib/static.js

.PHONY: default serve clean disable-embedding

