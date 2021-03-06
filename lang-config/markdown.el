(custom-set-faces
 '(markdown-header-face-1 ((t (:inherit outline-2 markdown-header-face))))
 '(markdown-header-face-2 ((t (:inherit outline-5 markdown-header-face))))
 '(markdown-header-face-3 ((t (:inherit outline-3 markdown-header-face))))
 '(markdown-header-face-4 ((t (:inherit outline-1 markdown-header-face))))
 '(markdown-header-face-5 ((t (:inherit outline-4 markdown-header-face))))
 '(markdown-header-face-6 ((t (:inherit outline-6 markdown-header-face)))))

;;If .md file is opened, load markdown-mode
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(add-hook 'markdown-mode-hook
          '(lambda()
	     (define-key markdown-mode-map [(C i)] 'markdown-cycle)
	     (hide-sublevels 1)
             ))

(provide 'markdown-config)
