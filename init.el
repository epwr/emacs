;; Author: Eric Power
;;

;; Set up the MELPA stable repository
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(package-initialize)


;; Clojure setup
(defvar clojure-packages '(better-defaults
                      projectile
                      clojure-mode
                      cider
		      paredit))

(dolist (p clojure-packages)
  (unless (package-installed-p p)
    (package-install p)))
(custom-set-variables







;; ---------------------------------------------------------------------------------------------------------
 
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (better-defaults))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
