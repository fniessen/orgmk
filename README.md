- [Overview](#sec-1)
  - [Description](#sec-1-1)
  - [Objectives](#sec-1-2)
  - [Quotations](#sec-1-3)
  - [Requirements](#sec-1-4)
    - [Emacs 24](#sec-1-4-1)
    - [Org 8](#sec-1-4-2)
    - [LaTeX (PDF)](#sec-1-4-3)
- [Usage](#sec-2)
  - [Standalone scripts](#sec-2-1)
  - [Makefile wrapper](#sec-2-2)
- [Options](#sec-3)
  - [Standalone scripts](#sec-3-1)
  - [Makefile wrapper](#sec-3-2)
- [Files](#sec-4)
- [Examples](#sec-5)
  - [Update all documents](#sec-5-1)
  - [Update specific types of documents](#sec-5-2)
  - [Update specific document](#sec-5-3)
- [Installation](#sec-6)
  - [New install](#sec-6-1)
  - [Makefile for installation](#sec-6-2)
- [Standalone scripts](#sec-7)
  - [Orgmk-init](#sec-7-1)
    - [Functions](#sec-7-1-1)
    - [Runtime](#sec-7-1-2)
  - [org2html](#sec-7-2)
  - [org2latex](#sec-7-3)
  - [org2pdf](#sec-7-4)
  - [org2beamerpdf](#sec-7-5)
  - [org2odt](#sec-7-6)
  - [org2txt](#sec-7-7)
  - [org2gfm](#sec-7-8)
  - [Orgmk-update-src-check-diff](#sec-7-9)
    - [Functions](#sec-7-9-1)
    - [Runtime](#sec-7-9-2)
  - [org-tangle](#sec-7-10)
- [Orgmk](#sec-8)
  - [Orgmk.mk](#sec-8-1)
    - [Some system-dependent stuff](#sec-8-1-1)
      - [Default shell](#sec-8-1-1-1)
      - [Exportation scripts](#sec-8-1-1-2)
      - [Viewing stuff](#sec-8-1-1-3)
      - [Color output](#sec-8-1-1-4)
    - [Basic configuration](#sec-8-1-2)
      - [Org Sources](#sec-8-1-2-1)
      - [HTML Targets](#sec-8-1-2-2)
      - [PDF Targets](#sec-8-1-2-3)
      - [Debugging](#sec-8-1-2-4)
      - [Commands](#sec-8-1-2-5)
    - [All](#sec-8-1-3)
    - [Help](#sec-8-1-4)
    - [HTML](#sec-8-1-5)
    - [PDF](#sec-8-1-6)
    - [Clean](#sec-8-1-7)
    - [Orgmk init file](#sec-8-1-8)
    - [Footer](#sec-8-1-9)
  - [Makefile wrapper](#sec-8-2)
- [Orgmk configuration file](#sec-9)
  - [Common](#sec-9-1)
    - [Library Search](#sec-9-1-1)
    - [Feedback](#sec-9-1-2)
    - [Auto Save](#sec-9-1-3)
    - [Initialization for MS Windows](#sec-9-1-4)
    - [Shell](#sec-9-1-5)
    - [Installation of version 8 or later](#sec-9-1-6)
    - [Activation](#sec-9-1-7)
    - [Language Environment](#sec-9-1-8)
    - [Clock table](#sec-9-1-9)
    - [Markup](#sec-9-1-10)
    - [Export options](#sec-9-1-11)
    - [Org-Babel](#sec-9-1-12)
    - [Library of Babel](#sec-9-1-13)
  - [HTML export](#sec-9-2)
  - [PDF LaTeX export](#sec-9-3)
  - [Extra customization files](#sec-9-4)
- [Sample parameters](#sec-10)
  - [Custom LaTeX classes](#sec-10-1)
- [Contributing](#sec-11)
  - [Issues](#sec-11-1)
  - [Patches](#sec-11-2)
  - [Donations](#sec-11-3)
- [License](#sec-12)
- [Standard disclaimer](#sec-13)


<a href="http://opensource.org/licenses/GPL-3.0">
  <img src="http://img.shields.io/:license-gpl-blue.svg" alt=":license-gpl-blue.svg" />
</a>

<a href="https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=VCVAS6KPDQ4JC&lc=BE&item_number=orgmk&currency_code=EUR&bn=PP%2dDonationsBF%3abtn_donate_LG%2egif%3aNonHosted">
  <img src="https://www.paypalobjects.com/en_US/i/btn/btn_donate_LG.gif" alt="btn_donate_LG.gif" />
</a>

# Overview<a id="sec-1" name="sec-1"></a>

## Description<a id="sec-1-1" name="sec-1-1"></a>

Orgmk is a suite of Bash scripts for **automating the conversion of Org mode documents to different formats** (such as HTML or PDF) from the command line.

<script src="http://platform.twitter.com/widgets.js"></script>
<a href="https://twitter.com/share" class="twitter-share-button" data-via="f_niessen">Tweet</a>

The scripts run on both Unix and Microsoft Windows (with Cygwin).

## Objectives<a id="sec-1-2" name="sec-1-2"></a>

The first goal is to **be more productive**, by running the export only when the source Org files are updated.

The second goal is to **share some common Emacs and Org configuration inside your** **team**, separately of what you have in your personal Emacs configuration file.

Finally, the third goal is also to **offload compilation into an external batch Emacs process**, allowing you to go on editing or working while exporting the documents.

## Quotations<a id="sec-1-3" name="sec-1-3"></a>

"If one has been trying to bulk convert many quickly changing org-documents, [one] will appreciate the power and flexibility of this tool." &#x2013; *z27*

"Orgmk is a wonderful tool, and, as far as I know, still unique." &#x2013; *Priyadarshan*

## Requirements<a id="sec-1-4" name="sec-1-4"></a>



### Emacs 24<a id="sec-1-4-1" name="sec-1-4-1"></a>

Emacs version 24 (for the `package` facility) must be in your `PATH`.

### Org 8<a id="sec-1-4-2" name="sec-1-4-2"></a>

Org mode version 8 (or later) is required.

If such a version is not bundled with your Emacs, Org 8 will be automatically installed &#x2013; if you accept it! &#x2013; through ELPA.

### LaTeX (PDF)<a id="sec-1-4-3" name="sec-1-4-3"></a>

A working LaTeX installation is required for exporting to PDF. If it is not yet installed on your system, install [TeX Live](http://www.tug.org/texlive/) (for example).

# Usage<a id="sec-2" name="sec-2"></a>

Org files can have the extension `.org` or `.txt`.

## Standalone scripts<a id="sec-2-1" name="sec-2-1"></a>

-   For "weaving" files (producing the formatted documentation files):
    
    ```shell
    org2html [OPTION] FILE
    org2latex [OPTION] FILE
    org2pdf [OPTION] FILE
    org2beamerpdf [OPTION] FILE
    org2odt [OPTION] FILE
    org2txt [OPTION] FILE
    ```

-   For "tangling" files:
    
    ```shell
    org-tangle FILE
    ```

## Makefile wrapper<a id="sec-2-2" name="sec-2-2"></a>

```shell
orgmk [OPTION]
orgmk [OPTION] [html | pdf]
orgmk [OPTION] [FILE]
```

Currently, `orgmk` does not tangle Org files.

# Options<a id="sec-3" name="sec-3"></a>

## Standalone scripts<a id="sec-3-1" name="sec-3-1"></a>

-   **`-h`, `--help`:** Print usage information and exit.

-   **`-y`:** Authorize the update of the source file (update of dynamic blocks and re-computation of tables) without confirmation.
    
    Before the conversion, the standalone scripts will try to **update all dynamic blocks and recompute all tables** in the source Org file, a **potentially destructive operation** for which the programs require confirmation: in case the source file gets updated, you will be queried to overwrite the source file with the updated version of the file &#x2013; that's because the environment variable `UPDATE_SRC` defaults to `query`.
    
    To avoid the question, you can also set that variable to `yes` or `no` in a personal configuration file, `~/.orgmk-rc`.
    
    Note that, by design, the command line argument `-y` is passed to every `org2<BACKEND>` script called from `orgmk`, so that `orgmk` doesn't wait for answers.

-   **`--body-only`:** Export only body (for HTML and LaTeX).

## Makefile wrapper<a id="sec-3-2" name="sec-3-2"></a>

-   **`-h`, `--help`:** Print usage information and exit.

-   **`-r`, `--recursive`:** Export all Org files **under each directory, recursively**.
    
    It just calls `orgmk.mk` with the argument `ALLSUBDIRS=yes`.
    
    By default, `orgmk` exports all Org files (which need it) in the current directory only.

# Files<a id="sec-4" name="sec-4"></a>

<file:///Users/scott/.orgmk-rc>

# Examples<a id="sec-5" name="sec-5"></a>

## Update all documents<a id="sec-5-1" name="sec-5-1"></a>

Regenerate HTML and/or PDF files for Org files that have been modified.

```shell
orgmk
```

## Update specific types of documents<a id="sec-5-2" name="sec-5-2"></a>

Regenerate HTML only for the Org files that have been changed.

```shell
orgmk html
```

## Update specific document<a id="sec-5-3" name="sec-5-3"></a>

Regenerate (or create for the first time) the file `thesis.pdf` from the Org file `thesis.org` or `thesis.txt`. **Don't require confirmation for updating the source file.**

```shell
orgmk thesis.pdf
```

Regenerate (or create for the first time) the file `thesis.pdf` from the Org file `thesis.org`. Require confirmation for updating the source file.

```shell
org2pdf thesis.org
```

# Installation<a id="sec-6" name="sec-6"></a>

The installation process consists of creating symbolic links from the standard **final directories** on your machine to the `orgmk` executables.

## New install<a id="sec-6-1" name="sec-6-1"></a>


1.  **Extract** the latest version of `orgmk`.
    
    ```shell
    git clone git@github.com:fniessen/orgmk.git
    ```

2.  Create configuration files which record where `orgmk` has been extracted on your host machine.
    
    ```shell
    make
    ```

3.  By default, the `orgmk` executable and the standalone scripts (`org2html`, `org2pdf`, etc.) are installed to the `/usr/local/bin` so that all users are able to run them.
    
    If you want to **change the destination directory**, create a `Make.params` file with the target directory. For example:
    
    ```makefile
    BIN_DIR=~/bin
    ```
    
    If needed, add that directory to your `PATH`.
    
    **Install** `orgmk` (executable and standalone scripts that you run) to the `BIN_DIR` location by typing:
    
    ```shell
    make install
    ```

At this point, everything should be ready for use.

## Makefile for installation<a id="sec-6-2" name="sec-6-2"></a>


```makefile
### -*- Makefile -*- definition file for Orgmk

# To install `orgmk', type `make' and then `make install'.

PWD=$(shell pwd)

BIN_DIR=/usr/local/bin

-include Make.params

ORGMK_ROOT=$(PWD)
ORGMK_EL=$(ORGMK_ROOT)/site-lisp/orgmk.el

# WARNING: ORGMK_EL must contain the correct path to the
# `orgmk.el' file according to the Emacs version used (Windows,
# Cygwin or Linux path)
EMACS_SYSTEM_TYPE=$(shell emacs -batch --eval "(message \"%s\" system-type)" 2>&1)
ifeq ($(EMACS_SYSTEM_TYPE),windows-nt)
    ORGMK_EL:="$(shell cygpath --mixed $(ORGMK_EL))"
endif

ORGMK_INIT=orgmk-init
ORGMK_SYSTEM_CONFIG=orgmk.conf
ORGMK_UPDATE=orgmk-update-src
ORGMK_UPDATE_CHECK_DIFF=orgmk-update-src-check-diff
ORG2HTML=org2html
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
install:                                # Create symlinks to Orgmk scripts
        @echo "Creating symlinks..."
        ln -f -s $(PWD)/bin/$(ORGMK_INIT)              $(BIN_DIR)/$(ORGMK_INIT)
        ln -f -s $(PWD)/bin/$(ORGMK_SYSTEM_CONFIG)     $(BIN_DIR)/$(ORGMK_SYSTEM_CONFIG)
        ln -f -s $(PWD)/bin/$(ORGMK_UPDATE)            $(BIN_DIR)/$(ORGMK_UPDATE)
        ln -f -s $(PWD)/bin/$(ORGMK_UPDATE_CHECK_DIFF) $(BIN_DIR)/$(ORGMK_UPDATE_CHECK_DIFF)
        ln -f -s $(PWD)/bin/$(ORG2HTML)                $(BIN_DIR)/$(ORG2HTML)
        ln -f -s $(PWD)/bin/$(ORG2LATEX)               $(BIN_DIR)/$(ORG2LATEX)
        ln -f -s $(PWD)/bin/$(ORG2PDF)                 $(BIN_DIR)/$(ORG2PDF)
        ln -f -s $(PWD)/bin/$(ORG2BEAMERPDF)           $(BIN_DIR)/$(ORG2BEAMERPDF)
        ln -f -s $(PWD)/bin/$(ORG2ODT)                 $(BIN_DIR)/$(ORG2ODT)
        ln -f -s $(PWD)/bin/$(ORG2TXT)                 $(BIN_DIR)/$(ORG2TXT)
        ln -f -s $(PWD)/bin/$(ORGTANGLE)               $(BIN_DIR)/$(ORGTANGLE)
        ln -f -s $(PWD)/bin/$(ORGMK_MAKE_SETUP)        $(BIN_DIR)/$(ORGMK_MAKE_SETUP)
        ln -f -s $(PWD)/bin/$(ORGMK_MAKE_RUN)          $(BIN_DIR)/$(ORGMK_MAKE_RUN)

### Makefile ends here
```

# Standalone scripts<a id="sec-7" name="sec-7"></a>



## Orgmk-init<a id="sec-7-1" name="sec-7-1"></a>


The `orgmk-init` script contains the common part used to setup Emacs and Org in order to export to HTML, PDF, etc.

### Functions<a id="sec-7-1-1" name="sec-7-1-1"></a>

```shell
Usage ()
{
    cat << EOF 1>&2
Usage: $(basename $0) [OPTION] FILE
Convert FILE to another format.

  -h, --help     display this help and exit
  -y             authorize update of the source file without confirmation
  --body-only    export only body (for HTML and LaTeX exports)

Report $(basename $0) bugs to fni@missioncriticalit.com
EOF
    exit 1
}
```

```shell
die () {
    printf "$(basename $0): $@\n" > /dev/stderr
    exit 2 # an error occurred
}
```

```shell
CleanUp ()
{
    # restore backed up target file if it hasn't been produced
    if [ ! -z $FILE_TARGET ]; then
        if [ -r $FILE_TARGET.orig ]; then
            if [ ! -r $FILE_TARGET ]; then
                printf "Recovering OLD file $FILE_TARGET...\n"
                mv $FILE_TARGET.orig $FILE_TARGET
            else
                rm $FILE_TARGET.orig
            fi
        fi
    fi

    # display log file, if present
    if [ ! -z $FILE_LOG ]; then
        if [ -r $FILE_LOG ]; then
            grep -e "^!.*" -A 3 -B 1 $FILE_LOG
        fi
    fi

    # remove the temporary copy of the source Org file
    if [ ! -z $FILE_SRC_UPDT ]; then
        rm -f $FILE_SRC_UPDT
    fi
}
```

### Runtime<a id="sec-7-1-2" name="sec-7-1-2"></a>

```emacs-lisp
(format-time-string "%Y%m%d.%H%M")
```

```shell
    cat << EOF
This is $(basename $0), version: 20160323.2056.
EOF
```

```shell
# perform housekeeping on program exit or a variety of signals
# (EXIT, HUP, INT, QUIT, TERM)
trap CleanUp 0 1 2 3 15
```

```shell
# load the system-wide config file (definition of `ORGMK_EL')
. orgmk.conf

if [ "$ORGMK_EL" = "" ]; then
    printf "ORGMK_EL variable not defined, please check your setup!\n"
    exit 2
fi

# source the user config file (default for `UPDATE_SRC', etc.)
ORGMK_USER_CONF=$HOME/.orgmk-rc
if [ -r $ORGMK_USER_CONF ]; then
    . $ORGMK_USER_CONF
fi

export UPDATE_SRC

# set a default value
export BODY_ONLY="no"

while true; do
    case "$1" in
        -y ) UPDATE_SRC="yes"; shift ;;
        --body-only ) BODY_ONLY="yes"; shift ;;
        -h | --help ) Usage ;;
        * ) break ;;
    esac
done
# now do something with $@
```

```shell
if [ $# -ne 1 ]; then
    Usage
fi

FILE_SRC_ORIG=$1
if [ ! -r "$FILE_SRC_ORIG" ]; then
    die "Cannot read file $FILE_SRC_ORIG"
fi

FILE_SRC_UPDT="${FILE_SRC_ORIG%.*}.orgmk" # replace extension
# The temporary file only differ by its extension (`.orgmk'), so that the
# exported file will be named <orig file name>.<backend ext>.
```

```shell
FILE_LOG="${FILE_SRC_ORIG%.*}.log"
rm -f $FILE_LOG
```

If the PDF file isn't produced (for example, because of an *undefined control sequence*), there is no PDF file anymore; hence, `orgmk` would ignore the source file in future calls, and the PDF file (now, missing&#x2026;) would completely disappear from the user attention.

To avoid that, we must make a backup of the target file before the export, and put it back if there is no target file produced.

```shell
FILE_TARGET="${FILE_SRC_ORIG%.*}.$TARGET_EXT"

# back up previous version of target file
if [ -r $FILE_TARGET ]; then
    mv $FILE_TARGET $FILE_TARGET.orig
fi
```

Note that, like with the `patch` command, the original file is saved with the `.orig` extension.

```shell
EMACS=emacs

WHICH_EMACS=$(which $EMACS)
EMACS_FLAGS="--eval \"(progn (message \\\"Launching $WHICH_EMACS...\\\") (message \\\"Emacs %s (%s)\\\" emacs-version system-type))\""
EMACS_BATCH="emacs --batch -Q $EMACS_FLAGS"
ORG_FLAGS=""
ORGMK="$EMACS_BATCH $ORG_FLAGS --eval \"(message \\\"Loading ${ORGMK_EL}...\\\")\" -l $ORGMK_EL"
ORGMK_UPDATE_FLAGS="-f org-update-all-dblocks -f org-table-iterate-buffer-tables --eval \"(write-file \\\"${FILE_SRC_UPDT##*/}\\\")\"" # base name
```

<div class="note">
**Batch option** Font Lock mode is disabled by default in batch mode. That generates errors with some Java code blocks. Hence, one workaround, in that case, is to call Emacs without batch mode (and, then, to add `-f kill-emacs`, or simply `--kill`, at the end of the command line).

</div>

## org2html<a id="sec-7-2" name="sec-7-2"></a>


The `org2html` script converts an Org file to HTML.

```shell
TARGET_EXT=html
. orgmk-init

case $BODY_ONLY in
    "yes")
        eval $ORGMK $FILE_SRC_ORIG $ORGMK_UPDATE_FLAGS -f org-html-export-body-only-to-html \
            || die "Exported file wasn't produced"
        ;;
    "no")
        eval $ORGMK $FILE_SRC_ORIG $ORGMK_UPDATE_FLAGS -f org-html-export-to-html \
            || die "Exported file wasn't produced"
esac

orgmk-update-src-check-diff "$FILE_SRC_ORIG" "$FILE_SRC_UPDT"
```

## org2latex<a id="sec-7-3" name="sec-7-3"></a>


The `org2latex` script converts an Org file to LaTeX.

```shell
TARGET_EXT=tex
. orgmk-init

case $BODY_ONLY in
    "yes")
        eval $ORGMK $FILE_SRC_ORIG $ORGMK_UPDATE_FLAGS -f org-latex-export-body-only-to-latex \
            || die "Exported file wasn't produced"
        ;;
    "no")
        eval $ORGMK $FILE_SRC_ORIG $ORGMK_UPDATE_FLAGS -f org-latex-export-to-latex \
            || die "Exported file wasn't produced"
esac

orgmk-update-src-check-diff "$FILE_SRC_ORIG" "$FILE_SRC_UPDT"
```

## org2pdf<a id="sec-7-4" name="sec-7-4"></a>


The `org2pdf` script converts an Org file to PDF.

<div class="note">
It tries to detect whether the target is a standard LaTeX document or a Beamer presentation by searching for the string `#+BEAMER_THEME:` inside the Org source.

</div>

```shell
TARGET_EXT=pdf
. orgmk-init

if grep -E "^#\+BEAMER_THEME: " $FILE_SRC_ORIG > /dev/null; then
    eval $ORGMK $FILE_SRC_ORIG $ORGMK_UPDATE_FLAGS -f org-beamer-export-to-latex \
        || die "Exported file wasn't produced"
else
    eval $ORGMK $FILE_SRC_ORIG $ORGMK_UPDATE_FLAGS -f org-latex-export-to-latex \
        || die "Exported file wasn't produced"
fi
orgmk-update-src-check-diff "$FILE_SRC_ORIG" "$FILE_SRC_UPDT"
```

## org2beamerpdf<a id="sec-7-5" name="sec-7-5"></a>


The `org2beamerpdf` script converts an Org file to a Beamer presentation (PDF).

```shell
TARGET_EXT=pdf
. orgmk-init

eval $ORGMK $FILE_SRC_ORIG $ORGMK_UPDATE_FLAGS -f org-beamer-export-to-pdf \
    || die "Exported file wasn't produced"
orgmk-update-src-check-diff "$FILE_SRC_ORIG" "$FILE_SRC_UPDT"
```

## org2odt<a id="sec-7-6" name="sec-7-6"></a>


The `org2odt` script converts an Org file to ODT.

```shell
TARGET_EXT=odt
. orgmk-init

eval $ORGMK $FILE_SRC_ORIG $ORGMK_UPDATE_FLAGS -f org-odt-export-to-odt \
    || die "Exported file wasn't produced"
orgmk-update-src-check-diff "$FILE_SRC_ORIG" "$FILE_SRC_UPDT"
```

## org2txt<a id="sec-7-7" name="sec-7-7"></a>


The `org2txt` script converts an Org file to text.

```shell
TARGET_EXT=txt
. orgmk-init

eval $ORGMK $FILE_SRC_ORIG $ORGMK_UPDATE_FLAGS -f org-ascii-export-to-ascii \
    || die "Exported file wasn't produced"
orgmk-update-src-check-diff "$FILE_SRC_ORIG" "$FILE_SRC_UPDT"
```

## org2gfm<a id="sec-7-8" name="sec-7-8"></a>


The `org2gfm` script converts an Org file to Github Flavored Markdown.

```shell
TARGET_EXT=md
. orgmk-init

eval $ORGMK $FILE_SRC_ORIG $ORGMK_UPDATE_FLAGS -f org-gfm-export-to-markdown \
    || die "Exported file wasn't produced"
orgmk-update-src-check-diff "$FILE_SRC_ORIG" "$FILE_SRC_UPDT"
```

## Orgmk-update-src-check-diff<a id="sec-7-9" name="sec-7-9"></a>


Check whether dynamic blocks and tables have been updated, and (if yes) propose to overwrite the source Org file.

### Functions<a id="sec-7-9-1" name="sec-7-9-1"></a>

```shell
ask () {
    while true; do
        if [ "${2:-}" = "Y" ]; then
            prompt="Y/n"
            default=Y
        elif [ "${2:-}" = "N" ]; then
            prompt="y/N"
            default=N
        else
            prompt="y/n"
            default=
        fi

        # ask the question (without the need to press RET)
        printf "$1 ($prompt): "
        read -n 1 -r REPLY
        printf "\n" # just a final linefeed

        # default?
        if [ -z "$REPLY" ]; then
            REPLY=$default
        fi

        # check if the reply is valid
        case "$REPLY" in
            y*|Y*) return 0 ;;
            n*|N*) return 1 ;;
        esac
    done
}
```

### Runtime<a id="sec-7-9-2" name="sec-7-9-2"></a>

```shell
FILE_SRC_ORIG=$1
FILE_SRC_UPDT=$2

# set a default value
: ${UPDATE_SRC:="query"}

if [ ! -r "$FILE_SRC_UPDT" ]; then
    printf "Cannot read file $FILE_SRC_UPDT\n"
else
    if diff -q "$FILE_SRC_ORIG" "$FILE_SRC_UPDT" > /dev/null; then
        rm "$FILE_SRC_UPDT"
    else
        if [[ "$UPDATE_SRC" = "query" ]]; then
            ask "Update source file?" && UPDATE_SRC="yes" || UPDATE_SRC="no"
        fi

        if [[ "$UPDATE_SRC" = "yes" ]]; then
            mv "$FILE_SRC_UPDT" "$FILE_SRC_ORIG"
            printf "${C_INFO}Dynamic blocks and tables in \`$FILE_SRC_ORIG' successfully updated${C_RESET}\n"
        else
            printf "Nothing gets updated...\n"
        fi
    fi
fi
```

In order to avoid "file changed on disk" messages (and be forced to revert open buffers) when nothing changed, we save the file with another name, and diff it with the original file. If there is no change, the new file is dropped.

<div class="note">
The time stamps in "Clock summary at &#x2026;" will be different, each time dynamic blocks are updated (if not done during the same minute). In that case, `diff` will always "succeed".

</div>

## org-tangle<a id="sec-7-10" name="sec-7-10"></a>


The `org-tangle` tangles an Org file.

```shell
TARGET_EXT=
. orgmk-init

eval $ORGMK $FILE_SRC_ORIG $ORGMK_UPDATE_FLAGS -f org-babel-tangle \
    || die "File wasn't tangled"
```

# Orgmk<a id="sec-8" name="sec-8"></a>

## Orgmk.mk<a id="sec-8-1" name="sec-8-1"></a>


Here is the "ultimate" Makefile to **automate the generation of HTML or PDF** versions from your Org mode files.

It is designed to solve tedious tasks nicely, such as updating:

-   [X] table of contents,
-   [X] cross-references,
-   [ ] index,
-   [ ] list of figures,
-   [ ] BibTeX references,
-   [X] Org dynamic blocks,
-   [X] tables with formulas, and
-   [ ] extracting (tangle) code blocks.

-   TODO Test whether Orgmk works with symbolic links

    Does their modification time change to reflect the latest modification of the source?

-   END

### Some system-dependent stuff<a id="sec-8-1-1" name="sec-8-1-1"></a>

```makefile
### -*- Makefile -*- definition file for Orgmk
```

#### Default shell<a id="sec-8-1-1-1" name="sec-8-1-1-1"></a>

```makefile
SHELL = /bin/sh
```

#### Exportation scripts<a id="sec-8-1-1-2" name="sec-8-1-1-2"></a>

By default, the `orgmk.mk` will overwrite the Org source file if it has changed after dblocks update and tables re-computation.

```makefile
ORG2_FLAGS=-y

ORG2HTML=org2html $(ORG2_FLAGS)
ORG2PDF=org2pdf $(ORG2_FLAGS)
```

#### Viewing stuff<a id="sec-8-1-1-3" name="sec-8-1-1-3"></a>

```makefile
VIEW_HTML ?= firefox
VIEW_PDF ?= xpdf
```

#### Color output<a id="sec-8-1-1-4" name="sec-8-1-1-4"></a>

```makefile
ifdef NO_COLOR
    tput =
else
    tput = $(shell $(TPUT) $1)
endif

black   := $(call tput,setaf 0)
red     := $(call tput,setaf 1)
green   := $(call tput,setaf 2)
yellow  := $(call tput,setaf 3)
blue    := $(call tput,setaf 4)
magenta := $(call tput,setaf 5)
cyan    := $(call tput,setaf 6)
white   := $(call tput,setaf 7)
bold    := $(call tput,bold)
uline   := $(call tput,smul)
reset   := $(call tput,sgr0)
```

```makefile
C_INFO="\\e[32m"
C_WARNING="\\e[35m"
C_SUCCESS="\\e[1\;32m"
C_FAILURE="\\e[1\;31m"
C_RESET="\\e[0m"
```

### Basic configuration<a id="sec-8-1-2" name="sec-8-1-2"></a>

#### Org Sources<a id="sec-8-1-2-1" name="sec-8-1-2-1"></a>

Discover and process all Org files in the current directory (or in the current subtree).

```makefile
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
```

-   TODO Add Org<sub>DIRS</sub> defaulting to .

    Use Org<sub>DIRS</sub> with foreach (?) in the following lists

-   END

-   TODO Fix problem of Orgfile with .org/.txt extension

    If an Org file exists with the 2 file extensions `.txt` and `.org` (same base name), then we get messages such as:
    
    Makefile:102: warning: overriding recipe for target \`plot.html' Makefile:89: warning: ignoring old recipe for target \`plot.html'

-   END

#### HTML Targets<a id="sec-8-1-2-2" name="sec-8-1-2-2"></a>

List of HTML files which can be generated:

```makefile
HTML_FILES_FROM_ORG = $(patsubst %.org,%.html,$(ORG_FILES))
HTML_FILES_FROM_TXT = $(patsubst %.txt,%.html,$(TXT_FILES))
```

List of HTML files to be re-generated (if they have an Org counterpart):

```makefile
CUR_HTML_FILES := $(HTML_FILES)
```

#### PDF Targets<a id="sec-8-1-2-3" name="sec-8-1-2-3"></a>

List of PDF files which can be generated:

```makefile
PDF_FILES_FROM_ORG = $(patsubst %.org,%.pdf,$(ORG_FILES))
PDF_FILES_FROM_TXT = $(patsubst %.txt,%.pdf,$(TXT_FILES))
```

List of PDF files to be re-generated (if they have an Org counterpart):

```makefile
CUR_PDF_FILES := $(PDF_FILES)
```

#### Debugging<a id="sec-8-1-2-4" name="sec-8-1-2-4"></a>

```makefile
# turn command echo'ing back on with VERBOSE=1
ifndef VERBOSE
    QUIET := @
endif
```

**Everything** is echo'ed, even `$(shell ...)` invocations:

```makefile
# turn on shell debugging with SHELL_DEBUG=1
ifdef SHELL_DEBUG
    SHELL += -x
endif
```

#### Commands<a id="sec-8-1-2-5" name="sec-8-1-2-5"></a>

Define variables for each command used in targets:

```makefile
PRINTF=$(QUIET)printf
EGREP=$(QUIET)egrep
LS=$(QUIET)ls
```

### All<a id="sec-8-1-3" name="sec-8-1-3"></a>

```makefile
.PHONY: all
all: html pdf                           # Regenerate all HTML and PDF files
```

### Help<a id="sec-8-1-4" name="sec-8-1-4"></a>

Get help.

```makefile
.PHONY: help
help:                                   # Display callable targets
        $(PRINTF) "Usage: orgmk [OPTION]... [TARGET]...\n" > /dev/stderr
        $(PRINTF) "\n"
        $(PRINTF) "What target do you want?\n" > /dev/stderr
        $(EGREP) "^[^   #A-Z]+:" [Mm]akefile \
        | sed 's/:[^#]*//' | sed 's/^/\n/g' | sed 's/# /\n\t/g' > /dev/stderr
```

### HTML<a id="sec-8-1-5" name="sec-8-1-5"></a>

`orgmk html` will regenerate all HTML files which **currently exist** in the directory, and whose source Org file has changed.

```makefile
.PHONY: html
html: $(CUR_HTML_FILES)                 # Regenerate all HTML documents from Org
```

To create an HTML file for the **first time**, type `orgmk file.html`. It will ignore other Org files in the directory.

```makefile
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
```

The recipe to **convert Org to HTML** is:

```makefile
$(PRINTF) "$(C_INFO)Exporting \`$(CURDIR)/$<' to HTML...$(C_RESET)\n"
$(ORG2HTML) $<
$(LS) -l -t $< $@ | head -n 1 | grep -E "\.html" > /dev/null \
|| { printf "$(C_FAILURE)\`$(CURDIR)/$@' is NOT up to date$(C_RESET)\n"; exit 1; }
$(PRINTF) "$(C_SUCCESS)\`$(CURDIR)/$@' successfully generated$(C_RESET)\n"
```

What about `org-export-as-html-batch` and `org-export-as-html-and-open`?

```makefile
view-html:                              # Generate the HTML files, then show the result
```

### PDF<a id="sec-8-1-6" name="sec-8-1-6"></a>

`orgmk pdf` will find out which PDF files have to be regenerated, and will regenerate all of them.

```makefile
.PHONY: pdf
pdf: $(CUR_PDF_FILES)                   # Regenerate all PDF documents from Org
```

Type `orgmk file.pdf` to generate only the specified PDF file.

```makefile
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
```

<div class="note">
The drawback of updating the dblocks inside the the recipes for HTML and PDF means that, if we have a file that's **converted to both file formats**, the update will be done twice (so, once at least for nothing): once for HTML, then once again for PDF. Though, this case is quite uncommon.

</div>

The recipe to **convert Org to PDF** is:

```makefile
$(PRINTF) "$(C_INFO)Exporting \`$(CURDIR)/$<' to PDF...$(C_RESET)\n"
$(ORG2PDF) $<
$(LS) -l -t $< $@ | head -n 1 | grep -E "\.pdf" > /dev/null \
|| { printf "$(C_FAILURE)\`$(CURDIR)/$@' is NOT up to date$(C_RESET)\n"; exit 1; }
$(PRINTF) "$(C_SUCCESS)\`$(CURDIR)/$@' successfully generated$(C_RESET)\n"
```

-   TODO Export as LaTeX?

    Maybe the export should be done to TeX, and then call (the minimum number of times) PDFLaTeX from the `orgmk.mk`? Check out if this is as robust as using Org to build the PDF&#x2026; (which goes on, even with some errors occurring)

-   END

    I've observed cases where `orgmk pdf` was reporting that "Exporting to PDF&#x2026;done", but I was left with the previous PDF file. Hence, every call to `orgmk` tried to redo them&#x2026;
    
    On deleting the PDF, and relaunching `orgmk` on that file, I had an error during the "Processing LaTeX file".
    
    Workaround, to be sure that an old PDF does not stay in the way, remove the PDF output upon startup of the recipe. The TeX file was well updated. Hence, no need to delete it at startup&#x2026;
    
    **Problem**: when the PDF file is not generated anymore, it won't be remade with `orgmk pdf`. We then have to explicitly `orgmk file.pdf`.

### Clean<a id="sec-8-1-7" name="sec-8-1-7"></a>

```makefile
.PHONY: clean
clean:                                  # Delete all temporary files created by Org export
```

### TODO Orgmk init file<a id="sec-8-1-8" name="sec-8-1-8"></a>

Here, we should **make a symlink**, if it does not exist yet. Would then be used just once&#x2026;

The only thing that's not done yet automatically is: tangling this file!

### Footer<a id="sec-8-1-9" name="sec-8-1-9"></a>

```makefile
### orgmk.mk ends here
```

## Makefile wrapper<a id="sec-8-2" name="sec-8-2"></a>


As you could want to run the batch scripts from a (development) directory where there is already a `Makefile`, you must install the `Makefile` under a different name: `orgmk.mk`.

An addition is to create a symbolic link to the `orgmk.mk` into the directory of your Org files just for the duration of the script execution (on-the-fly install). The links can be safely removed after `make` has been run.

```shell
Usage ()
{
    cat << EOF 1>&2
Usage: $(basename $0) [OPTION] FILE
Export Org source files whenever they are updated.

  -h, --help          display this help and exit
  -r, --recursive     export all Org files under each directory, recursively

Report $(basename $0) bugs to fni@missioncriticalit.com
EOF
    exit 1
}
```

```shell
CleanUp ()
{
    # remove the Makefile
    rm orgmk.mk
}

# perform housekeeping on program exit or a variety of signals
# (EXIT, HUP, INT, QUIT, TERM)
trap CleanUp 0 1 2 3 15
```

```shell
# install the Makefile where you are
orgmk-stow-orgmk.mk

FLAGS=""
while true; do
    case "$1" in
        -h | --help ) Usage ;;
        -r | --recursive) FLAGS="ALLSUBDIRS=yes"; shift ;;
        * ) break ;;
    esac
done

make -f orgmk.mk $FLAGS $*
```

# Orgmk configuration file<a id="sec-9" name="sec-9"></a>


I use a setup file `orgmk.el` to hold minimal customization.

<div class="info">
In batch mode, [&#x2026;] Emacs functions that normally print a message in the echo area will print to either the standard output stream (`stdout`) or the standard error stream (`stderr`) instead. (To be precise, functions like `prin1`, `princ` and `print` print to `stdout`, while `message` and `error` print to `stderr`.)

</div>

## Common<a id="sec-9-1" name="sec-9-1"></a>

```emacs-lisp
;;; orgmk.el --- Emacs configuration file for `orgmk'

;;; Commentary:

;;; Code:
```

### Library Search<a id="sec-9-1-1" name="sec-9-1-1"></a>

Remember current directory.

```emacs-lisp
;; remember this directory
(defconst orgmk-el-directory
  (file-name-directory (or load-file-name (buffer-file-name)))
  "Directory path of Orgmk.")
```

### Feedback<a id="sec-9-1-2" name="sec-9-1-2"></a>

```emacs-lisp
;; ;; activate debugging
;; (setq debug-on-error t)

;; no limit when printing values
(setq eval-expression-print-length nil)
(setq eval-expression-print-level nil)
```

### Auto Save<a id="sec-9-1-3" name="sec-9-1-3"></a>

```emacs-lisp
;; don't make a backup of files
(setq backup-inhibited t)
```

### Initialization for MS Windows<a id="sec-9-1-4" name="sec-9-1-4"></a>

When running an native Microsoft Windows version of Emacs:

```emacs-lisp
;; ;; let Emacs recognize Cygwin paths (e.g. /usr/local/lib)
;; (add-to-list 'load-path "~/Downloads/emacs/site-lisp") ;; <- adjust
;; (when (eq system-type 'windows-nt)
;;   (when (try-require 'cygwin-mount)
;;     (cygwin-mount-activate)))
```

### Shell<a id="sec-9-1-5" name="sec-9-1-5"></a>

Fix the shell to use: the **default value of shell-file-name** (that is the program `/bin/bash`) is not found under Windows Emacs.

```emacs-lisp
;; shell
(message "Current value of `shell-file-name': %s" shell-file-name)
(unless (equal shell-file-name "bash")
  (setq shell-file-name "bash")
  (message "... changed to: %s" shell-file-name))
```

This is important when launching external tools, such as `PDFLaTeX` or `Latexmk`.

### Installation of version 8 or later<a id="sec-9-1-6" name="sec-9-1-6"></a>

Ensure that a recent version of Org mode is installed and loaded.

```emacs-lisp
(when (locate-library "package")
  (require 'package)
  (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
  (package-initialize)
  (unless package-archive-contents
    (package-refresh-contents)))
```

```emacs-lisp
(unless (locate-library "ox")           ; trick to detect the presence of Org 8
  (ding)
  (message "The versions 6 and 7 of Org mode are no longer supported")
  (message "Time to upgrade, don't you think?")
  (when (locate-library "package")
    (let ((pkg 'org))
      (if (yes-or-no-p (format "Install package `%s'? " pkg))
          (ignore-errors
            (package-install pkg))
        (setq debug-on-error nil)
        (error "Please upgrade to 8 or later")))))
```

```emacs-lisp
(when (locate-library "package")
  (unless (locate-library "htmlize")    ; for syntax highlighting in org2html
    (let ((pkg 'htmlize))
      (if (yes-or-no-p (format "Install package `%s'? " pkg))
          (ignore-errors
            (package-install pkg)))))
  (unless (locate-library "ox-gfm")     ; for exporting to GFM
    (let ((pkg 'ox-gfm))
      (if (yes-or-no-p (format "Install package `%s`? " pkg))
          (ignore-errors
            (package-install pkg))))))
```

```emacs-lisp
;; version info
(let ((org-install-dir (file-name-directory (locate-library "org-loaddefs")))
      (org-dir (file-name-directory (locate-library "org")))) ; org.(el|elc)
  (message "Org mode version %s (org @ %s)"
           (org-version)
           (if (string= org-dir org-install-dir)
               org-install-dir
             (concat "mixed installation! " org-install-dir " and " org-dir))))
```

### Activation<a id="sec-9-1-7" name="sec-9-1-7"></a>

```emacs-lisp
(require 'org)
(require 'org-clock)
(require 'ox)

(add-to-list 'auto-mode-alist '("\\.txt\\'" . org-mode))
```

### Language Environment<a id="sec-9-1-8" name="sec-9-1-8"></a>

```emacs-lisp
;; make sure that timestamps appear in English
(setq system-time-locale "C")           ; [default: nil]
```

### Clock table<a id="sec-9-1-9" name="sec-9-1-9"></a>

```emacs-lisp
;; format string used when creating CLOCKSUM lines and when generating a
;; time duration (avoid showing days)
(setq org-time-clocksum-format
      '(:hours "%d" :require-hours t :minutes ":%02d" :require-minutes t))

;; format string for the total time cells
(setq org-clock-total-time-cell-format "%s")

;; format string for the file time cells
(setq org-clock-file-time-cell-format "%s")
```

### Markup<a id="sec-9-1-10" name="sec-9-1-10"></a>

```emacs-lisp
;; hide the emphasis marker characters
(setq org-hide-emphasis-markers t)      ; impact on table alignment!
```

### Export options<a id="sec-9-1-11" name="sec-9-1-11"></a>

```emacs-lisp
;; don't insert a time stamp into the exported file
(setq org-export-time-stamp-file nil)

;; activate smart quotes during export (convert " to \og, \fg in French)
(setq org-export-with-smart-quotes t)   ; curly quotes in HTML

;; interpret "_" and "^" for export when braces are used
(setq org-export-with-sub-superscripts '{})

;; allow #+BIND to define local variable values for export
(setq org-export-allow-bind-keywords t)
```

### Org-Babel<a id="sec-9-1-12" name="sec-9-1-12"></a>

```emacs-lisp
;; configure Babel to support most languages
(add-to-list 'org-babel-load-languages '(R . t)) ; Requires R and ess-mode.
(add-to-list 'org-babel-load-languages '(awk . t))
(add-to-list 'org-babel-load-languages '(ditaa . t)) ; Sudo aptitude install openjdk-6-jre.
(add-to-list 'org-babel-load-languages '(dot . t))
(add-to-list 'org-babel-load-languages '(java . t))
(add-to-list 'org-babel-load-languages '(latex . t)) ; Shouldn't you use #+begin/end_latex blocks instead?
(add-to-list 'org-babel-load-languages '(ledger . t)) ; Requires ledger.
(add-to-list 'org-babel-load-languages '(makefile . t))
(add-to-list 'org-babel-load-languages '(org . t))
(if (locate-library "ob-shell")         ; ob-sh renamed on 2013-12-13
    (add-to-list 'org-babel-load-languages '(shell . t))
  (add-to-list 'org-babel-load-languages '(sh . t)))
(add-to-list 'org-babel-load-languages '(sql . t))

(org-babel-do-load-languages            ; loads org, gnus-sum, etc...
 'org-babel-load-languages org-babel-load-languages)

;; accented characters on graphics
(setq org-babel-R-command
      (concat org-babel-R-command " --encoding=UTF-8"))

;; don't require confirmation before evaluating code blocks
(setq org-confirm-babel-evaluate nil)
```

### Library of Babel<a id="sec-9-1-13" name="sec-9-1-13"></a>

```emacs-lisp
;; load up Babel libraries
(let ((lob-file (concat (file-name-directory (locate-library "org"))
                        "../doc/library-of-babel.org")))
  (when (file-exists-p lob-file)
    (org-babel-lob-ingest lob-file)))
```

## HTML export<a id="sec-9-2" name="sec-9-2"></a>

-   TODO Understand the hidden xx used for spacing levels in column views

    Depending on interactive vs batch export to HTML, we still have the above difference in the resulting HTML file.

-   END

    ```emacs-lisp
    (when (require 'ox-html)
    
      ;; export the CSS selectors only, when formatting code snippets
      (setq org-html-htmlize-output-type 'css)
    
      ;; ;; XML encoding
      ;; (setq org-html-xml-declaration
      ;;       '(("html" . "<!-- <xml version=\"1.0\" encoding=\"%s\"> -->")))
    
      ;; coding system for HTML export
      (setq org-html-coding-system 'utf-8)
    
      ;; ;; format for the HTML postamble
      ;; (setq org-html-postamble
      ;;       "  <div id=\"footer\"><div id=\"copyright\">\n    Copyright &copy; %d %a\n  </div></div>")
    
      ;; don't include the JavaScript snippets in exported HTML files
      (setq org-html-head-include-scripts nil)
    
      ;; turn inclusion of the default CSS style off
      (setq org-html-head-include-default-style nil)
    
      (defun org-html-export-body-only-to-html ()
        "Export only code between between \"<body>\" and \"</body>\" tags to a HTML file."
        (interactive)
        (org-html-export-to-html nil nil nil t)))
    ```

## PDF LaTeX export<a id="sec-9-3" name="sec-9-3"></a>

-   TODO Since <span class="timestamp-wrapper"><span class="timestamp">[2012-10-26 Fri]</span></span>, the %b now means the real base name (no full part).

-   END

    ```emacs-lisp
    (when (require 'ox-latex)
    
      ;; ;; This is disturbing when calling `org2html'.
      ;; (when (executable-find "latexmk")
      ;;   (message "%s" (shell-command-to-string "latexmk --version")))
    
      (setq org-latex-pdf-process
            (if (eq system-type 'cygwin) ;; running a Cygwin version of Emacs
                ;; use Latexmk (if installed with LaTeX)
                (if (executable-find "latexmk")
                    '("latexmk -CF -pdf $(cygpath -m %f) && latexmk -c")
                  '("pdflatex -interaction=nonstopmode -output-directory=%o $(cygpath -m %f)"
                    "pdflatex -interaction=nonstopmode -output-directory=%o $(cygpath -m %f)"
                    "pdflatex -interaction=nonstopmode -output-directory=%o $(cygpath -m %f)"))
              (if (executable-find "latexmk")
                  '("latexmk -CF -pdf %f && latexmk -c")
                '("pdflatex -interaction=nonstopmode -output-directory=%o %f"
                  "pdflatex -interaction=nonstopmode -output-directory=%o %f"
                  "pdflatex -interaction=nonstopmode -output-directory=%o %f"))))
    
      (message "LaTeX command: %S" org-latex-pdf-process)
    
      ;; tell org to use `listings' (instead of `verbatim') for source code
      (setq org-latex-listings t)
    
      ;; default packages to be inserted in the header
      ;; include the `listings' package for fontified source code
      (add-to-list 'org-latex-packages-alist '("" "listings") t)
    
      ;; include the `xcolor' package for colored source code
      (add-to-list 'org-latex-packages-alist '("" "xcolor") t)
    
      ;; include the `babel' package for language-specific hyphenation and
      ;; typography
      (add-to-list 'org-latex-packages-alist '("english" "babel") t)
    
      ;; default position for LaTeX figures
      (setq org-latex-default-figure-position "!htbp")
    
      (defun org-latex-export-body-only-to-latex ()
        "Export only code between \"\begin{document}\" and \"\end{document}\" to a LaTeX file."
        (interactive)
        (org-latex-export-to-latex nil nil nil t)))
    ```

## Extra customization files<a id="sec-9-4" name="sec-9-4"></a>

To allow you to easily add extra settings to the above "standard" ones, you can create several files in the `lisp` directory. All of them will be loaded at the end of `orgmk`'s initialization.

```emacs-lisp
;; require all files from `lisp' directory
(dolist (file (directory-files
               (concat orgmk-el-directory "../lisp/") t ".+\\.elc?$"))
  (load-file file))
```

```emacs-lisp
;;; orgmk.el ends here
```

# Sample parameters<a id="sec-10" name="sec-10"></a>

## Custom LaTeX classes<a id="sec-10-1" name="sec-10-1"></a>


```emacs-lisp
;;; org-latex-classes.el --- Sample configuration file for LaTeX

;;; Commentary:

;;; Code:

(require 'ox-latex)

(add-to-list 'org-latex-classes
             '("koma-article"
               "\\documentclass{scrartcl}
               [NO-DEFAULT-PACKAGES]
               [EXTRA]"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

;;; org-latex-classes.el ends here
```

# Contributing<a id="sec-11" name="sec-11"></a>

## Issues<a id="sec-11-1" name="sec-11-1"></a>

Report issues and suggest features and improvements on the [GitHub issue tracker](https://github.com/fniessen/orgmk/issues/new).

## Patches<a id="sec-11-2" name="sec-11-2"></a>

I love contributions! Patches under any form are always welcome!

## Donations<a id="sec-11-3" name="sec-11-3"></a>

If you like the Orgmk project, you can show your appreciation and help support future development by making a [donation](https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=VCVAS6KPDQ4JC&lc=BE&item_number=orgmk&currency_code=EUR&bn=PP%2dDonationsBF%3abtn_donate_LG%2egif%3aNonHosted) through PayPal.

Regardless of the donations, Orgmk will always be free both as in beer and as in speech.

# License<a id="sec-12" name="sec-12"></a>

Copyright (C) 2011-2015 Fabrice Niessen

Author: Fabrice Niessen Keywords: org mode export automation

This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program. If not, see <http://www.gnu.org/licenses/>.

# Standard disclaimer<a id="sec-13" name="sec-13"></a>

I am furnishing this item "as is". I do **NOT** provide **ANY WARRANTY** of the item whatsoever, whether express, implied, or statutory, including, but not limited to, any warranty of **MERCHANTABILITY** or **FITNESS FOR A PARTICULAR PURPOSE** or any warranty that the contents of the item will be error-free.

In no respect shall I incur any liability for any damages, including, but limited to, direct, indirect, special, or consequential damages arising out of, resulting from, or any way connected to the use of the item, whether or not based upon warranty, contract, tort, or otherwise; whether or not injury was sustained by persons or property or otherwise; and whether or not loss was sustained from, or arose out of, the results of, the item, or any services that may be provided by me.

<a href="http://opensource.org/licenses/GPL-3.0">
  <img src="http://img.shields.io/:license-gpl-blue.svg" alt=":license-gpl-blue.svg" />
</a>

<a href="https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=VCVAS6KPDQ4JC&lc=BE&item_number=orgmk&currency_code=EUR&bn=PP%2dDonationsBF%3abtn_donate_LG%2egif%3aNonHosted">
  <img src="https://www.paypalobjects.com/en_US/i/btn/btn_donate_LG.gif" alt="btn_donate_LG.gif" />
</a>
