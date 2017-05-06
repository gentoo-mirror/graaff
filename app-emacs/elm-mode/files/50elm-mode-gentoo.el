
;;; coffee-mode site-lisp configuration

(add-to-list 'load-path "@SITELISP@")
(add-to-list 'auto-mode-alist '("\\.elm\\'" . elm-mode))

(autoload 'elm-mode "elm" "Mode for editing Elm")

