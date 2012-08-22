help:
	@echo 'Usage:                                                                '
	@echo '   make install                     Copy script to /usr/local/bin     '
	@echo '                                                                      '

SCRIPTFILE = eps2png.sh

install:
	cp $(SCRIPTFILE) /usr/local/bin/$(SCRIPTFILE)

/usr/local/bin:
	mkdir -p /usr/local/bin

.PHONY: help install
