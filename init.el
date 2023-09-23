;; Author: Eric Power
;;

;; Run mac-os config when appropriate
(when (eq system-type 'darwin)
  (load "~/.emacs.d/init-mac-os.el"))

(setenv "PATH" (concat (getenv "PATH") ":opt/homebrew/bin" ":/Users/epwr/.pyenv/shims/"))

;; UI Setup
(setq inhibit-startup-message t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; Load Theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;; (load-theme 'zenburn t)
;; (load-theme 'material t)
(load-theme 'nord t)

;; Set up package manager
(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(setq package-selected-packages '(lsp-mode yasnippet lsp-treemacs helm-lsp projectile hydra flycheck company avy which-key helm-xref dap-mode json-mode))
(when (cl-find-if-not #'package-installed-p package-selected-packages)
  (package-refresh-contents)
  (mapc #'package-install package-selected-packages))

;; Set up modes
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(add-hook 'prog-mode-hook 'display-line-numbers-mode) 
;; (add-hook 'prog-mode-hook 'highlight-numbers-mode)


;; Set up multiple-cursors
(unless (package-installed-p 'multiple-cursors)
    (package-install 'multiple-cursors))
(require 'multiple-cursors)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-s-c C-s-c") 'mc/edit-lines)



;; Javascript
(with-eval-after-load 'js
  (define-key js-mode-map (kbd "M-.") nil))
;; On first open, run M-x lsp, then select ts-lsp
;; Set up helm mode (completions)
;; From: https://emacs-lsp.github.io/lsp-mode/tutorials/reactjs-tutorial/
(helm-mode)
(require 'helm-xref)
(define-key global-map [remap find-file] #'helm-find-files)
(define-key global-map [remap execute-extended-command] #'helm-M-x)
(define-key global-map [remap switch-to-buffer] #'helm-mini)
(which-key-mode)
(add-hook 'prog-mode-hook #'lsp)
(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      company-idle-delay 0.0
      company-minimum-prefix-length 1
      create-lockfiles nil) ;; lock files will kill `npm start'
(with-eval-after-load 'lsp-mode
  (require 'dap-chrome)
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)
  (yas-global-mode))




;; Clojure setup
(defvar clojure-packages '(better-defaults
                      projectile
                      clojure-mode
                      ;;cider
		      paredit))

(dolist (p clojure-packages)
  (unless (package-installed-p p)
    (package-install p)))













;; Org Mode
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)))



;; ---------------------------------------------------------------------------------------------------------

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cider-lein-command "/opt/homebrew/bin/lein")
 '(custom-safe-themes
   '("969eca2ab11e50bf0e4be5c5136d6d20a8348b881bb502685e0420c6b52c26c2" "a4aa7be89b6a5ac200f9e4a0f18230c8466405ff297859a49b4badc0196d06ae" "93d333aea30863749bc5c391a48e28bdbfb2acc1b860cd85fa4f5978f6dcfcbc" "afc383be3bbb93cfccff8a7e28ff8ac7e4e7f36a84763bd6bdaacfeca6486016" "a3272513a2f52d4e52dd42aa767b9b29929072fc436af179e427aeb3ace5f496" "e0373b35ed501e5b3b036fb658f1b81784001d27e808e2192d0428f723c86491" "fc6220e5bf6a911ed167fe215b8b3ecf569db89faf22fdc6effa73afc983ebaa" "e304f30515f149da25355b947fef31f3a3621a14b13da709aee5ea7755e5c0d1" "1bf7a88542a19843b3ad4d837fcfa837eeb2971b6cc269ebf91535c38b42552c" "7c83664a042daef50805a8c33eafdc2b7031b15fa5f90d1c808e2722fdd37ec7" "ea7fc3f63c91e8e2ada22a039d28468c4654e607331c5b857d7b0f09aabe11d0" "8e30b9421bddbb6870ec016ec1670d69448172f2d46836a7b78e4117bff57510" "1707c7c14b362b3d64fe5853ace8cb575884f1bef7de54fcfce2bedc98a8175d" "cd825335db61f0ce512acb4917a08582a27209023fea6e72f8d28279847727cd" "15c424aaccc021048859a5efb0d95f0e2c6b5d225a9c998b1764c8cd3e1a1e78" "aac53426bc3fc4595787c6196d76bedd1d815e574080460dbcb35a126d2ea6fd" "8a81abe9554c75382da6ecdfb0cb220e821895fab4598d4ca803808938c74085" "bf9f8b0b5d555b232eda85061ffc8895f51b5bfadde5a2ea753309b86484ac6c" "8b3b5618836c3e71b7b489ac44072338197481d91de560ffbdae9165a6869f41" "d6dfecd9b0a35d69dbc789dc7f3f91279eb8bf081066d473d54fe5ee455c6af7" "a92700cddbca041476fe0d6535493cd7d6ea54ae72e888cfc05a8ce0c8647e2a" "e789db4502f5dd0d2c563a142bdb89d531c6307c413e919b34b48a1a1445968a" "9bf24cb5469999d0fa52e8155583a9175ff97380d07cf24a1d3610ab2475301c" "fa06d06d61241095bcd0ad034c6a239cfe59e47cd35f477aba45139dd7631776" "cd1191ae91a2a9f826dd895764faa7d4f253395325d37f1faf56de17083f89ea" "3b8021163b604e0c829b552880d33380a2f24494faa57939be3ffe85a9a97d8e" "2deb7593eb9bd1b1d3f952c0a721c631e08eb2fd0ecf3ba62ee720c84aaa8ab8" "15455db6128f062a1c44fd11e5e97feeb67654b168984c0f1dfb328278cde0b4" "5b1f966b5d16ff5a74fc53ca722bb20fb29424bed580ca92560ca36b04766af9" "c37dab1e3dd8ca0e956a6d87739c49622c38c917a05236aff84714d190abbbd3" "07d6ab0356327d9bb4f825b9996fb1f44b4f2df9488feef311e11706b25504f2" "a6538baf837516acf9fc115863f1430f74fcad75b246ec34017c2ab83376ce0b" "fae937d455ca1d4a0749278d4ae372fd11c5d694b63b8881c8d28a6b11c4b064" "8d3bf55d0bd5734fd87c1f446b011aef231606312c49ca37efbe25cf870573a9" "67a66e904ba7b9264be5b69f40e18e3e43662993e0ab557add596a70f394a8aa" "fe3a8314862c73852ecc9d7fa436dae5fe4c45b0f145e86aa7429bd7d8be1b5f" "5a63d34f6497f3bf4a081df544ab7d2c87384a9e45d58a31c3297c7f5923a112" "582bec5ba8ce42d20a25e8ba0cb1678c23be5ea56df02b016da42f87922debf8" "a96c0d2901c46ad8ad74fb7e4bc75ce98a68b09b4965bd26d8bf42112b77a573" "90a6f96a4665a6a56e36dec873a15cbedf761c51ec08dd993d6604e32dd45940" "d3778c9b75f7a010617cb5627265468b3eea051d59c7edc7e1e4707d631e723a" "797d8cd7f328567550a7b58f443842517db6cb649467996f175fa0c4d96eeee1" "fc6c26cd683122541b2fc1f30ec17928b0cf6032359b2137dde01e2238dbbe75" default))
 '(exec-path
   '("/usr/local/bin" "/usr/bin" "/bin" "/usr/sbin" "/sbin" "/Library/TeX/texbin" "/Applications/Emacs.app/Contents/MacOS/bin-arm64-11" "/Applications/Emacs.app/Contents/MacOS/libexec-arm64-11" "/Applications/Emacs.app/Contents/MacOS/libexec" "/opt/homebrew/bin"))
 '(package-selected-packages
   '(protobuf-mode go-mode pylint svelte-mode rainbow-delimiters zzz-to-char company-jedi graphql-mode graphql hcl-mode flycheck flycheck-elixir yasnippet lsp-mode elixir-mode eglot janet-mode parseclj cider tide ## js2-mode tern-context-coloring tern-auto-complete tern-autocomplete tern multiple-cursors better-defaults)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
