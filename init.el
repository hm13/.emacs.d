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
			 (define-key ruby-mode-base-map "\C-m" 'newline-and-indent)
			 (set-default-coding-systems 'utf-8)
;			 (setq ruby-deep-indent-paren-style t)
			 ))

;;;c++�������s�ƃC���f���g�ݒ�
(add-hook 'c++-mode-hook
          '(lambda ()
             (c-set-style "linux")	;gnu, k&r, bsd, stroustrup, whitesmith, ellemtel, linux, cc-mode, python etc...
			 (setq c-basic-offset 3) ;�C���f���g��
			 (setq tab-width c-basic-offset)
			 (setq indent-tabs-mode t) ;�C���f���g�̓^�u��
			 ))

;;;c�������s+�C���f���g
(add-hook 'c-mode-common-hook
		  '(lambda ()
		     (c-set-style "linux")
		; �Z���e���X�̏I���ł��� ';' ����͂�����A�������s+�C���f���g
		     (c-toggle-auto-hungry-state 1)
			 (setq c-basic-offset 4) ;�C���f���g��
			 (setq tab-width c-basic-offset)
			 (setq indent-tabs-mode t) ;�C���f���g�̓^�u��
			 ; RET �L�[�Ŏ������s+�C���f���g
			 (define-key c-mode-base-map "\C-m" 'newline-and-indent)
			 ))