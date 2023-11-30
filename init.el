
;; Copyright (C) 2023 Eric Power
;;
;; DESCRIPTION:
;; Root configuration file for my Emacs. Directly loads the lib/setup-core file.
;;
;; REQUIREMENTS:
;; Emacs v29

;; Display stacktrace on error
;; (setq debug-on-error t)


;; Load core setup file
(load (concat user-emacs-directory "lib/setup-core")) ;; Loads .elc if available, else .el




