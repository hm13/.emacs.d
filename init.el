;;;Load Path Config
(setq load-path
      (append
       (list
        (expand-file-name "~/.emacs.d/")
        (expand-file-name "~/.emacs.d/auto-install")
        (expand-file-name "~/.emacs.d/hook-file")
        (expand-file-name "~/.emacs.d/elpa/org-20130204")
        (expand-file-name "~/.emacs.d/site-lisp")
        (expand-file-name "~/.emacs.d/site-lisp/org/lisp")
        (expand-file-name "~/.emacs.d/site-lisp/powerline")
        (expand-file-name "~/.emacs.d/site-lisp/direx-el")
        )
       load-path))

(require 'direx)
(global-set-key (kbd "C-x C-d") 'direx:jump-to-directory)

(require 'auto-complete)
(global-auto-complete-mode t)
(define-key ac-complete-mode-map "\C-n" 'ac-next)
(define-key ac-complete-mode-map "\C-p" 'ac-previous)

;;;Include my hook
(require 'c-hook)
(require 'c++-hook)
(require 'org-hook)
(require 'asm-hook)
(require 'ruby-hook)


;;;Color Config
;;Mode Line
(set-face-background 'mode-line-inactive "gray10")
(set-face-foreground 'mode-line-inactive "gray70")
;;Mini Buffer
(set-face-foreground 'minibuffer-prompt "color-46") ;M-x
;;Source
(set-face-foreground 'font-lock-comment-face "cyan")
(set-face-foreground 'font-lock-string-face  "color-203")
(set-face-foreground 'font-lock-keyword-face "color-43")
(set-face-foreground 'font-lock-function-name-face "brightblue")
(set-face-foreground 'font-lock-variable-name-face "brightyellow")
(set-face-foreground 'font-lock-type-face "brightgreen")
(set-face-foreground 'font-lock-builtin-face "color-30")
(set-face-foreground 'font-lock-constant-face "magenda")
(set-face-foreground 'font-lock-warning-face "red")

;;
;;Indent Current Buffer
;;
(defun iwb ()
  "indent whole buffer"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max)))
(global-set-key (kbd "C-x C-i") 'iwb)

;;
;; ace jump mode major function
;;
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)
;; you can select the key you prefer to
(define-key global-map (kbd "M-j") 'ace-jump-mode)

;;
;; enable a more powerful jump back function from ace jump mode
;;
(autoload
  'ace-jump-mode-pop-mark
  "ace-jump-mode"
  "Ace jump back:-)"
  t)
(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))
(define-key global-map (kbd "C-j") 'ace-jump-mode-pop-mark)





;;;Rebinding Eshell History
(add-hook 'eshell-mode-hook
          '(lambda ()
             (local-set-key (kbd "C-p") 'eshell-previous-matching-input-from-input)
             (local-set-key (kbd "C-n") 'eshell-next-matching-input-from-input)
             )
          )

;;;Run eshell automatically after compile
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
              (message "Compile Success! Running on eshell...")
              (switch-to-buffer-other-window "*compilation*")
              ;;(kill-buffer "*compilation*)
              (eshell)
              (eshell-send-input)
              )
          (message "Compile Failure")))
    (if (eq ps 'signal)
        (message "Compile Abnormal and"))))


;;;open .h file in c-mode
(add-to-list 'auto-mode-alist '("\\.h\\'" . c-mode))

;;;open.jsnp
(add-to-list 'auto-mode-alist '("\\.jsnp\\'" . java-mode))

;;;Show line numbers
(global-linum-mode t)
(setq linum-format "%3d\u2502")
(set-face-attribute 'linum nil :foreground "#AAA")

;;Highlight the counterpart of the parenthesis
(show-paren-mode 1)
;;Indent when start a new line
(global-set-key "\C-m" 'newline-and-indent)
;;Assign find-function
(find-function-setup-keys)


;;;Don't divide window when type C-x C-b
(global-set-key [(C x) (C b)] 'buffer-menu)


;;;Turncate lines on the right side
(setq turncate-lines t)

;;;Scroll buffer
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

;;;Open mydocument.txt
(global-set-key (kbd "M-d")
                (lambda ()
                  (interactive)
                  (find-file "~/.emacs.d/mydocument.txt")
                  ))

;;;Open init.el
(global-set-key (kbd "M-s")
                (lambda ()
                  (interactive)
                  (find-file "~/.emacs.d/init.el")
                  ))

;;;Change window size
(global-set-key "\M-h" 'enlarge-window)
(global-set-key "\M-w" 'enlarge-window-horizontally)

;;;Clear eshell buffer
(defun eshell/cls ()
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)))

;;;Change window
(defun other-window-or-split ()
  (interactive)
  (when (one-window-p)
    (split-window-vertically))
  (other-window 1))
(define-key global-map "\C-t" 'other-window-or-split)


(setq scroll-step 1)

(setq inhibit-startup-message t)

(setq visible-bell nil)

(menu-bar-mode 0)

(setq make-backup-files nil)

(global-set-key "\C-h" 'delete-backward-char)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(direx:closed-icon "|+")
 '(direx:leaf-icon "| ")
 '(direx:open-icon "| "))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
