;;;Org-mode config
(require 'org)
(set-face-foreground 'org-link "royal blue")
(set-face-foreground 'org-document-info "sea green")

(setq turncate-lines t)

(unless (boundp 'org-export-latex-classes)
    (setq org-export-latex-classes nil))
(add-to-list 'org-export-latex-classes
	     '("article"
	       "\\documentclass{jarticle}
\\usepackage[dvipdfmx]{hyperref}
\\usepackage[dvipdfm]{graphicx}
\\usepackage{listings,jlisting}
[NO-DEFAULT-PACKAGES]
[NO-PACKAGES]
"
	       ("\\section{%s}" . "\\section*{%s}")))
(setq org-latex-to-pdf-process '("~/Util/genpdf.sh %s ~/Util/genpdf.sh %s"))
(eval-after-load "org"
    '(progn
       ;; Change .pdf association directly within the alist
       (setcdr (assoc "\\.pdf\\'" org-file-apps) "cygstart /cygdrive/${DRIVE}/Program/SumatraPDF-2.1.1/SumatraPDF.exe `cygpath -wa %s`")))
(add-hook 'org-mode-hook
	  '(lambda ()
	     (local-set-key (kbd "C-m") 'newline-and-indent)
	     )
	  )

(provide 'org-hook)
