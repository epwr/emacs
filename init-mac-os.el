;; Author: Eric Power
;; Description: Configuration to get things working on my Mac


;; Set up MacOS Cmd-> Cmd-< for start/end of line.
(setq mac-command-modifier 'super)
(global-set-key (kbd "s-<right>") 'move-end-of-line)
(global-set-key (kbd "s-<left>") 'move-beginning-of-line)

;; Add Homebrew to the PATH
(setenv "PATH" (concat (getenv "PATH") ":/opt/homebrew/bin"))

;; Approprate size for mac  monitor
(setq initial-frame-alist '((top . 0) (left . 0) (width . 210) (height . 65)))

;; Point emacs to the proper lein command
;; -- run to open the configuration menu.
;; (customize-group :cider "/opt/homebrew/bin/lein")

 
