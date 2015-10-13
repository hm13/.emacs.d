;;
;;
;; Ocaml
;;
;;


;;
;; Tuareg
;;
(add-hook 'tuareg-mode-hook
          '(lambda()
             (set-default-coding-systems 'utf-8)
             (define-key tuareg-mode-map [(C c) (C c)] 'comment-region)
             (define-key tuareg-mode-map [(C c) (C u)] 'uncomment-region)
             (define-key tuareg-mode-map [(C o) (C o)] 'split-and-execute)
             (define-key tuareg-mode-map [(C m)] 'newline)
             (global-unset-key (kbd "C-x C-i") 'iwb)
             ))
(setq tuareg-support-metaocaml t)
(add-to-list 'auto-mode-alist '("\\.ml\\'" . ocaml-mode))
(autoload 'tuareg-mode "tuareg" "Major mode for editing Caml code" t)
(autoload 'camldebug "camldebug" "Run the Caml debugger" t)


;;
;; Merlin
;;
;; Add opam emacs directory to the load-path
(add-to-list 'load-path "/home/sa-ti/.opam/4.02.1/share/emacs/site-lisp/")
;; Load merlin-mode
(require 'merlin)
;; Start merlin on ocaml files
(add-hook 'tuareg-mode-hook 'merlin-mode)
(add-hook 'caml-mode-hook 'merlin-mode)
;; Enable auto-complete
(setq merlin-use-auto-complete-mode 'easy)
;; Use opam switch to lookup ocamlmerlin binary
(setq merlin-command 'opam)


(provide 'ocaml-hook)

