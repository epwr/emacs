;; Copyright (C) 2023 Eric Power
;;
;; DESCRIPTION:
;; Configures everything needed for working with LaTeX files.
;;
;;
;; REQUIREMENTS:
;; Emacs v29

;; Better PDF viewer
(use-package pdf-tools
  :ensure t)


(use-package auctex
  :ensure t
  :defer t
  :hook (TeX-after-compilation-finished-functions . TeX-revert-document-buffer)
  :config
  (setq TeX-view-program-selection '((output-pdf "PDF Tools"))
		TeX-view-program-list '(("PDF Tools" TeX-pdf-tools-sync-view))
		TeX-source-correlate-start-server t) ;; not sure if last line is neccessary
  )
