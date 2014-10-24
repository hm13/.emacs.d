;;Ocaml
(defun split-and-execute ()
  (interactive)
  (when (one-window-p)
    (split-window-horizontally))
  (setq bn (buffer-name))
  (save-buffer)
  (other-window 1)
  (eshell)
  (insert "cat " bn " | ocaml")
  (eshell-send-input)
  (other-window 1)
  )

(add-hook 'tuareg-mode-hook
	  '(lambda()
	     (set-default-coding-systems 'utf-8)
     	     (electric-indent-mode)
	     (define-key tuareg-mode-map [(C c) (C c)] 'comment-region)
	     (define-key tuareg-mode-map [(C c) (C u)] 'uncomment-region)
     	     (define-key tuareg-mode-map [(C o) (C o)] 'split-and-execute)
	     ))

;(setq auto-mode-alist (cons '("\\.ml\\w?" . tuareg-mode) auto-mode-alist))

;; (setq auto-mode-alist
;;       (append '(("\\.ml[ily]?$" . tuareg-mode)
;;                 ("\\.topml$" . tuareg-mode))
;;               auto-mode-alist))

(add-to-list 'auto-mode-alist '("\\.ml\\'" . ocaml-mode))
(autoload 'tuareg-mode "tuareg" "Major mode for editing Caml code" t)
(autoload 'camldebug "camldebug" "Run the Caml debugger" t)

(if (and (boundp 'window-system) window-system)
    (when (string-match "XEmacs" emacs-version)
      (if (not (and (boundp 'mule-x-win-initted) mule-x-win-initted))
          (require 'sym-lock))
      (require 'font-lock)))


(provide 'ocaml-hook)
