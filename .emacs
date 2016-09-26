;;; Backup files
(setq inhibit-splash-screen t
      make-backup-files nil
      user-full-name "Patrick Stein"
      user-mail-address "pat@nklein.com")

(add-to-list 'exec-path "/usr/local/bin")

;;; Be ready for emacsclient
(server-start)

;;; Whitespace & character encoding stuff
(setq-default indent-tabs-mode nil)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(set-default-coding-systems 'utf-8-unix)
(prefer-coding-system 'utf-8-unix)
(setq-default default-buffer-file-coding-system 'utf-8-unix)
(setq-default web-mode-markup-indent-offset 2)

(add-hook 'text-mode-hook 'auto-fill-mode)
(add-hook 'text-mode-hook 'paragraph-indent-minor-mode)
(setq markdown-command "/usr/local/bin/markdown")

;;; Package stuff
(require 'package)
(package-initialize)
;(add-to-list 'package-archives
;             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/") t)

(add-to-list 'load-path (expand-file-name "~/.emacs.d"))
(require 'braille-chords)

(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;;; auto-complete
(require 'auto-complete-config)
(ac-config-default)

;;; web-mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(setq web-mode-engines-alist '(("php" . "\\.php\\'")))
(setq web-mode-ac-sources-alist
      '(("php" . (ac-source-yasnippet ac-sources-php-auto-yasnippets))))

;;; email stuff
(add-to-list 'auto-mode-alist '("/mutt" . mail-mode))
(add-hook 'mail-mode-hook (lambda () (epa-mail-mode)))

;;; Lisp mode stuff
(load (expand-file-name "~/quicklisp/slime-helper.el"))
(setq inferior-lisp-program "/usr/local/bin/ccl")

(defun sbcl ()
  (interactive)
  (let ((inferior-lisp-program "/usr/local/bin/sbcl"))
    (slime)))

(autoload 'enable-paredit-mode "paredit" "Turn on sexp editing" t)
(add-hook 'emacs-lisp-mode-hook #'enable-paredit-mode)
(add-hook 'lisp-mode-hook #'enable-paredit-mode)

(defun override-slime-repl-bindings-with-paredit ()
  (paredit-mode +1)
  (define-key slime-repl-mode-map
    (read-kbd-macro paredit-backward-delete-key) nil))
(add-hook 'slime-repl-mode-hook 'override-slime-repl-bindings-with-paredit)

(defvar electrify-return-match
  "[\]}\)\"]"
  "If this regexp matches the text after the cursor, do an \"electric\"
return.")
(defun electrify-return-if-match (arg)
  "If the text after the cursor matches `electrify-return-match' then
open and indent an empty line between the cursor and the text.  Move the
cursor to the new line."
  (interactive "P")
  (let ((case-fold-search nil))
    (if (looking-at electrify-return-match)
        (save-excursion (newline-and-indent)))
    (newline arg)
    (indent-according-to-mode)))
(global-set-key (kbd "RET") 'electrify-return-if-match)

(setq common-lisp-hyperspec-root (expand-file-name "~/share/HyperSpec/"))

;;; Clojure stuff
(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'clojure-mode-hook 'cider-mode)
(add-hook 'cider-mode-hook #'eldoc-mode)
(add-hook 'cider-mode-hook #'enable-paredit-mode)
(setq cider-lein-command (expand-file-name "~/bin/lein"))

;;; C++ stuff
(setq-default c-basic-offset 4)

;;; Color scheme and fonts
(if (display-graphic-p)
  (progn
    (setq solarized-contrast 'high)
    ;(load-theme 'solarized-dark t)
    (load-theme 'tango-dark t)))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auth-source-save-behavior nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Inconsolata" :foundry "outline" :slant normal :weight normal :height 190 :width normal)))))
