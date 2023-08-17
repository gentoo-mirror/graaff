;;; rbs-mode site-lisp configuration

(add-to-list 'load-path "@SITELISP@")

(autoload 'rbs-mode "rbs-mode" "Major mode for RBS files" t)

(add-to-list 'auto-mode-alist '("\\.rbs\\'" . rbs-mode))
