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
               "\\documentclass[12pt,a4paper,papersize]{ltjsarticle}
[NO-DEFAULT-PACKAGES]
\\usepackage{hyperref}
\\usepackage{graphicx}
\\hypersetup{setpagesize=false,colorlinks=true}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")
))

(setq org-latex-pdf-process
            '("lualatex %f" "lualatex %f" "xdotool key --window `xdotool search mupdf | head -1` --clearmodifiers r"
))

(setq org-file-apps
      '(("pdf" . "evince %s")))

(provide 'org-hook)
