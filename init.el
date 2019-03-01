;;
;; Load Path
;;
;(add-to-list 'load-path "/home/hirsakam/.emacs.d/site-lisp")
;(add-to-list 'load-path "/home/hirsakam/.emacs.d/site-lisp/org/lisp")
;(add-to-list 'load-path "/home/hirsakam/.emacs.d/auto-install")
;(add-to-list 'load-path "/home/hirsakam/.emacs.d/lang-config")

;;
;; Config for each major mode
;;
;(require 'ocaml-config)
;(require 'c-config)
;(require 'c++-config)
;(require 'org-config)
;(require 'ruby-config)
;(require 'latex-config)
;(require 'coq-config)
;(require 'markdown-config)
;(require 'python-config)
;(require 'lua-config)

(require 'package)
(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

;(require 'yaml-mode)
;(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
;(require 'yaml-mode)
;(add-to-list 'auto-mode-alist '("\\.yaml\\'" . yaml-mode))

;;
;; Ace Jump Mode
;;
(autoload 'ace-jump-mode "ace-jump-mode" "Emacs quick move minor mode" t)
(global-set-key (kbd "M-j") 'ace-jump-mode)

;;; open .h file in c-mode
(add-to-list 'auto-mode-alist '("\\.h\\'" . c-mode))

;;; Show line numbers
;(global-linum-mode t)
;(setq linum-format "%3d\u2502")
;(set-face-attribute 'linum nil :foreground "#AAA")

;; Don't divide window when type C-x C-b
(global-set-key [(C x) (C b)] 'buffer-menu)

;; Scroll buffer
(global-set-key "\M-p" (lambda () (interactive) (scroll-down 1) (forward-line -1)))
(global-set-key "\M-n" (lambda () (interactive) (scroll-up   1) (forward-line  1)))

;; Open files
(global-set-key "\M-d" (lambda () (interactive) (find-file "~/.emacs.d/doc.txt")))
(global-set-key "\M-s" (lambda () (interactive) (find-file "~/.emacs.d/init.el")))

;; Indent Current Buffer
(global-set-key (kbd "C-x C-i") (lambda () (interactive) (indent-region (point-min) (point-max) nil)))

;; Change window size
(global-set-key "\M-h" 'enlarge-window)
(global-set-key "\M-w" 'enlarge-window-horizontally)

;; Commenting
(global-set-key (kbd "C-c C-c") 'comment-or-uncomment-region)

;; Replace string
(global-set-key (kbd "C-x r") 'replace-regexp)

;; Indent when start a new line
(global-set-key "\C-m" 'newline)

;; Backspace
(global-set-key "\C-h" 'delete-backward-char)


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


;;
;; Misc
;;
(menu-bar-mode 0)
(find-function-setup-keys) ;; Assign find-function
(show-paren-mode 1) ;; Highlight the counterpart parenthesis
(setq scroll-step 1)
(setq inhibit-startup-message t)
(setq visible-bell nil)
(setq turncate-lines t)
(setq make-backup-files nil)
(setq-default indent-tabs-mode nil)
(setq scroll-conservatively 1)


;;
;; Color Config
;;
(set-face-background 'mode-line-inactive "gray10")  ;; Mode Line
(set-face-foreground 'mode-line-inactive "gray70")  ;; Mode Line
(set-face-foreground 'minibuffer-prompt  "color-46") ;; Mini Buffer (M-x)
(set-face-foreground 'font-lock-comment-face "cyan")
(set-face-foreground 'font-lock-string-face  "color-203")
(set-face-foreground 'font-lock-keyword-face "color-43")
(set-face-foreground 'font-lock-function-name-face "brightblue")
(set-face-foreground 'font-lock-variable-name-face "brightyellow")
(set-face-foreground 'font-lock-type-face     "brightgreen")
(set-face-foreground 'font-lock-builtin-face  "color-30")
(set-face-foreground 'font-lock-constant-face "magenda")
(set-face-foreground 'font-lock-warning-face  "red")


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(org-file-apps (quote (("pdf" . "mupdf %s"))))
 '(package-selected-packages (quote (haskell-mode tuareg)))
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
 '(tuareg-font-lock-multistage-face ((t (:foreground "color-28" :weight bold))))
 '(tuareg-font-lock-operator-face ((t (:foreground "color-185")))))
