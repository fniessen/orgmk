;;; orgmk.el --- Emacs configuration file for `orgmk'

;;; Commentary:

;;; Code:

;; remember this directory
(defconst orgmk-el-directory
  (file-name-directory (or load-file-name (buffer-file-name)))
  "Directory path of Orgmk.")

;; ;; activate debugging
;; (setq debug-on-error t)

;; no limit when printing values
(setq eval-expression-print-length nil)
(setq eval-expression-print-level nil)

;; don't make a backup of files
(setq backup-inhibited t)

;; ;; let Emacs recognize Cygwin paths (e.g. /usr/local/lib)
;; (add-to-list 'load-path "~/Downloads/emacs/site-lisp") ;; <- adjust
;; (when (eq system-type 'windows-nt)
;;   (when (try-require 'cygwin-mount)
;;     (cygwin-mount-activate)))

;; shell
(message "Current value of `shell-file-name': %s" shell-file-name)
(unless (equal shell-file-name "bash")
  (setq shell-file-name "bash")
  (message "... changed to: %s" shell-file-name))

(when (locate-library "package")
  (require 'package)
  (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
  (package-initialize))

(unless (locate-library "ox")           ; trick to detect the presence of Org 8
  (message "The versions 6 and 7 of Org mode are no longer supported")
  (when (locate-library "package")
    (let ((pkg 'org))
      (if (yes-or-no-p (format "Install package `%s'? " pkg))
          (ignore-errors
            (package-install pkg))
        (setq debug-on-error nil)
        (error "Please upgrade to 8 or later")))))

(when (locate-library "package")
  (unless (locate-library "htmlize")    ; for syntax highlighting in org2html
    (let ((pkg 'htmlize))
      (if (yes-or-no-p (format "Install package `%s'? " pkg))
          (ignore-errors
            (package-install pkg))))))

;; version info
(let ((org-install-dir (file-name-directory (locate-library "org-loaddefs")))
      (org-dir (file-name-directory (locate-library "org")))) ; org.(el|elc)
  (message "Org mode version %s (org @ %s)"
           (org-version)
           (if (string= org-dir org-install-dir)
               org-install-dir
             (concat "mixed installation! " org-install-dir " and " org-dir))))

(require 'org)
(require 'org-clock)
(require 'ox)
(require 'ob-R)

(add-to-list 'auto-mode-alist '("\\.txt\\'" . org-mode))

;; make sure that timestamps appear in English
(setq system-time-locale "C")           ; [default: nil]

;; format string used when creating CLOCKSUM lines and when generating a
;; time duration (avoid showing days)
(setq org-time-clocksum-format
      '(:hours "%d" :require-hours t :minutes ":%02d" :require-minutes t))

;; format string for the total time cells
(setq org-clock-total-time-cell-format "%s")

;; format string for the file time cells
(setq org-clock-file-time-cell-format "%s")

;; hide the emphasis marker characters
(setq org-hide-emphasis-markers t)      ; impact on table alignment!

;; don't insert a time stamp into the exported file
(setq org-export-time-stamp-file nil)

;; activate smart quotes during export (convert " to \og, \fg in French)
(setq org-export-with-smart-quotes t)   ; curly quotes in HTML

;; interpret "_" and "^" for export when braces are used
(setq org-export-with-sub-superscripts '{})

;; allow #+BIND to define local variable values for export
(setq org-export-allow-bind-keywords t)

;; configure Babel to support most languages
(if (locate-library "ob-shell")         ; ob-sh renamed on Dec 13th, 2013
    (org-babel-do-load-languages        ; loads org, gnus-sum, etc...
     'org-babel-load-languages
     '((R          . t)                 ; requires R and ess-mode
       (awk        . t)
       (ditaa      . t)                 ; sudo aptitude install openjdk-6-jre
       (dot        . t)
       (emacs-lisp . t)
       (java       . t)
       (latex      . t)                 ; shouldn't you use #+begin/end_latex blocks instead?
       (ledger     . t)                 ; requires ledger
       (org        . t)
       (shell      . t)
       (sql        . t)))
  ;; XXX (in the future) message saying "Upgrade to Org 8.3"
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((R          . t)
     (awk        . t)
     (ditaa      . t)
     (dot        . t)
     (emacs-lisp . t)
     (java       . t)
     (latex      . t)
     (ledger     . t)
     (org        . t)
     (sh         . t)
     (sql        . t))))

;; accented characters on graphics
(setq org-babel-R-command
      (concat org-babel-R-command " --encoding=UTF-8"))

;; don't require confirmation before evaluating code blocks
(setq org-confirm-babel-evaluate nil)

;; load up Babel libraries
(let ((lob-file (concat (file-name-directory (locate-library "org"))
                        "../doc/library-of-babel.org")))
  (when (file-exists-p lob-file)
    (org-babel-lob-ingest lob-file)))

(when (require 'ox-html)

  ;; export the CSS selectors only, when formatting code snippets
  (setq org-html-htmlize-output-type 'css)

  ;; XML encoding
  (setq org-html-xml-declaration
        '(("html" . "<!-- <xml version=\"1.0\" encoding=\"%s\"> -->")))

  ;; coding system for HTML export
  (setq org-html-coding-system 'utf-8)

  ;; format for the HTML postamble
  (setq org-html-postamble
        "  <div id=\"footer\"><div id=\"copyright\">\n    Copyright &copy; %d %a\n  </div></div>")

  ;; don't include the JavaScript snippets in exported HTML files
  (setq org-html-head-include-scripts nil)

  ;; turn inclusion of the default CSS style off
  (setq org-html-head-include-default-style nil)

  (defun org-html-export-body-only-to-html ()
    "Export only code between between \"<body>\" and \"</body>\" tags to a HTML file."
    (interactive)
    (org-html-export-to-html nil nil nil t)))

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

;; require all files from `lisp' directory
(dolist (file (directory-files
               (concat orgmk-el-directory "../lisp/") t ".+\\.elc?$"))
  (load-file file))

;;; orgmk.el ends here
