
;;; rg.el site-lisp configuration

(add-to-list 'load-path "@SITELISP@")
(autoload 'rg-enable-default-bindings "rg.el" "" t)
(autoload 'rg-use-old-defaults "rg.el" "" t)
(autoload 'rg-enable-menu "rg.el" "" t)
(autoload 'rg-define-search "rg.el" "" t)
(autoload 'rg-project "rg.el" "" t)
(autoload 'rg-dwim-project-dir "rg.el" "" t)
(autoload 'rg-dwim-current-dir "rg.el" "" t)
(autoload 'rg-dwim-current-file "rg.el" "" t)
(autoload 'rg-dwim "rg.el" "" t)
(autoload 'rg-literal "rg.el" "" t)
(autoload 'rg "rg.el" "" t)
