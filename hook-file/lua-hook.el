(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))
(setq indent-tabs-mode nil) ; always replace tabs with spaces
(setq lua-indent-level 2) ; set tab width to 4 for all buffers

(provide 'lua-hook)
