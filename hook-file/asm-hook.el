;;;
(add-hook 'asm-mode-hook
	  '(lambda ()
	     (define-key asm-mode "\C-m" 'newline)
	     ))
(provide 'asm-hook)
