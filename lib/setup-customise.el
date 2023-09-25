;; Copyright (C) 2023 Eric Power
;;
;; DESCRIPTION:
;; A single file to store and manage the `customise` system's configuration
;;
;; REQUIREMENTS:
;; Emacs v29

;; Set the `customise` system's configuration file to this file.
(setq custom-file (concat user-emacs-directory "lib/setup-customise.el"))

;; ---------------------------------------------------------------------------------------------------------

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cider-lein-command "/opt/homebrew/bin/lein")
 '(exec-path
   '("/usr/local/bin" "/usr/bin" "/bin" "/usr/sbin" "/sbin" "/Library/TeX/texbin" "/Applications/Emacs.app/Contents/MacOS/bin-arm64-11" "/Applications/Emacs.app/Contents/MacOS/libexec-arm64-11" "/Applications/Emacs.app/Contents/MacOS/libexec" "/opt/homebrew/bin"))
 '(package-selected-packages
   '(highlight-indent-guides lsp-mode yasnippet lsp-treemacs helm-lsp projectile hydra flycheck company avy which-key helm-xref dap-mode json-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
