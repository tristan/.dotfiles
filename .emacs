(package-initialize)

;; Enable ido mode
(ido-mode t)

;; save history
(savehist-mode 1)

;; Add melpa packages
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)

(load-theme 'zenburn t t)
(enable-theme 'zenburn)
(set-face-attribute 'default nil :height 120)

(setq
 backup-by-copying t
 backup-directory-alist
 '(("." . "~/.emacsbackups"))
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t)

;; show columns in the info bar
(setq column-number-mode t)

;; tabs are evil
(setq-default indent-tabs-mode nil)
;; 2 space tabs for javascript
(setq js-indent-level 2)

(global-set-key (kbd "C-c L") 'string-inflection-lower-camelcase)

;; grep cleanup
(eval-after-load 'grep
  '(progn
     (add-to-list 'grep-find-ignored-directories "env/lib")
     (add-to-list 'grep-find-ignored-directories "node_modules")
     (add-to-list 'grep-find-ignored-directories ".git")))
(add-hook 'grep-mode-hook (lambda () (toggle-truncate-lines 1)))

(add-hook 'after-init-hook #'global-flycheck-mode)
(eval-after-load 'flycheck
  '(progn
     (set-face-attribute 'flycheck-warning nil :background "orange4")
     (set-face-attribute 'flycheck-error nil :background "red3")))

(add-hook
  'python-mode-hook
  (lambda ()
    (setq tab-width 4)
    (setenv "LANG" "en_US.UTF-8")
    ))

(add-hook 'flycheck-mode-hook #'flycheck-rust-setup)
;;    (add-to-list 'write-file-functions 'delete-trailing-whitespace)))

;; delete trailing whitespace on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; magit
;;(global-set-key (kbd "C-x g") 'magit-diff-working-tree)
(global-set-key (kbd "C-x g") 'magit-status)

;; scrolling
(global-set-key "\M-n" "\C-u1\C-v")
(global-set-key "\M-p" "\C-u1\M-v")

(tool-bar-mode -1)
(menu-bar-mode -1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flycheck-display-errors-function nil)
 '(flycheck-highlighting-mode (quote lines))
 '(flycheck-python-flake8-executable "/usr/local/bin/flake8")
 '(flycheck-python-pycompile-executable "python3")
 '(package-selected-packages
   (quote
    (jinja2-mode zenburn-theme rust-mode magit lua-mode flycheck-rust))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
