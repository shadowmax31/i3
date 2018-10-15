(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)

(add-hook 'find-file-hook 'linum-mode)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))


(eval-when-compile
  (require 'use-package))

(use-package helm
  :ensure t)

(use-package evil
  :ensure t
  :config (evil-mode t))

(bind-key "C-u" 'evil-scroll-up evil-normal-state-map)
(bind-key "C-u" 'evil-scroll-up evil-visual-state-map)

;; Utilisation du web-mode pour le développement
(use-package web-mode
  :ensure t)

(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
(setq web-mode-engines-alist
      '(("php"    . "\\.phtml\\'")
        ("blade"  . "\\.blade\\."))
      )

(setq-default indent-tabs-mode nil)
(setq web-mode-code-indent-offset 4)
(setq web-mode-indent-style 4)

;; Configuration de auto-complete
(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)
    ))

;; Configuration de neotree
;;(use-package neotree
;;  :ensure t)
;;(bind-key "C-n" 'neotree-toggle evil-normal-state-map)
;;(bind-key "C-N" 'neotree-toggle evil-visual-state-map)
;;(bind-key "RET" 'neotree-enter evil-normal-state-map)

;; Configuration de org-mode
(use-package org
  :ensure t
  :config
  (setq org-log-done t)
  (setq org-agenda-files (list "~/agenda.org")))

(use-package evil-org
  :ensure t
  :after org
  :config
  (add-hook 'org-mode-hook 'evil-org-mode)
  (add-hook 'evil-org-mode-hook
            (lambda ()
              (evil-org-set-key-theme)))
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

(define-key global-map "\C-ca" 'org-agenda)

(use-package org-bullets
  :ensure t)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("4757d7d892a38e2d0c9a86d9b83c1aa3e6f1a68ce7a370101ed91239b39e142b" "e08cf6a643018ccf990a099bcf82903d64f02e64798d13a1859e79e47c45616e" "8a9be13b2353a51d61cffed5123b157000da0347c252a7a308ebc43e16662de7" default)))
 '(package-selected-packages
   (quote
    (ranger helm helm-spotify-plus multi evil-magit magit dumb-jump indent-guid indent-guide indent-guide-mode indent-guide-mmode aggressive-indent org-bullets neotree auto-complete web-mode evil use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(use-package gruvbox-theme
  :ensure t)
(load-theme 'gruvbox-dark-hard)

(use-package aggressive-indent
  :ensure t)
(global-aggressive-indent-mode 1)
(add-to-list 'aggressive-indent-excluded-modes 'html-mode)

;; https://github.com/ggreer/the_silver_searcher#installing
;; Voir s'il n'y a pas d;alternative (l'installation me tanne)
(use-package dumb-jump
  :ensure t)
(dumb-jump-mode)
(bind-key "<f12>" 'dumb-jump-go evil-normal-state-map)
(bind-key "<f12>" 'dumb-jump-go evil-insert-state-map)

(bind-key "S-<f12>" 'dumb-jump-back evil-normal-state-map)
(bind-key "S-<f12>" 'dumb-jump-back evil-insert-state-map)

(use-package magit
  :ensure t)
(bind-key "g s" 'magit-status evil-normal-state-map)

(use-package ranger
  :ensure t)
(bind-key "C-N" 'ranger evil-normal-state-map)
(bind-key "C-N" 'ranger evil-visual-state-map)

(use-package evil-magit
  :ensure t)

;;Montre les liens entre les (, [, {
(show-paren-mode t)
