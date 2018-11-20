;;; ~/dotfiles/dots/emacs/doom/themes/doom-gruvbox-dark-theme.el -*- lexical-binding: t; -*-

;;; doom-gruvbox-dark-theme.el --- inspired by Gruvbox Dark
(require 'doom-themes)

;;
(defgroup doom-gruvbox-dark-theme nil
  "Options for doom-themes"
  :group 'doom-themes)

(defcustom doom-gruvbox-dark-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'doom-gruvbox-dark-theme
  :type 'boolean)

(defcustom doom-gruvbox-dark-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'doom-gruvbox-dark-theme
  :type 'boolean)

(defcustom doom-gruvbox-dark-comment-bg doom-gruvbox-dark-brighter-comments
  "If non-nil, comments will have a subtle, darker background. Enhancing their
legibility."
  :group 'doom-gruvbox-dark-theme
  :type 'boolean)

(defcustom doom-gruvbox-dark-padded-modeline nil
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to
determine the exact padding."
  :group 'doom-gruvbox-dark-theme
  :type '(or integer boolean))

;;
(def-doom-theme doom-gruvbox-dark
  "Doom gruvbox-dark theme"

  ;; name        default   256       16
  ((bg         '("#282828" "#262626" nil            ))
   (bg-alt     '("#32302f" "#303030" nil            ))
   (base0      '("#3c3836" "#3a3a3a" "black"        ))
   (base1      '("#504945" "#4e4e4e" "brightblack"  ))
   (base2      '("#665c54" "#626262" "brightblack"  ))
   (base3      '("#7c6f64" "#767676" "brightblack"  ))
   (base4      '("#928374" "#8a8a8a" "brightblack"  ))
   (base5      '("#a89984" "#949494" "brightblack"  ))
   (base6      '("#bdae93" "#a8a8a8" "brightblack"  ))
   (base7      '("#d5c4a1" "#bcbcbc" "brightblack"  ))
   (base8      '("#ebdbb2" "#ffdfaf" "white"        ))
   (fg-alt     '("#f2e5bc" "#ffffaf" "brightwhite"  ))
   (fg         '("#fbf1c7" "#ffffaf" "white"        ))

   (grey       base4)
   (red        '("#FB4934" "#D75F5F" "red"          ))
   (orange     '("#FE8019" "#FF8700" "brightred"    ))
   (green      '("#98971A" "#878700" "green"        ))
   (teal       '("#B8BB26" "#AFAF00" "brightgreen"  ))
   (yellow     '("#FABD2F" "#FFAF00" "yellow"       ))
   (blue       '("#83A598" "#87AF87" "brightblue"   ))
   (dark-blue  '("#458588" "#5F8787" "blue"         ))
   (magenta    '("#D3869B" "#D78787" "magenta"      ))
   (violet     '("#B16286" "#AF5F87" "brightmagenta"))
   (cyan       '("#8EC07C" "#87AF87" "brightcyan"   ))
   (dark-cyan  '("#689D6A" "#5FAF5F" "cyan"         ))

   ;; face categories -- required for all themes
   (highlight      grey)
   (vertical-bar   (doom-lighten bg 0.05))
   (selection      base0)
   (builtin        orange)
   (comments       (if doom-gruvbox-dark-brighter-comments base4 base3))
   (doc-comments   (doom-lighten (if doom-gruvbox-dark-brighter-comments teal green) 0.25))
   (constants      magenta)
   (functions      yellow)
   (keywords       red)
   (methods        red)
   (operators      red)
   (type           magenta)
   (strings        teal)
   (variables      blue)
   (numbers        magenta)
   (region         base1)
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    orange)
   (vc-added       green)
   (vc-deleted     red)

   ;; custom categories
   (hidden     `(,(car bg) "black" "black"))
   (-modeline-bright doom-gruvbox-dark-brighter-modeline)
   (-modeline-pad
    (when doom-gruvbox-dark-padded-modeline
      (if (integerp doom-gruvbox-dark-padded-modeline) doom-gruvbox-dark-padded-modeline 4)))

   (modeline-fg     nil)
   (modeline-fg-alt base5)

   (modeline-bg
    (if -modeline-bright
        base3
        `(,(doom-darken (car bg) 0.15) ,@(cdr base0))))
   (modeline-bg-l
    (if -modeline-bright
        base3
        `(,(doom-darken (car bg) 0.1) ,@(cdr base0))))
   (modeline-bg-inactive   (doom-darken bg 0.1))
   (modeline-bg-inactive-l `(,(car bg) ,@(cdr base1))))


  ;; --- extra faces ------------------------
  ((elscreen-tab-other-screen-face :background "#353a42" :foreground "#1e2022")

   ((line-number &override) :foreground fg-alt)
   ((line-number-current-line &override) :foreground fg)
   ((line-number &override) :background (doom-darken bg 0.025))

   (font-lock-comment-face
    :foreground comments
    :background (if doom-gruvbox-dark-comment-bg (doom-lighten bg 0.05)))
   (font-lock-doc-face
    :inherit 'font-lock-comment-face
    :foreground doc-comments)

   (doom-modeline-bar :background (if -modeline-bright modeline-bg highlight))

   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
   (mode-line-emphasis
    :foreground (if -modeline-bright base8 highlight))
   (mode-line-buffer-id
    :foreground highlight)

   (solaire-mode-line-face
    :inherit 'mode-line
    :background modeline-bg-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-l)))
   (solaire-mode-line-inactive-face
    :inherit 'mode-line-inactive
    :background modeline-bg-inactive-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive-l)))

   (telephone-line-accent-active
    :inherit 'mode-line
    :background (doom-lighten bg 0.2))
   (telephone-line-accent-inactive
    :inherit 'mode-line
    :background (doom-lighten bg 0.05))

   ;; --- major-mode faces -------------------
   ;; css-mode / scss-mode
   (css-proprietary-property :foreground orange)
   (css-property             :foreground green)
   (css-selector             :foreground blue)

   ;; markdown-mode
   (markdown-markup-face :foreground base5)
   (markdown-header-face :inherit 'bold :foreground red)
   (markdown-code-face :background (doom-lighten base3 0.05))

   ;; org-mode
   (org-hide :foreground hidden)
   (org-block            :background (doom-darken bg 0.05) :foreground base8)
   (org-block-begin-line :background (doom-darken bg 0.05) :foreground grey)
   (solaire-org-hide-face :foreground hidden)
   (org-block-background :background base0)
   (org-block-end-line   :inherit 'org-block-begin-line)

   (org-level-1
    :foreground blue :background (doom-darken bg 0.025)
    :bold bold :height 1.2))


  ;; --- extra variables ---------------------
  ;; ()
  )

;;; doom-gruvbox-dark-theme.el ends here
