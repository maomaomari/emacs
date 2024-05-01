(use-package org
	     :config
	     (add-hook 'org-mode-hook 'org-indent-mode)
	     (add-hook 'org-mode-hook
		       '(lambda ()
			  (visual-line-mode 1))))
(use-package org-indent
	     :diminish org-indent-mode)
(use-package htmlize
	     :ensure t)
(require 'org-tempo)
(add-to-list 'org-modules 'org-tempo)
(setq org-src-window-setup 'current-window)
(add-to-list 'org-structure-template-alist
	     '("el" . "src emacs-lisp"))

(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'text-mode-hook 'display-line-numbers-mode)

(global-hl-line-mode t)

(setq use-package-always-defer t)

(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)

(setq ring-bell-function 'ignore)

(setq make-backup-files nil)
(setq auto-save-default nil)

(setq x-select0enable-clipboard t)

(defalias 'yes-or-no-p 'y-or-n-p)

(setq scroll-conservatily 100)

(setq-default tab-width 4)
  (setq-default standard-indent 4)
  (setq c-basic-offset tab-width)
  (setq-default electric-indent-inhibit t)
  (setq-default indent-tabs-mode t)
  (setq backward-delete-char-untabify-method 'nil)
  (c-set-offset 'case-label tab-width)

(show-paren-mode 1)

(setq electric-pair-pairs '(
                               (?\{ . ?\})
                               (?\( . ?\))
                               (?\[ . ?\])
                               (?\" . ?\")
                               ))
;; (setq electric-pair-inhibit-predicate
;;       '(lambda(c)
;;          (if (char-equal c ?\<) t (,electric-pair-inhibit-predicate c))))
   (electric-pair-mode t)

(setq electric-pair-inhibit-predicate
      (lambda (c)
        (if (char-equal c ?\<) t (electric-pair-default-inhibit c))))

(global-set-key (kbd "s-C-b") 'shrink-window-horizontally)
(global-set-key (kbd "s-C-f") 'enlarge-window-horizontally)
(global-set-key (kbd "s-C-n") 'shrink-window)
(global-set-key (kbd "s-C-p") 'enlarge-window)

(global-set-key (kbd "C-x C-b") 'ibuffer)

(use-package dired
    :bind (:map dired-mode-map
           ("<return>" . dired-find-alternate-file)))

(use-package peep-dired
:ensure t
:bind (("C-," . peep-dired)))

(use-package sudo-edit
:ensure t)

(set-mouse-color "white")

(setq use-package-always-defer t)

(use-package auto-package-update
  :defer nil
  :ensure t
  :config
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-hide-results t)
  (auto-package-update-maybe))

(defun random-element (list)
  "Picks a random element from LIST"
    (nth (random (length list)) list))

  (defun random-file (dir)
    "Picks a random file or directory in DIR (doesn't include . or ..)"
    (random-element
     (directory-files
      (expand-file-name dir) t ".+..+")))


(defun agenda-setup ()
"Sets up agenda files"
(setq org-agenda-files (quote ("~/.emacs.d/notes.org")))
(auto-revert-mode))

    (use-package dashboard
      :ensure t
      :defer nil
      :config
      (defvar local-logos "~/.emacs.d/logos/")
      (dashboard-setup-startup-hook)
      (setq dashboard-items '((agenda . 10)
                              (recents . 10)))
      (if (file-exists-p local-logos)
          (setq dashboard-startup-banner (random-file local-logos)))
      (setq dashboard-banner-logo-title "YEAR OF THE LINUX DESKTOP!")
      (setq dashboard-set-init-info t)
      (setq dashboard-init-info (format "%d packages loaded in %s"
                                        (length package-activated-list) (emacs-init-time)))
      (setq dashboard-set-footer t)
      (setq dashboard-set-navigator t)
      (add-hook 'dashboard-mode-hook #'agenda-setup)
      )

(use-package diminish
:ensure t)

(use-package async
:ensure t
:init
(dired-async-mode 1))

(use-package which-key
:ensure t
:diminish which-key-mode
:init
(which-key-mode))

(use-package ido
   :init
   (ido-mode 1)
   :config
   (setq ido-enable-flex-matching nil)
   (setq ido-create-new-buffer 'always)
   (setq ido-everywhere t))

 (use-package ido-vertical-mode
   :ensure t
   :init
   (ido-vertical-mode 1))
 (setq ido-vertical-define-keys 'C-n-C-p-up-and-down)

(use-package smex
  :ensure t
  :init
  :bind
  ("M-x" . smex))

(use-package swiper
:ensure t
:bind ("C-s" . 'swiper))

(use-package avy
:ensure t
:bind
("M-s" . avy-goto-char))

(use-package magit
:ensure t)

(use-package spaceline
  :ensure t)
(use-package powerline
  :ensure t
  :init
  (spaceline-spacemacs-theme)
  :hook
  ('after-init-hook) . 'powerline-reset)

(use-package eldoc
:diminish eldoc-mode)

(use-package page-break-lines
:ensure t
:diminish (page-break-lines-mode visual-line-mode)) ;; por algum motivo não funciona aqui
(diminish 'visual-line-mode)

(use-package switch-window
    :ensure t
    :config
    (setq switch-window-input-style 'minibuffer)
    (setq switch-window-increase 4)
    (setq switch-window-threshold 2)
    (setq switch-window-shortcut-style 'qwerty)
    (setq switch-window-qwerty-shortcuts
          '("a" "s" "d" "f" "j" "k" "l"))
    :bind
    ([remap other-window] . switch-window))

(use-package beacon
:ensure t
:diminish beacon-mode
:init
(beacon-mode 1))

(use-package subword
:ensure t
:diminish subword-mode
:init
(global-subword-mode 1))
;;(global-subword-mode 1)

(use-package popup-kill-ring
  :ensure t
  :bind ("M-y" . popup-kill-ring))

(use-package abbrev
:diminish abbrev-mode)

(require 'pdf-tools)
(pdf-loader-install)

(use-package undo-fu
      :ensure t
  )
(global-unset-key (kbd "C-z"))
(global-set-key (kbd "C-;")   'undo-fu-only-undo)
(global-set-key (kbd "C-s-;") 'undo-fu-only-redo)

(use-package arduino-mode
  :ensure t)

(use-package magit
  :ensure t)

(use-package treemacs
    :ensure t
    :defer t
    :init
    (with-eval-after-load 'winum
      (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
    :config
    (progn
      (setq treemacs-collapse-dirs                   (if treemacs-python-executable 3 0)
            treemacs-deferred-git-apply-delay        0.5
            treemacs-directory-name-transformer      #'identity
            treemacs-display-in-side-window          t
            treemacs-eldoc-display                   'simple
            treemacs-file-event-delay                2000
            treemacs-file-extension-regex            treemacs-last-period-regex-value
            treemacs-file-follow-delay               0.2
            treemacs-file-name-transformer           #'identity
            treemacs-follow-after-init               t
            treemacs-expand-after-init               t
            treemacs-find-workspace-method           'find-for-file-or-pick-first
            treemacs-git-command-pipe                ""
            treemacs-goto-tag-strategy               'refetch-index
            treemacs-header-scroll-indicators        '(nil . "^^^^^^")
            treemacs-hide-dot-git-directory          t
            treemacs-indentation                     4
            treemacs-indentation-string              " "
            treemacs-is-never-other-window           nil
            treemacs-max-git-entries                 5000
            treemacs-missing-project-action          'ask
            treemacs-move-forward-on-expand          nil
            treemacs-no-png-images                   nil
            treemacs-no-delete-other-windows         t
            treemacs-project-follow-cleanup          nil
            treemacs-persist-file                    (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
            treemacs-position                        'left
            treemacs-read-string-input               'from-child-frame
            treemacs-recenter-distance               0.1
            treemacs-recenter-after-file-follow      nil
            treemacs-recenter-after-tag-follow       nil
            treemacs-recenter-after-project-jump     'always
            treemacs-recenter-after-project-expand   'on-distance
            treemacs-litter-directories              '("/node_modules" "/.venv" "/.cask")
            treemacs-project-follow-into-home        nil
            treemacs-show-cursor                     nil
            treemacs-show-hidden-files               t
            treemacs-silent-filewatch                nil
            treemacs-silent-refresh                  nil
            treemacs-sorting                         'alphabetic-asc
            treemacs-select-when-already-in-treemacs 'move-back
            treemacs-space-between-root-nodes        t
            treemacs-tag-follow-cleanup              t
            treemacs-tag-follow-delay                1.5
            treemacs-text-scale                      nil
            treemacs-user-mode-line-format           nil
            treemacs-user-header-line-format         nil
            treemacs-wide-toggle-width               70
            treemacs-width                           35
            treemacs-width-increment                 1
            treemacs-width-is-initially-locked       t
            treemacs-workspace-switch-cleanup        nil)

      ;; The default width and height of the icons is 22 pixels. If you are
      ;; using a Hi-DPI display, uncomment this to double the icon size.
      ;;(treemacs-resize-icons 44)

      (treemacs-follow-mode t)
      (treemacs-filewatch-mode t)
      (treemacs-fringe-indicator-mode 'always)
      (when treemacs-python-executable
        (treemacs-git-commit-diff-mode t))

      (pcase (cons (not (null (executable-find "git")))
                   (not (null treemacs-python-executable)))
        (`(t . t)
         (treemacs-git-mode 'deferred))
        (`(t . _)
         (treemacs-git-mode 'simple)))

      (treemacs-hide-gitignored-files-mode nil))
    :bind
    (:map global-map
          ("M-0"       . treemacs-select-window)
          ("C-x t 1"   . treemacs-delete-other-windows)
          ("C-x t t"   . treemacs)
          ("C-x t d"   . treemacs-select-directory)
          ("C-x t B"   . treemacs-bookmark)
          ("C-x t C-t" . treemacs-find-file)
          ("C-x t M-t" . treemacs-find-tag)))
    (use-package treemacs-tab-bar ;;treemacs-tab-bar if you use tab-bar-mode
      :after (treemacs)
      :ensure t
      :config (treemacs-set-scope-type 'Tabs))
  
      (use-package lsp-treemacs
        :ensure t)
(use-package treemacs-projectile
  :after (treemacs projectile)
  :ensure t)

(use-package projectile
  :ensure t
  :init
  (projectile-mode +1)
  :config
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

(use-package tab-bar
  :bind (:map tab-prefix-map ("p" . my/new-project-tab))
  :init
  (defun my/new-project-tab ()
    (interactive)
    (other-tab-prefix)
    (projectile-switch-project)
    (tab-rename (projectile-project-name))))

(use-package elcord
  :ensure t
  :init
  (elcord-mode))

(use-package lsp-mode
          :ensure t
          :diminish
          :init
          ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
          (setq lsp-keymap-prefix "C-c l")
          :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
                 (rust-mode . lsp)
                 (c-mode . lsp)
                 ;; if you want which-key integration
                 (lsp-mode . lsp-enable-which-key-integration))
          :commands lsp)

        ;; optionally
        (use-package lsp-ui
          :ensure t
          :commands lsp-ui-mode
          :config
          (setq lsp-enable-symbol-highlighting t)
          (setq lsp-ui-doc-enable t)
          (setq lsp-completion-show-detail t)
          (setq lsp-completion-show-kind t)
          (setq lsp-ui-sideline-delay 0)
          (setq lsp-ui-sideline-show-diagnostics t)
          (setq lsp-ui-sideline-show-code-actions t)
          (setq lsp-ui-doc-show-with-cursor nil)
          (setq lsp-ui-doc-show-with-mouse t)
          (setq lsp-headerline-breadcrumb-enable t)
          (setq lsp-ui-sideline-enable t)
          (setq lsp-modeline-code-actions-enable t)
          (setq lsp-ui-sideline-show-diagnostics t)
          (setq lsp-enable-snippet nil)
          (setq company-lsp-enable-snippet nil)
          )

  (use-package lsp-ivy
    :commands lsp-ivy-workspace-symbol
    )
  (with-eval-after-load 'lsp-mode
  (add-to-list 'lsp-language-id-configuration
               '(arduino-mode . "arduino"))

(lsp-register-client
 (make-lsp--client :new-connection (lsp-stdio-connection '("arduino-language-server"
                                                           "-clangd" "clangd"
                                                           "-cli" "arduino-cli"
                                                           "-cli-config" "/home/maria/.arduino15/arduino-cli.yaml"
                                                           "-fqbn" "arduino:avr:uno"))
                   :activation-fn (lsp-activate-on "arduino")
                   :server-id 'arduino-language-server)))

(ivy-mode)
(diminish 'ivy-mode)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
;; enable this if you want `swiper' to use it
;; (setq search-default-mode #'char-fold-to-regexp)
(global-set-key "\C-s" 'swiper)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (global-set-key (kbd "C-c C-r") 'ivy-resume)								 ;;
;; (global-set-key (kbd "<f6>") 'ivy-resume)								 ;;
;; (global-set-key (kbd "M-x") 'counsel-M-x)								 ;;
;; (global-set-key (kbd "C-x C-f") 'counsel-find-file)						 ;;
;; (global-set-key (kbd "<f1> f") 'counsel-describe-function)				 ;;
;; (global-set-key (kbd "<f1> v") 'counsel-describe-variable)				 ;;
;; (global-set-key (kbd "<f1> o") 'counsel-describe-symbol)					 ;;
;; (global-set-key (kbd "<f1> l") 'counsel-find-library)					 ;;
;; (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)				 ;;
;; (global-set-key (kbd "<f2> u") 'counsel-unicode-char)					 ;;
;; (global-set-key (kbd "C-c g") 'counsel-git)								 ;;
;; (global-set-key (kbd "C-c j") 'counsel-git-grep)							 ;;
;; (global-set-key (kbd "C-c k") 'counsel-ag)								 ;;
;; (global-set-key (kbd "C-x l") 'counsel-locate)							 ;;
;; (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)						 ;;
;; (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history) ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package company
  :ensure t
  :diminish company-mode company-box-mode
  :init
  (add-hook 'after-init-hook 'global-company-mode)
  :config
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 3)
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous)
  (define-key company-active-map (kbd "SPC") #'company-abort)
  )
(use-package company-box
  :ensure t
  :diminish company-box-mode
  :hook (company-mode . company-box-mode )
  )
(use-package company-arduino
  :ensure t
  :diminish company-arduino
  )

(use-package company-c-headers
  :defer nil
  :ensure t)

(require 'rust-mode)
(use-package rustic
  :ensure t)
(setq rustic-analyzer-command '("~/.cargo/bin/rust-analyzer"))

(yas-global-mode 1)
(diminish 'yas-minor-mode)
(add-hook 'prog-mode-hook #'yas-minor-mode)

(defun kill-whole-line()
 (interactive)
 (beginning-of-line)
 (kill-line 1))
(global-set-key (kbd "C-c w k") 'kill-whole-line)

(defun kill-whole-word()
  (interactive)
  (backward-word)
  (kill-word 1))
(global-set-key (kbd "C-c w w") 'kill-whole-word)

(defun copy-whole-line ()
    (interactive)
    (save-excursion
      (kill-new
       (buffer-substring
        (point-at-bol)
        (point-at-eol)))))
(global-set-key (kbd "C-c w l") 'copy-whole-line)

(defun kill-all-buffers()
(interactive)
(mapc 'kill-buffer (buffer-list)))

(defun eshell-other-window ()
  "Create or visit an eshell buffer."
  (interactive)
  (if (not (get-buffer "*eshell*"))
      (progn
        (split-window-sensibly (selected-window))
        (other-window 1)
        (eshell))

    (switch-to-buffer-other-window "*eshell*")))

(global-set-key (kbd "<C-return>") 'eshell-other-window)

(defun split-and-follow-horizontally ()
       (interactive)
       (split-window-below)
       (balance-windows)
       (other-window 1))
(global-set-key (kbd "C-x 2") 'split-and-follow-horizontally)

(defun split-and-follow-vertically ()
       (interactive)
       (split-window-right)
       (balance-windows)
       (other-window 1))
(global-set-key (kbd "C-x 3") 'split-and-follow-vertically)

(global-set-key (kbd "C-c g") 'gdb)

(defun insert-a ()
  (interactive)
  (insert "\\"))

(defun insert-b ()
  (interactive)
  (insert "|"))

(global-set-key ( kbd"C-x l") 'insert-a)
(global-set-key (kbd "C-x ç") 'insert-b)

(shell-command "fc-cache -r")
(set-frame-font "xos4 terminus 12" nil t)

(use-package timu-macos-theme
  :ensure t)
;;(load-theme 'timu-macos)
