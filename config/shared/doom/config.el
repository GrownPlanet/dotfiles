;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept.

(setq doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 16 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "JetBrainsMono Nerd Font" :size 16))

;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)
;; Specify both a dark and light theme, like so and Doom will choose which one
;; to load based on your system light/dark setting:
;;
;;   (setq doom-theme '(doom-one   . doom-one-light))   ; (DARK . LIGHT)
;;
;; If you want more pro-active theme switching based on OS light/dark mode, look
;; up the `auto-dark' package.

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode 1)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `with-eval-after-load' block, otherwise Doom's defaults may override your
;; settings. E.g.
;;
;;   (with-eval-after-load 'PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look them up).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
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

;; no automatic clipboard sync
(setq select-enable-clipboard nil)

;; spelling in dutch
(setq ispell-dictionary "nl_BE")

;; Enable visual line mode automatically for text & org buffers
(add-hook 'text-mode-hook #'visual-line-mode)

;; Rebind j/k (and arrow keys) to move by visual lines in Normal and Visual modes
(with-eval-after-load 'evil
  (define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
  (define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)
  (define-key evil-visual-state-map (kbd "j") 'evil-next-visual-line)
  (define-key evil-visual-state-map (kbd "k") 'evil-previous-visual-line))

;; dynamic font size in org notes
(custom-set-faces!
  '(org-level-1 :inherit outline-1 :height 1.35)
  '(org-level-2 :inherit outline-2 :height 1.25)
  '(org-level-3 :inherit outline-3 :height 1.15)
  '(org-level-4 :inherit outline-4 :height 1.10)
  '(org-level-5 :inherit outline-5 :height 1.05))

;; yank/paste from/to system clipboard
(map! :leader
      :nv "y" "\"+y"   ; SPC y: yank to clipboard
      :nv "k" "\"+p"   ; SPC k: paste after
      :nv "K" "\"+P")  ; SPC K: paste before

;; map U to undo
(map! :n "U" "C-r")

;; images!
(setq org-startup-with-inline-images t)

(after! org
  (setq org-preview-latex-default-process 'dvisvgm)
  (plist-put org-format-latex-options :scale 1))

;; paste images
(after! org-download
  (setq org-download-method 'directory
        org-download-image-dir "assets"
        org-download-heading-lvl nil
        org-download-timestamp "%Y%m%d-%H%M%S_"
        org-download-screenshot-method "wl-paste -t image/png > %s"))

;; scroll margin when moving through text
(setq scroll-margin 8)

;; no highlighting after searching
(setq evil-ex-search-persistent-highlight nil
      evil-ex-interactive-search-highlight nil)

;; export the file using pandoc (because the built-in compilation SUCKS)
(defun export-pdf ()
  "Export the current buffer's file to PDF using pandoc in the background."
  (interactive)
  (if-let ((file (buffer-file-name)))
      (let* ((output (concat (file-name-sans-extension file) ".pdf"))
             (proc (start-process "pandoc-pdf" nil
                                  "pandoc" file "-o" output
                                  "--pdf-engine=xelatex"
                                  "-V" "geometry:margin=2.5cm"
                                  "-V" "fontsize=11pt"
                                  "-V" "linestretch=1.25"
                                  "-V" "mainfont=Latin Modern Roman"
                                  "-V" "colorlinks=true"
                                  "-V" "papersize=a4")))
        (message "Compiling PDF in the background...")
        (set-process-sentinel
         proc
         (lambda (_process event)
           (when (string-prefix-p "finished" event)
             (message "PDF compilation complete: %s" (file-name-nondirectory output))))))
    (message "Buffer is not visiting a file!")))

(defun export-html ()
  "Export the current buffer's file to HTML using pandoc in the background."
  (interactive)
  (if-let ((file (buffer-file-name)))
      (let* ((output (concat (file-name-sans-extension file) ".html"))
             (proc (start-process "pandoc-html" nil
                                  "pandoc" file "-o" output
                                  "--standalone"
                                  "--highlight-style=pygments")))
        (message "Compiling HTML in the background...")
        (set-process-sentinel
         proc
         (lambda (_process event)
           (when (string-prefix-p "finished" event)
             (message "HTML compilation complete: %s" (file-name-nondirectory output))))))
    (message "Buffer is not visiting a file!")))
