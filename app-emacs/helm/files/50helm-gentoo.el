;;; helm site-lisp configuration

;; helm-config does basic preparation like setting up autoloads but
;; will not load helm or turn on Helm minor mode.

(add-to-list 'load-path "@SITELISP@")
(require 'helm-config)
