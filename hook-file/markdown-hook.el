;;If .md file is opened, load markdown-mode
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))


(defun scroll-page-up ()
  (interactive)
  (scroll-down SC_LINE_NUM)
  (forward-line (* -1 SC_LINE_NUM))
  )

(defun scroll-page-down ()
  (interactive)
  (scroll-up SC_LINE_NUM)
  (forward-line SC_LINE_NUM)
  )

(add-hook 'markdown-mode-hook
	  '(lambda()
	     (define-key markdown-mode-map [(M p)] 'scroll-page-up)
	     (define-key markdown-mode-map [(M n)] 'scroll-page-down)
	     ))

(provide 'markdown-hook)
