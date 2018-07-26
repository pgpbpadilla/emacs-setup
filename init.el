;;; Init.el ---- Startup options
;;; Commentary:

;;; Code:

;;; Enable MELPA packages
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )

(setq my-package-list '(helm-projectile yaml-mode json-mode))
(mapc #'package-install my-package-list)

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
;; (global-set-key [f8] 'neotree-toggle)



;; Projectile + Helm
(package-install 'helm)
(require 'helm-config)
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)
(global-set-key (kbd "C-.") 'helm-imenu-anywhere)


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
 '(helm-mode t)
 '(indent-tabs-mode nil)
 '(ns-command-modifier (quote meta))
 '(package-selected-packages (quote (helm yaml-mode helm-projectile)))
 '(show-paren-mode t)
 '(tab-width 2)
 '(word-wrap nil))

;;; make transparent
(set-frame-parameter (selected-frame) 'alpha '(90 90))
(set-face-attribute 'default nil :height 140)

;; auto-load js2-mode
;; (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;; hide toolbar
;; (ns-toggle-toolbar)
;;; Maximize on startup
(toggle-frame-maximized)

;; Show-hide
(global-set-key (kbd "C-c +") 'hs-show-block)
(global-set-key (kbd "C-c <") 'hs-show-all)
(global-set-key (kbd "C-c -") 'hs-hide-block)
(global-set-key (kbd "C-c >") 'hs-hide-all)

(global-visual-line-mode)


;; JS stuff 
;;(add-hook 'js-mode-hook (lambda () (tern-mode t)))
;;(eval-after-load 'tern
;;   '(progn
;;      (require 'tern-auto-complete)
;;      (tern-ac-setup)))

;; scrolling
(global-set-key "\M-n"  (lambda () (interactive) (scroll-up   4)) )
(global-set-key "\M-p"  (lambda () (interactive) (scroll-down 4)) )

;; Ansible mode
(add-hook 'yaml-mode-hook '(lambda () (ansible 1)))


;; AUCTeX
;;(setenv "PATH" "/usr/local/bin:/Library/TeX/texbin/:$PATH" t)
;;(setq exec-path (append exec-path '("/Library/TeX/texbin")))
;;(setq TeX-auto-save t)
;;(setq TeX-parse-self t)
;;(setq-default TeX-master nil)
;;
;;(yas-global-mode 1)
;;(add-to-list 'yas-snippet-dirs (locate-user-emacs-file "snippets"))


;;(require 'real-auto-save)
;;(add-hook 'prog-mode-hook 'real-auto-save-mode)
;;(setq real-auto-save-interval 5) ;; in seconds

;; Flyspell
;; easy spell check
;;(global-set-key (kbd "<f8>") 'ispell-word)
;;(global-set-key (kbd "C-S-<f8>") 'flyspell-mode)
;;(global-set-key (kbd "C-M-<f8>") 'flyspell-buffer)
;;(global-set-key (kbd "M-<f8>") 'flyspell-check-previous-highlighted-word)
;;(defun flyspell-check-next-highlighted-word ()
;;  "Custom function to spell check next highlighted word"
;;  (interactive)
;;  (flyspell-goto-next-error)
;;  (ispell-word)
;;  )
;;(global-set-key (kbd "M-<f9>") 'flyspell-check-next-highlighted-word)

;;; Init.el ends here
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
