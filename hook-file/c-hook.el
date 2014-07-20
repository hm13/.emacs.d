;;;c自動改行+インデント
(add-hook 'c-mode-hook
	  '(lambda ()
	     (hs-minor-mode 1)
	     (define-key c-mode-base-map "\C-i" 'hs-toggle-hiding)
	     (define-key c-mode-base-map [(C x) (t)] 'indent-for-tab-command)
	     (define-key c-mode-base-map [(C c) (C c)] 'comment-or-uncomment-region)
	     (setq comment-style 'multi-line)
	     (c-set-style "linux")
	     (setq c-basic-offset 3) ;インデント幅
	     (setq tab-width c-basic-offset)
	     (setq indent-tabs-mode t) ;インデントはタブで
	     ;; RET キーで自動改行+インデント
	     (define-key c-mode-base-map "\C-m" 'newline-and-indent)
	     ;; C-c cでコンパイルコマンド
	     (define-key c-mode-map [(C o) (C o)] 'compile)
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
