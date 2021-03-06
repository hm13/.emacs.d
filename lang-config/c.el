(add-hook 'c-mode-hook
	  '(lambda ()
	     (hs-minor-mode 1)
	     (define-key c-mode-base-map "\C-i" 'hs-toggle-hiding)
	     (define-key c-mode-base-map [(C x) (t)] 'indent-for-tab-command)
	     (define-key c-mode-base-map [(C c) (C c)] 'comment-or-uncomment-region)
	     (setq comment-style 'multi-line)
	     (c-set-style "linux")
	     (setq c-basic-offset 3) ;depth of indentation
	     (setq tab-width c-basic-offset)
	     (setq indent-tabs-mode nil) ; use spaces as indent
	     (define-key c-mode-base-map "\C-m" 'newline-and-indent)
	     (define-key c-mode-base-map (kbd "M-j") 'ace-jump-mode)
	     (define-key c-mode-map [(C o) (C o)] 'compile)
	     (unless (file-exists-p "Makefile")
	       (set (make-local-variable 'compile-command)
		    ;; $(CC) -c -o $@ $(CPPFLAGS) $(CFLAGS) $<
		    (let ((file (file-name-nondirectory buffer-file-name)))
                      (format "%s -o %s.out %s %s %s" ;(format "%s -c -o %s.o %s %s %s" ;default
		      	      (or (getenv "CC") "gcc") 
		      	      (file-name-sans-extension file)
		      	      (or (getenv "CPPFLAGS") "");c preprocessor
		      	      (or (getenv "CFLAGS") "-Wall -g")
			      file
			      ))))
	     ))
(provide 'c-config)
