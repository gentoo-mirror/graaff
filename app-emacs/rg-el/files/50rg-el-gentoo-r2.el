(add-to-list 'load-path "@SITELISP@")

(autoload 'rg-menu "rg-menu" "" t)
(autoload 'rg-enable-menu "rg-menu" "" t)

(defvar rg-keymap-prefix "\3s" "\
Prefix for global `rg' keymap.")
(custom-autoload 'rg-keymap-prefix "rg" t)
(autoload 'rg-command-line-flags-function "rg" "" nil)
(autoload 'rg-enable-default-bindings "rg" "" t)
(autoload 'rg-use-old-defaults "rg" "" t)
(autoload 'rg-define-search "rg" "" t)
(autoload 'rg-project "rg" "" t)
(autoload 'rg-dwim-project-dir "rg" "" t)
(autoload 'rg-dwim-current-dir "rg" "" t)
(autoload 'rg-dwim-current-file "rg" "" t)
(autoload 'rg-dwim "rg" "" t)
(autoload 'rg-literal "rg" "" t)
(autoload 'rg "rg" "" t)
