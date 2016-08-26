### -*- Makefile -*- definition file for Orgmk

# To install `orgmk', type `make' and then `make install'.

PWD=$(shell pwd)

BIN_DIR=/usr/local/bin

-include Make.params

ORGMK_ROOT=$(PWD)
ORGMK_EL=$(ORGMK_ROOT)/site-lisp/orgmk.el

# WARNING -- ORGMK_EL must contain the correct path to the `orgmk.el' file
# according to the Emacs version used (Windows, Cygwin or Linux path).
EMACS_SYSTEM_TYPE=$(shell emacs -batch --eval "(message \"%s\" system-type)" 2>&1)
ifeq ($(EMACS_SYSTEM_TYPE),windows-nt)
	ORGMK_EL:="$(shell cygpath --mixed $(ORGMK_EL))"
endif

ORGMK_INIT=orgmk-init
ORGMK_SYSTEM_CONFIG=orgmk.conf
ORGMK_UPDATE=orgmk-update-src
ORGMK_UPDATE_CHECK_DIFF=orgmk-update-src-check-diff
ORG2HTML=org2html
ORG2GFM=org2gfm
ORG2LATEX=org2latex
ORG2PDF=org2pdf
ORG2BEAMERPDF=org2beamerpdf
ORG2ODT=org2odt
ORG2TXT=org2txt
ORGTANGLE=org-tangle
ORGMK_MAKE_SETUP=orgmk-stow-orgmk.mk
ORGMK_MAKE_RUN=orgmk

## MAKE

# Ensure `all' is the default target
all: orgmk-system-config orgmk-stow-mk  # Create Orgmk system files

.PHONY: orgmk-system-config
orgmk-system-config:                    # Create file with location of `orgmk.el'
	@echo "Generating system-wide configuration file..."
	echo "ORGMK_EL=$(ORGMK_EL)" > bin/$(ORGMK_SYSTEM_CONFIG)
	@echo

.PHONY: orgmk-stow-mk
orgmk-stow-mk:                          # Create core file for `orgmk'
	@echo "Generating setup file..."
	echo "#!/bin/sh" > bin/$(ORGMK_MAKE_SETUP)
	echo "ln -f -s $(PWD)/bin/orgmk.mk orgmk.mk" >> bin/$(ORGMK_MAKE_SETUP)
	chmod u+x bin/$(ORGMK_MAKE_SETUP)
	@echo

## MAKE INSTALL

.PHONY: install
install: all                            # Create symlinks to Orgmk scripts
	@echo "Creating symlinks..."
	ln -f -s $(PWD)/bin/$(ORGMK_INIT)              $(BIN_DIR)/$(ORGMK_INIT)
	ln -f -s $(PWD)/bin/$(ORGMK_SYSTEM_CONFIG)     $(BIN_DIR)/$(ORGMK_SYSTEM_CONFIG)
	ln -f -s $(PWD)/bin/$(ORGMK_UPDATE)            $(BIN_DIR)/$(ORGMK_UPDATE)
	ln -f -s $(PWD)/bin/$(ORGMK_UPDATE_CHECK_DIFF) $(BIN_DIR)/$(ORGMK_UPDATE_CHECK_DIFF)
	ln -f -s $(PWD)/bin/$(ORG2HTML)                $(BIN_DIR)/$(ORG2HTML)
	ln -f -s $(PWD)/bin/$(ORG2GFM)                 $(BIN_DIR)/$(ORG2GFM)
	ln -f -s $(PWD)/bin/$(ORG2LATEX)               $(BIN_DIR)/$(ORG2LATEX)
	ln -f -s $(PWD)/bin/$(ORG2PDF)                 $(BIN_DIR)/$(ORG2PDF)
	ln -f -s $(PWD)/bin/$(ORG2BEAMERPDF)           $(BIN_DIR)/$(ORG2BEAMERPDF)
	ln -f -s $(PWD)/bin/$(ORG2ODT)                 $(BIN_DIR)/$(ORG2ODT)
	ln -f -s $(PWD)/bin/$(ORG2TXT)                 $(BIN_DIR)/$(ORG2TXT)
	ln -f -s $(PWD)/bin/$(ORGTANGLE)               $(BIN_DIR)/$(ORGTANGLE)
	ln -f -s $(PWD)/bin/$(ORGMK_MAKE_SETUP)        $(BIN_DIR)/$(ORGMK_MAKE_SETUP)
	ln -f -s $(PWD)/bin/$(ORGMK_MAKE_RUN)          $(BIN_DIR)/$(ORGMK_MAKE_RUN)

### Makefile ends here
