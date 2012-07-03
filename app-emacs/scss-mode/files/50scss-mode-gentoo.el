
;;; scss-mode site-lisp configuration

(add-to-list 'load-path "@SITELISP@")
(add-to-list 'auto-mode-alist '("\\.scss$" . scss-mode))
(autoload 'coffee-mode "scss-mode" "Mode for editing SCSS stylesheets")
