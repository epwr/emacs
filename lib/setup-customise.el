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
 '(custom-safe-themes
   '("dccf377876adeea16bc98f3a77514bae2fe0f8877bee635c6ac488773b95b7ba" "a710c32bfe207a30a015b969cfb4bafe2bcd371f237482d55e303e25da8dd423" "f99a64a71f3cd98406914e5cf6d097da81bf2086173a83e0e56b190804b29f51" "b651cb8f4037871793c1df629cce42483843c3e54af6816b0ff7fa17a0f8e0a1" default))
 '(hcl-indent-level 2)
 '(package-selected-packages '(yaml-pro lsp-mode flycheck company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
