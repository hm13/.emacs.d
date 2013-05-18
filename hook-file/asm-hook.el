;;;
(add-hook 'asm-mode-hook
	  '(lambda ()
	     (local-set-key "\C-m" 'newline)
	     ))
(provide 'asm-hook)
