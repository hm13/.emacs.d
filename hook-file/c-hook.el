;;;c自動改行+インデント
(add-hook 'c-mode-hook
	  '(lambda ()
	     (c-set-style "linux")
	     (setq c-basic-offset 4) ;インデント幅
	     (setq tab-width c-basic-offset)
	     (setq indent-tabs-mode t) ;インデントはタブで
	     ;; RET キーで自動改行+インデント
	     (define-key c-mode-base-map "\C-m" 'newline-and-indent)
	     ;; C-c cでコンパイルコマンド
	     (define-key c-mode-map [(C c) (c)] 'compile)
	     ;;Makefileがなかった時のコンパイルコマンド
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
(provide 'c-hook)
