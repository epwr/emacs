;; Copyright (C) 2023 Eric Power
;;
;; DESCRIPTION:
;; Configuration specific to running my Emacs on a MacOS. 
;;
;; REQUIREMENTS:
;; Emacs v29

;; Approprate size for mac monitor
(setq initial-frame-alist '(
    (top . 0) 
    (left . 0) 
    (width . 210) 
    (height . 65)))

;; Set up MacOS Cmd-> Cmd-< for start/end of line.
(setq mac-command-modifier 'super)
(global-set-key (kbd "s-<right>") 'move-end-of-line)
(global-set-key (kbd "s-<left>") 'move-beginning-of-line)

;; Set up the executable path from the local terminal.
;; Some packages (eg. flycheck) make note of needing this explicitly on MacOS.
(use-package exec-path-from-shell
    :ensure t)
(exec-path-from-shell-initialize)

