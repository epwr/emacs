;; Copyright (C) 2023 Eric Power
;;
;; DESCRIPTION:
;; Configures everything needed for working with LaTeX files.
;;
;;
;; REQUIREMENTS:
;; Emacs v29

(use-package auctex
  :ensure t
  :defer t)

(use-package pdf-tools
  :ensure t
  :hook (TeX-after-compilation-finished-functions . TeX-revert-document-buffer))

