;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Taine Fan"
      user-mail-address "fty221@gmail.com")

(setq mac-option-modifier 'meta
      mac-command-modifier 'super)

;; Key bindings
(map! "C-x h" #'previous-buffer
      "C-x l" #'next-buffer)

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;;
;; (setq doom-theme 'doom-gruvbox)
;; (setq doom-theme 'doom-material)
;; (setq doom-theme 'doom-material-dark)
;; (setq doom-theme 'doom-solarized-dark)
;; (setq doom-theme 'doom-solarized-light)
;; (setq doom-theme 'doom-oceanic-next)
;; (setq doom-theme 'doom-dracula)
;; (setq doom-theme 'doom-one)
(add-to-list 'load-path "~/.doom.d/ef-themes/")
(require 'ef-themes)
(load-theme 'ef-night t)

;; (use-package emacs
;;   :init
;;   (setq modus-themes-italic-constructs t
;;         modus-themes-bold-constructs nil
;;         modus-themes-region '(bg-only no-extend))
;;   :config
;;   (load-theme 'modus-vivendi) ;; OR (load-theme 'modus-vivendi)
;;   :bind ("<f5>" . modus-themes-toggle))

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq tensakai/org-agenda-directory "~/org/")
(after! org
  (setq org-capture-templates
      `(("i" "inbox" entry (file ,(concat tensakai/org-agenda-directory "inbox.org"))
         "* TODO %?")
        ("l" "link" entry (file ,(concat tensakai/org-agenda-directory "inbox.org"))
         "* TODO %(org-cliplink-capture)" :immediate-finish t)
        ("b" "bookmark" entry (file ,(concat tensakai/org-agenda-directory "bookmark.org"))
         "* TODO %(org-cliplink-capture)" :immediate-finish t)
        ("c" "org-protocol-capture" entry (file ,(concat tensakai/org-agenda-directory "inbox.org"))
         "* TODO [[%:link][%:description]]\n\n %i" :immediate-finish t))))

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; (setq doom-font (font-spec :family "Iosevka" :size 18 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "Iosevka") ; inherits `doom-font''s :size
;;       doom-unicode-font (font-spec :family "Iosevka" :size 18)
;;       doom-big-font (font-spec :family "Iosevka" :size 19))

(setq doom-font (font-spec :family "Sarasa Mono SC Nerd" :size 16 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "Sarasa Mono SC Nerd") ; inherits `doom-font''s :size
      doom-unicode-font (font-spec :family "Sarasa Mono SC Nerd" :size 16)
      doom-big-font (font-spec :family "Sarasa Mono SC Nerd" :size 16))

(add-to-list 'initial-frame-alist '(fullscreen . maximized))

(setq global-evil-matchit-mode 1)

(add-hook 'after-init-hook 'nyan-mode)
(add-hook 'after-init-hook #'rainbow-delimiters-mode)

;; (add-hook 'after-save-hook 'elixir-format)

(super-save-mode +1)
(setq super-save-auto-save-when-idle t)
(add-to-list 'super-save-hook-triggers 'find-file-hook)
(setq super-save-remote-files nil)
(setq super-save-exclude '(".gpg"))

(let ((alternatives '("doomEmacs.svg"
                      "doomEmacsTokyoNight.svg"
                      "doomEmacsDoomOne.svg"
                      "doomEmacsDracula.svg"
                      "doomEmacsGruvbox.svg"
                      "doomEmacsRouge.svg"
                      "doomEmacsSolarized.svg"
                      "doomEmacsShadow.svg")))
  (setq fancy-splash-image
        (concat doom-private-dir "splash/"
                (nth (random (length alternatives)) alternatives))))

(use-package! lsp-bridge
  :config
  (map! :map acm-mode-map
        [tab]           #'acm-select-next
        [backtab]       #'acm-select-prev)
  (map! :map doom-leader-code-map
        :desc "LSP Rename"
        "r"             #'lsp-bridge-rename
        :desc "LSP Find declaration"
        "j"             #'lsp-bridge-find-def)
  (require 'yasnippet)
  (yas-global-mode 1)
  (global-lsp-bridge-mode))

(set-email-account!
 "gmail"
 '((mu4e-sent-folder       . "/[Gmail]/Sent Mail")
   (mu4e-trash-folder      . "/[Gmail]/Bin")
   (smtpmail-smtp-user     . "fty221@gmail.com"))
 t)
(setq mu4e-get-mail-command "mbsync gmail"
      ;; get emails and index every 5 minutes
      mu4e-update-interval 300
	  ;; send emails with format=flowed
	  mu4e-compose-format-flowed t
	  ;; no need to run cleanup after indexing for gmail
	  mu4e-index-cleanup nil
	  mu4e-index-lazy-check t
      ;; more sensible date format
      mu4e-headers-date-format "%d.%m.%y")
(setq mu4e-headers-buffer-name "*mu4e-headers*")
