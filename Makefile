REVEAL = node_modules/reveal-md/bin/cli.js

CONFS = style.css
RFLAGS = --css style.css --highlight-theme obsidian

default: slides.pdf

slides.pdf: slides.md $(CONFS)
	$(REVEAL) $(RFLAGS) --print $@ $<

rendered: slides.md $(CONFS)
	$(REVEAL) $(RFLAGS) --static $@ $<

serve: slides.md $(CONFS)
	$(REVEAL) $(RFLAGS) -w $<

clean:
	rm -f rendered

.PHONY: default serve clean

