MSCORE := "mscore3"

MSCX_FILES = $(shell find . -name "*.mscx")
MSCZ_FILES = $(shell find . -name "*.mscz")
JOB_FILES = $(shell find . -name "*.json")

PDFS = $(MSCX_FILES:.mscx=.pdf) $(MSCZ_FILES:.mscz=.pdf)
MP3S = $(MSCX_FILES:.mscx=.mp3) $(MSCZ_FILES:.mscz=.mp3)
JOB_OUTS = $(JOB_FILES:.json=.json.o)

.PHONY: all
all: $(PDFS) $(MP3S) $(JOB_OUTS)
	echo $^   

%.pdf: %.mscx
	$(MSCORE) -o $@ $<

%.mp3: %.mscx
	$(MSCORE) -o $@ $<

%.pdf: %.mscz
	$(MSCORE) -o $@ $<

%.mp3: %.mscz
	$(MSCORE) -o $@ $<

.SECONDARY:%.json
%.json.o: %.json
	cd $(dir $(abspath $<)) && $(MSCORE) -j $(notdir $<) 
	touch $@

.PHONY: clean
clean:
	rm -r $(PDFS) $(MP3S) $(JOB_OUTS)