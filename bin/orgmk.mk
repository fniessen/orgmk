### -*- Makefile -*- definition file for Orgmk

SHELL = /bin/sh

ORG2_FLAGS=-y

ORG2HTML=org2html $(ORG2_FLAGS)
ORG2PDF=org2pdf $(ORG2_FLAGS)

VIEW_HTML ?= firefox
VIEW_PDF ?= xpdf

C_INFO="\\e[32m"
C_WARNING="\\e[35m"
C_SUCCESS="\\e[1\;32m"
C_FAILURE="\\e[1\;31m"
C_RESET="\\e[0m"

ifeq ($(ALLSUBDIRS),yes)
    TXT_FILES=$(shell find . -name \*.txt)
    ORG_FILES=$(shell find . -name \*.org)
    HTML_FILES=$(shell find . -name \*.html)
    PDF_FILES=$(shell find . -name \*.pdf)
else
    TXT_FILES=$(shell find . -maxdepth 1 -name \*.txt)
    ORG_FILES=$(shell find . -maxdepth 1 -name \*.org)
    HTML_FILES=$(shell find . -maxdepth 1 -name \*.html)
    PDF_FILES=$(shell find . -maxdepth 1 -name \*.pdf)
endif

FILES_TO_TANGLE := $(join $(ORG_FILES), $(TXT_FILES))

HTML_FILES_FROM_ORG = $(patsubst %.org,%.html,$(ORG_FILES))
HTML_FILES_FROM_TXT = $(patsubst %.txt,%.html,$(TXT_FILES))

CUR_HTML_FILES := $(HTML_FILES)

PDF_FILES_FROM_ORG = $(patsubst %.org,%.pdf,$(ORG_FILES))
PDF_FILES_FROM_TXT = $(patsubst %.txt,%.pdf,$(TXT_FILES))

CUR_PDF_FILES := $(PDF_FILES)

# turn command echo'ing back on with VERBOSE=1
ifndef VERBOSE
    QUIET := @
endif

# turn on shell debugging with SHELL_DEBUG=1
ifdef SHELL_DEBUG
    SHELL += -x
endif

PRINTF=$(QUIET)printf
EGREP=$(QUIET)egrep
LS=$(QUIET)ls

.PHONY: all
all: html pdf                           # Regenerate all HTML and PDF files

.PHONY: help
help:                                   # Display callable targets
	$(PRINTF) "Usage: orgmk [OPTION]... [TARGET]...\n" > /dev/stderr
	$(PRINTF) "\n"
	$(PRINTF) "What target do you want?\n" > /dev/stderr
	$(EGREP) "^[^	#A-Z]+:" [Mm]akefile \
	| sed 's/:[^#]*//' | sed 's/^/\n/g' | sed 's/# /\n\t/g' > /dev/stderr

.PHONY: html
html: $(CUR_HTML_FILES)                 # Regenerate all HTML documents from Org

$(HTML_FILES_FROM_ORG): %.html: %.org   # Export an Org document to HTML
	$(PRINTF) "$(C_INFO)Exporting \`$(CURDIR)/$<' to HTML...$(C_RESET)\n"
	$(ORG2HTML) $<
	$(LS) -l -t $< $@ | head -n 1 | grep -E "\.html" > /dev/null \
	|| { printf "$(C_FAILURE)\`$(CURDIR)/$@' is NOT up to date$(C_RESET)\n"; exit 1; }
	$(PRINTF) "$(C_SUCCESS)\`$(CURDIR)/$@' successfully generated$(C_RESET)\n"

$(HTML_FILES_FROM_TXT): %.html: %.txt   # Export an Org document to HTML
	$(PRINTF) "$(C_INFO)Exporting \`$(CURDIR)/$<' to HTML...$(C_RESET)\n"
	$(ORG2HTML) $<
	$(LS) -l -t $< $@ | head -n 1 | grep -E "\.html" > /dev/null \
	|| { printf "$(C_FAILURE)\`$(CURDIR)/$@' is NOT up to date$(C_RESET)\n"; exit 1; }
	$(PRINTF) "$(C_SUCCESS)\`$(CURDIR)/$@' successfully generated$(C_RESET)\n"

view-html:                              # Generate the HTML files, then show the result

.PHONY: pdf
pdf: $(CUR_PDF_FILES)                   # Regenerate all PDF documents from Org

$(PDF_FILES_FROM_ORG): %.pdf: %.org     # Export an Org document to PDF
	$(PRINTF) "$(C_INFO)Exporting \`$(CURDIR)/$<' to PDF...$(C_RESET)\n"
	$(ORG2PDF) $<
	$(LS) -l -t $< $@ | head -n 1 | grep -E "\.pdf" > /dev/null \
	|| { printf "$(C_FAILURE)\`$(CURDIR)/$@' is NOT up to date$(C_RESET)\n"; exit 1; }
	$(PRINTF) "$(C_SUCCESS)\`$(CURDIR)/$@' successfully generated$(C_RESET)\n"

$(PDF_FILES_FROM_TXT): %.pdf: %.txt     # Export an Org document to PDF
	$(PRINTF) "$(C_INFO)Exporting \`$(CURDIR)/$<' to PDF...$(C_RESET)\n"
	$(ORG2PDF) $<
	$(LS) -l -t $< $@ | head -n 1 | grep -E "\.pdf" > /dev/null \
	|| { printf "$(C_FAILURE)\`$(CURDIR)/$@' is NOT up to date$(C_RESET)\n"; exit 1; }
	$(PRINTF) "$(C_SUCCESS)\`$(CURDIR)/$@' successfully generated$(C_RESET)\n"

.PHONY: clean
clean:                                  # Delete all temporary files created by Org export

### orgmk.mk ends here
