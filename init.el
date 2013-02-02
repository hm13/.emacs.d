;;;Rebinding Eshell History
(add-hook 'eshell-mode-hook
	  '(lambda ()
	     (local-set-key (kbd "C-p") 'eshell-previous-matching-input-from-input)
	     (local-set-key (kbd "C-n") 'eshell-next-matching-input-from-input)
	     )
	  )

(require 'compile)

(defvar yel-compile-auto-close t
  "* If non-nil, a window is automatically closed after (\\[compile]).")

(defadvice compile (after compile-aftercheck activate compile)
  "Adds a function of windows auto-close."
  (let ((proc (get-buffer-process "*compilation*")))
    (if (and proc yel-compile-auto-close)
	(set-process-sentinel proc 'yel-compile-teardown))))

(defun yel-compile-teardown (proc status)
  "Closes window automatically, if compile succeed."
  (let ((ps (process-status proc)))
    (if (eq ps 'exit)
    	(if (eq 0 (process-exit-status proc))
    	    (progn
    	      ;;(delete-other-window)
    	      (message "----Compile Success! Running...----")
    	      (switch-to-buffer-other-window "*compilation*")
    	      ;;(kill-buffer "*compilation*)
    	      (eshell)
    	      (eshell-send-input)
    	      )
    	  (message "Compile Failer")))
    (if (eq ps 'signal)
	(message "Compile Abnormal and"))))

;;;open .h file in c++mode
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++mode))

(setq load-path
      (append
       (list
	(expand-file-name "~/.emacs.d/")
	(expand-file-name "~/.emacs.d/auto-install")
	(expand-file-name "~/.emacs.d/hook-file")
	)
       load-path))

  
;;;c-hook�̌l�ݒ�ǂݍ���
(require 'c-hook)

;;;c++-hook�̌l�ݒ�ǂݍ���
(require 'c++-hook)

;;;�s�ԍ��\��
(global-linum-mode t)
(setq linum-format "%3d|")

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

;;Highlight the counterpart of the parenthesis
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


;;;���[�h���C���ݒ�
(line-number-mode t)
(column-number-mode t)

;;;�E�[�Ő܂�Ԃ�
(setq turncate-lines t)

;;;�J�[�\���̍s���Œ肵�ĉ�ʃX�N���[��
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

;;;�I���I��Emacs�h�L�������g���J��
(global-set-key (kbd "M-d")
		(lambda ()
		  (interactive)
		  (find-file "~/.emacs.d/mydocument.txt")
		  ))

;;;init.el���J��
(global-set-key (kbd "M-s")
		(lambda ()
		  (interactive)
		  (find-file "~/.emacs.d/init.el")
		  ))

;;;�J�����g�E�B���h�E�̊g��iM-h:�������� M-w:���������j
(global-set-key "\M-h" 'enlarge-window)
(global-set-key "\M-w" 'enlarge-window-horizontally)

;;;Clear the current buffer, leaving one prompt at the top.
(defun eshell/cls ()
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)))

;;;Ctrl + t �ŃE�B���h�E�ړ�
(define-key global-map "\C-t" 'other-window)


;;;�X�N���[���s����2�s��
(setq scroll-step 1)

;;;�X�^�[�g�y�[�W��\�����Ȃ�
(setq inhibit-startup-message t)

;;;�r�[�v�����t���b�V���ɂ���
(setq visible-bell t)

;;; ���j���[�o�[���\��
; M-x menu-bar-mode �ŕ\����\����؂�ւ�����
(menu-bar-mode 0)

;;;�o�b�N�A�b�v�t�@�C�������Ȃ�
(setq make-backup-files nil)

;;;C-h���o�b�N�X�y�[�X�ɂ���
(global-set-key "\C-h" 'delete-backward-char)

;;�~�j�o�b�t�@�̐F��ύX
(set-face-foreground 'minibuffer-prompt "white")
(set-face-background 'minibuffer-prompt "black")

;;;�R�����g�̐F��ύX
(set-face-foreground 'font-lock-comment-face "MediumSeaGreen")


;;;Ruby�������s�ƃC���f���g�ݒ�
(add-hook 'ruby-mode-hook
	  '(lambda()
	     (local-set-key "\C-m" 'newline-and-indent)
	     (set-default-coding-systems 'utf-8)
	     ;(setq ruby-deep-indent-paren-style t)
	     ))

;;;c++�������s�ƃC���f���g�ݒ�
(add-hook 'c++-mode-hook
          '(lambda ()
	   ;gnu, k&r, bsd, stroustrup, whitesmith, ellemtel, linux, cc-mode, python etc...
             (c-set-style "linux")
	     (setq c-basic-offset 3) ;�C���f���g��
	     (setq tab-width c-basic-offset)
	     (setq indent-tabs-mode t) ;�C���f���g�̓^�u��
	     ))


