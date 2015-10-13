;;
;;General
;;



;;Set Load Path
(setq load-path
      (append
       (list
        (expand-file-name "~/.emacs.d/mydoc/")
        (expand-file-name "~/.emacs.d/auto-install")
        (expand-file-name "~/.emacs.d/hook-file")
        (expand-file-name "~/.emacs.d/elpa/org-20130204")
        (expand-file-name "~/.emacs.d/site-lisp")
        (expand-file-name "~/.emacs.d/site-lisp/org/lisp")
        (expand-file-name "~/.emacs.d/site-lisp/powerline")
        (expand-file-name "~/.emacs.d/site-lisp/php-mode-1.5.0")
        )
       load-path))

;;Include my hook
(require 'c-hook)
(require 'c++-hook)
(require 'org-hook)
(require 'asm-hook)
(require 'ruby-hook)
(require 'latex-hook)
(require 'coq-hook)
(require 'markdown-hook)
(require 'ocaml-hook)
(require 'python-hook)

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )

;;
;;Commenting
;;
(global-set-key (kbd "C-c C-c") 'comment-or-uncomment-region)


;;
;;Replace string
;;
(global-set-key (kbd "C-x r") 'replace-regexp)

;;
;;Auto Complete
;;
(require 'auto-complete)
(global-auto-complete-mode t)
(define-key ac-complete-mode-map "\C-n" 'ac-next)
(define-key ac-complete-mode-map "\C-p" 'ac-previous)

;;
;;Bison mode
;;
(load "~/.emacs.d/site-lisp/bison-mode.el")


;;
;;PHP mode
;;
(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode));;;Load Path Config


;;
;;Color Config
;;

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
;; Ace Jump Mode
;;
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)

(global-set-key (kbd "M-j") 'ace-jump-mode)



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

;; ;;;Show line numbers
;; (global-linum-mode t)
;; (setq linum-format "%3d\u2502")
;; (set-face-attribute 'linum nil :foreground "#AAA")

;;Highlight the counterpart of the parenthesis
(show-paren-mode 1)
;;Indent when start a new line
(global-set-key "\C-m" 'newline)
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
                  (find-file "~/.emacs.d/mydoc/mydocument.txt")
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

(tool-bar-mode 0)

(setq make-backup-files nil)

(setq-default indent-tabs-mode nil)

(global-set-key "\C-h" 'delete-backward-char)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(tuareg-fun-indent 0)
 '(tuareg-support-metaocaml t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(eshell-prompt ((t (:foreground "color-172" :weight bold))))
 '(font-lock-builtin-face ((t (:foreground "color-36"))))
 '(font-lock-function-name-face ((t (:foreground "color-45"))))
 '(font-lock-string-face ((t (:foreground "color-136"))))
 '(isearch ((t (:background "color-40" :foreground "lightskyblue1"))))
 '(isearch-fail ((t (:background "color-125"))))
 '(markdown-header-face-1 ((t (:inherit outline-2 markdown-header-face))))
 '(markdown-header-face-2 ((t (:inherit outline-5 markdown-header-face))))
 '(markdown-header-face-3 ((t (:inherit outline-3 markdown-header-face))))
 '(markdown-header-face-4 ((t (:inherit outline-1 markdown-header-face))))
 '(markdown-header-face-5 ((t (:inherit outline-4 markdown-header-face))))
 '(markdown-header-face-6 ((t (:inherit outline-6 markdown-header-face))))
 '(markdown-inline-code-face ((t (:foreground "color-122"))))
 '(markdown-list-face ((t (:foreground "brightgreen"))))
 '(org-level-1 ((t (:foreground "color-226"))))
 '(org-level-2 ((t (:foreground "color-76"))))
 '(org-level-3 ((t (:foreground "color-42"))))
 '(org-level-4 ((t (:foreground "color-31"))))
 '(org-level-5 ((t (:foreground "color-23"))))
 '(org-table ((t (:foreground "brightblue"))))
 '(term ((t (:foreground "color-189"))))
 '(tuareg-font-lock-governing-face ((t (:foreground "color-38"))))
 '(tuareg-font-lock-multistage-face ((t (:foreground "color-245" :weight bold))))
 '(tuareg-font-lock-operator-face ((t (:foreground "color-185")))))
