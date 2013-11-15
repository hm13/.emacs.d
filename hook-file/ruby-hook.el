;;;Ruby
(defun split-and-execute ()
  (interactive)
  (when (one-window-p)
    (split-window-horizontally))
  (setq bn (buffer-name))
  (save-buffer)
  (other-window 1)
  (eshell)
  (insert "ruby ./" bn)
  (eshell-send-input)
  (other-window 1)
  )

(defun toggle-selective-display (column)
  (interactive "P")
  (set-selective-display
   (or column
       (unless selective-display
	 (1+ (current-column))))))
(defun toggle-hiding (column)
  (interactive "P")
  (if hs-minor-mode
      (if (condition-case nil
	      (hs-toggle-hiding)
	    (error t))
	  (hs-show-all))
    (toggle-selective-display column)))
(add-to-list 'hs-special-modes-alist
	     '(ruby-mode
	       "\\(def\\|do\\|{\\)" "\\(end\\|end\\|}\\)" "#"
	       (lambda (arg) (ruby-end-of-block)) nil))
(load-library "hideshow")
(add-hook 'ruby-mode-hook 'hs-minor-mode)

(add-hook 'ruby-mode-hook
	  '(lambda()
	     (set-default-coding-systems 'utf-8)
	     (define-key ruby-mode-map [(C c) (c)] 'split-and-execute)
	     (electric-indent-mode)
	     (define-key ruby-mode-map [(C c) (C c)] 'comment-region)
	     (define-key ruby-mode-map [(C c) (C u)] 'uncomment-region)
	     (define-key ruby-mode-map "\C-i" 'toggle-hiding)
	     ))


(provide 'ruby-hook)
