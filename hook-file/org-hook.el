;;;KeyBindings
(add-hook 'org-mode-hook
          '(lambda ()
             (local-set-key (kbd "C-m") 'newline-and-indent)
             (local-set-key (kbd "C-c C-c") 'comment-region)
             (local-set-key (kbd "C-c C-u") 'uncomment-region)
             )
          )

;;;Enable color(only editting)
(setq org-src-fontify-natively t)

;;;Enable color(only editting)
(setq org-list-allow-alphabetical nil)

;;;Display entities as UTF-8 characters.(Toggle by C-c C-x \)
(setq org-pretty-entities t)

;;;Remove "Validate XHTML1.0..."
(setq org-export-html-validation-link nil)
(setq org-export-html-postamble nil)

;;;Org-mode config
(require 'org)
(set-face-foreground 'org-link "royal blue")
(set-face-foreground 'org-document-title "green")
(set-face-foreground 'org-document-info "sea green")
(set-face-foreground 'org-document-info-keyword "green")

;;;Toggle right side turncation
(setq org-startup-truncated nil)
(defun change-truncation()
  (interactive)
  (cond ((eq truncate-lines nil)
         (setq truncate-lines t))
        (t
         (setq truncate-lines nil))))


;;;Define and Add My Class
(require 'ox-latex)
(setq org-latex-default-class "my-class")
(add-to-list 'org-latex-classes
             '("my-class"
               "\\documentclass[11pt,a4paper,papersize]{ltjsarticle}
[NO-DEFAULT-PACKAGES]
\\usepackage{hyperref}
\\usepackage{graphicx}
\\usepackage{titlesec}
\\hypersetup{setpagesize=false,colorlinks=true}
\\usepackage[ipa]{luatexja-preset}
\\titlespacing\\section{0pt}{10pt plus 3pt minus 3pt}{0pt plus 2pt minus 2pt}
\\titlespacing\\subsection{0pt}{6pt plus 3pt minus 2pt}{0pt plus 2pt minus 2pt}
\\titlespacing\\subsubsection{0pt}{3pt plus 3pt minus 2pt}{0pt plus 2pt minus 2pt}
\\setlength{\\textwidth}{6.5in}
\\setlength{\\textheight}{9.2in}
\\setlength{\\oddsidemargin}{-0.4in}%左から1in基準での本文左端までの幅
\\setlength{\\topmargin}{-0.7in}%上から1in基準でのヘッダの上までの幅
\\setlength{\\headsep}{0in}%ヘッダー下から本文上までの幅"
("\\section{%s}" . "\\section*{%s}")
("\\subsection{%s}" . "\\subsection*{%s}")
("\\subsubsection{%s}" . "\\subsubsection*{%s}")
("\\paragraph{%s}" . "\\paragraph*{%s}")
("\\subparagraph{%s}" . "\\subparagraph*{%s}")
))

(setq org-latex-pdf-process
      '("lualatex %f bibtex handout lualatex %f" "lualatex %f" "xdotool key --window `xdotool search mupdf | head -1` --clearmodifiers r"
        ))

(setq org-file-apps
      '(("pdf" . "evince %s")))

(provide 'org-hook)
