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
(setq org-use-sub-superscripts nil)

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
               "\\documentclass[10pt,a4paper]{jarticle}
[NO-DEFAULT-PACKAGES]
\\usepackage{amsmath}
\\usepackage{hyperref}
\\usepackage{graphicx}
\\usepackage{titlesec}
\\usepackage{listings}
\\usepackage{color}
\\lstset{
  captionpos=b,
  caption=\\relax,
  frame=trBL,
  %frame=shadowbox,
  %rulesepcolor=\\color{blue},
  frameround=nnnn,
  showstringspaces=false,
  stringstyle={\\ttfamily \\color[rgb]{0.7,0.2,0}},
  commentstyle={\\itshape \\color[rgb]{0,0.5,0.5}},
  identifierstyle={\\ttfamily \\color[rgb]{0,0,0}},
  keywordstyle={\\ttfamily \\color[rgb]{0.05,0.4,0.05}},
  basicstyle={\\ttfamily \\footnotesize},
  backgroundcolor={\\color[rgb]{0.98,0.98,0.98}},
  breaklines=true,
  xleftmargin=20pt,
  xrightmargin=20pt,
  framerule=.1pt,
  columns=[l]{fullflexible},
  numbers=left,
  stepnumber=1,
  numberstyle={\\small \\color[rgb]{0.5,0.5,0.5}},
  numbersep=1em,
  language={c},
  lineskip=-2.7pt,
  literate = *{\\ }{\\ }1 %substitute {1 space} with {1 space}
}
\\titlespacing\\section{0pt}{15pt plus 3pt minus 3pt}{0pt plus 2pt minus 2pt}
\\titlespacing\\subsection{0pt}{10pt plus 3pt minus 2pt}{0pt plus 2pt minus 2pt}
\\titlespacing\\subsubsection{0pt}{5pt plus 3pt minus 2pt}{0pt plus 2pt minus 2pt}
\\setlength{\\textwidth}{6.1in}
\\setlength{\\textheight}{9.2in}
\\setlength{\\oddsidemargin}{-0.3in}%左から1in基準での本文左端までの幅
\\setlength{\\topmargin}{-0.7in}%上から1in基準でのヘッダの上までの幅
\\setlength{\\headsep}{0in}%ヘッダー下から本文上までの幅"
("\\section{%s}" . "\\section*{%s}")
("\\subsection{%s}" . "\\subsection*{%s}")
("\\subsubsection{%s}" . "\\subsubsection*{%s}")
("\\paragraph{%s}" . "\\paragraph*{%s}")
("\\subparagraph{%s}" . "\\subparagraph*{%s}")
))

;; for my-class
(setq org-latex-pdf-process
      '("platex %b && dvipdfm %b" "xdotool key --window `xdotool search mupdf | head -1` --clearmodifiers r"
        ))

(setq org-file-apps
      '(("pdf" . "mupdf %s")))

(provide 'org-config)
