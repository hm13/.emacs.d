;;;Add load path
(setq load-path
      (append
       (list
	(expand-file-name "~/.emacs.d/auto-install/")
	)
       load-path))

;;;Config of open-junk-file.el
(require 'open-junk-file)
;;Open junk file by typing C-x C-z
(global-set-key (kbd "C-x C-z") 'open-junk-file)

;;;Config of lispxmp.el
(require 'lispxmp)
;;Write note by typing C-x C-d under the emacs-lisp-mode
(define-key emacs-lisp-mode-map (kbd "C-c C-d") 'lispxmp)

;; ;;;Config of paredit.el
;; (require 'paredit)
;; (add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)
;; (add-hook 'lisp-interaction-mode-hook 'enable-paredit-mode)
;; (add-hook 'lisp-mode-hook 'enable-paredit-mode)
;; (add-hook 'ielm-mode-hook 'enable-paredit-mode)

;; ;;;Config of auto-async-byte-compile.el
;; (require 'auto-async-byte-compile)
;; ;;Regex of file which will be disabled this elisp
;; (setq auto-async-byte-compile-exclude-files-regexp "/junk/")
;; (add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)
;; (add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
;; (add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
;; (add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)
;; (setq eldoc-idle-delay 0.2);Display immediately
;; (setq eldoc-minor-mode-string "");Don't show "ElDoc" in mode line

;;Highlight counterpart of the parenthesis
(show-paren-mode 1)
;;Indent when start a new line
(global-set-key "\C-m" 'newline-and-indent)
;;Assign find-function
(find-function-setup-keys)


;; ;;;Config of auto-install.el
;; (add-to-list 'load-path "~/.emacs.d/auto-install/")
;; (require 'auto-install)
;; (auto-install-update-emacswiki-package-name t)
;; (auto-install-compatibility-setup)
;; (setq ediff-window-setup-function 'ediff-setup-windows-plain)


;;;Don't divide window when type C-x C-b
(global-set-key [(C x) (C b)] 'buffer-menu)

;;;C-c cでcompileコマンド
(define-key global-map [(C c) (c)] 'compile)

;;;モードライン設定
(line-number-mode t)
(column-number-mode t)

;;;右端で折り返す
(setq turncate-lines t)

;;;カーソルの行を固定して画面スクロール
(setq SC_LINE_NUM 1)
(global-set-key "\M-p"
		(lambda ()
		  (interactive)
		  (scroll-down SC_LINE_NUM)
		  (forward-line (* -1 SC_LINE_NUM))
		  ))
(global-set-key "\M-n"
		(lambda ()
		  (interactive)
		  (scroll-up SC_LINE_NUM)
		  (forward-line SC_LINE_NUM)
		  ))

;;;オレオレEmacsドキュメントを開く
(global-set-key "\M-d"
		(lambda ()
		  (interactive)
		  (find-file "~/.emacs.d/mydocument.txt")
		  ))

;;;カレントウィンドウの拡大（M-h:垂直方向 M-w:水平方向）
(global-set-key "\M-h" 'enlarge-window)
(global-set-key "\M-w" 'enlarge-window-horizontally)

;;;Clear the current buffer, leaving one prompt at the top.
(defun eshell/cls ()
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)))

;;;Ctrl + t でウィンドウ移動
(define-key global-map "\C-t" 'other-window)

;;;行番号表示
(load "~/.emacs.d/wb-line-number.el")
(wb-line-number-toggle)

;;;スクロール行数を2行に
(setq scroll-step 1)

;;;スタートページを表示しない
(setq inhibit-startup-message t)

;;;ビープ音をフラッシュにする
(setq visible-bell t)

;;; メニューバーを非表示
; M-x menu-bar-mode で表示非表示を切り替えられる
(menu-bar-mode 0)

;;;バックアップファイルを作らない
(setq make-backup-files nil)

;;;C-hをバックスペースにする
(global-set-key "\C-h" 'delete-backward-char)

;;ミニバッファの色を変更
(set-face-foreground 'minibuffer-prompt "white")
(set-face-background 'minibuffer-prompt "black")

;;;コメントの色を変更
(set-face-foreground 'font-lock-comment-face "MediumSeaGreen")



;;;Ruby自動改行とインデント設定
(add-hook 'ruby-mode-hook
	  '(lambda()
	     (local-set-key "\C-m" 'newline-and-indent)
	     (set-default-coding-systems 'utf-8)
	     ;(setq ruby-deep-indent-paren-style t)
	     ))

;;;c++自動改行とインデント設定
(add-hook 'c++-mode-hook
          '(lambda ()
	   ;gnu, k&r, bsd, stroustrup, whitesmith, ellemtel, linux, cc-mode, python etc...
             (c-set-style "linux")
	     (setq c-basic-offset 3) ;インデント幅
	     (setq tab-width c-basic-offset)
	     (setq indent-tabs-mode t) ;インデントはタブで
	     ))

;;;c自動改行+インデント
(add-hook 'c-mode-common-hook
	  '(lambda ()
	     (c-set-style "linux")
	; センテンスの終了である ';' を入力したら、自動改行+インデント
	     (setq c-basic-offset 4) ;インデント幅
	     (setq tab-width c-basic-offset)
	     (setq indent-tabs-mode t) ;インデントはタブで
					; RET キーで自動改行+インデント
	     (define-key c-mode-base-map "\C-m" 'newline-and-indent)
	     ))
