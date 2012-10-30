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
			 (define-key ruby-mode-base-map "\C-m" 'newline-and-indent)
			 (set-default-coding-systems 'utf-8)
;			 (setq ruby-deep-indent-paren-style t)
			 ))

;;;c++自動改行とインデント設定
(add-hook 'c++-mode-hook
          '(lambda ()
             (c-set-style "linux")	;gnu, k&r, bsd, stroustrup, whitesmith, ellemtel, linux, cc-mode, python etc...
			 (setq c-basic-offset 3) ;インデント幅
			 (setq tab-width c-basic-offset)
			 (setq indent-tabs-mode t) ;インデントはタブで
			 ))

;;;c自動改行+インデント
(add-hook 'c-mode-common-hook
		  '(lambda ()
		     (c-set-style "linux")
		; センテンスの終了である ';' を入力したら、自動改行+インデント
		     (c-toggle-auto-hungry-state 1)
			 (setq c-basic-offset 4) ;インデント幅
			 (setq tab-width c-basic-offset)
			 (setq indent-tabs-mode t) ;インデントはタブで
			 ; RET キーで自動改行+インデント
			 (define-key c-mode-base-map "\C-m" 'newline-and-indent)
			 ))