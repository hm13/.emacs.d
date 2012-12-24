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

;;;C-c c��compile�R�}���h
(define-key global-map [(C c) (c)] 'compile)

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
(global-set-key "\M-d"
		(lambda ()
		  (interactive)
		  (find-file "~/.emacs.d/mydocument.txt")
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

;;;�s�ԍ��\��
(load "~/.emacs.d/wb-line-number.el")
(wb-line-number-toggle)

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

;;;c�������s+�C���f���g
(add-hook 'c-mode-common-hook
	  '(lambda ()
	     (c-set-style "linux")
	     ;; �Z���e���X�̏I���ł��� ';' ����͂�����A�������s+�C���f���g
	     (setq c-basic-offset 4) ;�C���f���g��
	     (setq tab-width c-basic-offset)
	     (setq indent-tabs-mode t) ;�C���f���g�̓^�u��
	     ;; RET �L�[�Ŏ������s+�C���f���g
	     (define-key c-mode-base-map "\C-m" 'newline-and-indent)
	     (unless (file-exists-p "Makefile")
	       (set (make-local-variable 'compile-command)
		    ;; $(CC) -c -o $@ $(CPPFLAGS) $(CFLAGS) $<
		    (let ((file (file-name-nondirectory buffer-file-name)))
                      (format "%s -o %s.out %s %s %s"; (format "%s -c -o %s.o %s %s %s" ;;default
		      	      (or (getenv "CC") "gcc") 
		      	      (file-name-sans-extension file)
		      	      (or (getenv "CPPFLAGS") "-DDEBUG=9")
		      	      (or (getenv "CFLAGS") "-ansi -pedantic -Wall -g")
			      file))))
	     ))
