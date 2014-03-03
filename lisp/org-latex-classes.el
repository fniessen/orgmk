;;; org-latex-classes.el --- Sample configuration file for LaTeX

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
