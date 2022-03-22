;; Author: Eric Power
;; Description: Configuration to get things working on my Mac


;; Set up MacOS Cmd-> Cmd-< for start/end of line.
(setq mac-command-modifier 'super)
(global-set-key (kbd "s-<right>") 'move-end-of-line)
(global-set-key (kbd "s-<left>") 'move-beginning-of-line)

;; Add Homebrew to the PATH
(add-to-list 'load-path "/opt/homebrew/bin")


 
