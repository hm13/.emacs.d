;;;Enable TeX-fold-mode
(add-hook 'LaTeX-mode-hook (lambda ()
                              (TeX-fold-mode 1)))


;;;KeyBindings
(add-hook 'LaTeX-mode-hook
          '(lambda ()
             (local-set-key (kbd "C-o h") 'TeX-fold-buffer)
             (local-set-key (kbd "C-o s") 'TeX-fold-clearout-buffer)
             (local-set-key (kbd "C-o C-h") 'TeX-fold-paragraph)
             (local-set-key (kbd "C-o C-s") 'TeX-fold-clearout-paragraph)
             (local-set-key (kbd "C-c C-c") 'comment-region)
             (local-set-key (kbd "C-c C-u") 'uncomment-region)	     
             )
          )



(provide 'latex-hook)
