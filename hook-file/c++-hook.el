(add-hook 'c++-mode-hook
	  '(lambda ()
	     (hs-minor-mode 1)
	     (setq tab-width 4)
	     (setq indent-tabs-mode t)
	     (c-set-style "BSD")
	     (setq c-basic-offset 4)
	     (define-key c-mode-base-map "\C-i" 'hs-toggle-hiding)
	     (define-key c-mode-base-map [(C x) (C t)] 'indent-for-tab-command)
	     ;; RET キーで自動改行+インデント
	     (define-key c++-mode-map "\C-m" 'newline-and-indent)
	     ;; C-c cでコンパイルコマンド
	     (define-key c++-mode-map [(C o) (C o)] 'compile)
	     ;;Makefileがなかった時のコンパイルコマンド
	     (unless (file-exists-p "Makefile")
	       (set (make-local-variable 'compile-command)
		    ;; $(CC) -c -o $@ $(CPPFLAGS) $(CFLAGS) $<
		    (let ((file (file-name-nondirectory buffer-file-name)))
                      (format "%s -o %s.out %s %s %s" ;(format "%s -c -o %s.o %s %s %s" ;default
		      	      (or (getenv "CC") "g++") 
		      	      (file-name-sans-extension file)
		      	      (or (getenv "CPPFLAGS") "");c preprocessor
		      	      (or (getenv "CFLAGS") "-Wall -g -std=c++11")
			      file
			      ))))
	     ))
(provide 'c++-hook)
