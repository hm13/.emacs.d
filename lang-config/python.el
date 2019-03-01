;;;Python
(defun python-split-and-execute ()
  (interactive)
  (when (one-window-p)
    (split-window-horizontally))
  (setq bn (buffer-name))
  (save-buffer)
  (other-window 1)
  (eshell)
  (insert "python ./" bn)
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
    (toggle-selective-display column))
)
(add-to-list 'hs-special-modes-alist
	     '(python-mode
	       "\\(def\\|do\\|{\\)" "\\(end\\|end\\|}\\)" "#"
 	       (lambda (arg) (python-end-of-block)) nil))

(load-library "hideshow")
(add-hook 'python-mode-hook
	  '(lambda()
	     (set-default-coding-systems 'utf-8)
     	     (electric-indent-mode)
	     (define-key python-mode-map [(C c) (C c)] 'comment-region)
	     (define-key python-mode-map [(C c) (C u)] 'uncomment-region)
	     (define-key python-mode-map [(C o) (C o)] 'python-split-and-execute)
	     (define-key python-mode-map [(C o) (h)] 'hs-hide-all)
	     (define-key python-mode-map [(C o) (s)] 'hs-show-all)
    	     (define-key python-mode-map "\C-i" 'toggle-hiding)
	     ))
(add-hook 'python-mode-hook 'hs-minor-mode)


(provide 'python-config)
