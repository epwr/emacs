;; Copyright (C) 2023 Eric Power
;;
;; DESCRIPTION:
;; Configures everything needed for working with Terraform files.
;;
;;
;; REQUIREMENTS:
;; Emacs v29

(use-package hcl-mode
  :ensure t)

(custom-set-variables
 '(hcl-indent-level 2))
