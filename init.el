;;; Init.el ---- Startup options
;;; Commentary:

;;; Code:

;;; Enable MELPA packages
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )

;; Save backups and temp files to a central location to avoid
;; certain tools (Grunt-watch) to show annoying ENOENT file because
;; I can't figure out a Glob pattern to exclude them from JSLint

;; (setq backup-directory-alist
;;       `(("." . ,(expand-file-name
;;                  (concat user-emacs-directory "backups")))))

;; (setq auto-save-file-name-transforms
;;       `((".*" ,(expand-file-name
;;                 (concat user-emacs-directory "auto-save")) t)))

;;; Shortcut for neotree sidebar
;; (require 'neotree)
 (global-set-key [f8] 'neotree-toggle)



;;; My own values for variables
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(column-number-mode t)
 '(custom-enabled-themes (quote (tsdh-dark)))
 '(desktop-save-mode t)
 '(electric-indent-mode nil)
 '(global-auto-complete-mode t)
 '(global-auto-highlight-symbol-mode t)
 ;; '(imenu-use-popup-menu nil)
 '(indent-tabs-mode nil)
 '(js2-basic-offset 2)
 '(js2-bounce-indent-p nil)
 '(js2-include-node-externs t)
 '(ns-command-modifier (quote meta))
 '(show-paren-mode t)
 '(tab-width 2)
 '(word-wrap nil))

;;; make transparent
(set-frame-parameter (selected-frame) 'alpha '(90 90))
(set-face-attribute 'default nil :height 150)

;; auto-load js2-mode
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;; hide toolbar
(ns-toggle-toolbar)
;;; Maximize on startup
(toggle-frame-maximized)

;; Show-hide
(global-set-key (kbd "C-c +") 'hs-show-block)
(global-set-key (kbd "C-c <") 'hs-show-all)
(global-set-key (kbd "C-c -") 'hs-hide-block)
(global-set-key (kbd "C-c >") 'hs-hide-all)

(global-visual-line-mode)


;; JS stuff 
(add-hook 'js-mode-hook (lambda () (tern-mode t)))
(eval-after-load 'tern
   '(progn
      (require 'tern-auto-complete)
      (tern-ac-setup)))

;; Projectile + Helm
(require 'helm-config)
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)
(global-set-key (kbd "C-.") 'helm-imenu-anywhere)

;; scrolling
(global-set-key "\M-n"  (lambda () (interactive) (scroll-up   4)) )
(global-set-key "\M-p"  (lambda () (interactive) (scroll-down 4)) )

;;; Init.el ends here