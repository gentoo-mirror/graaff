
;;; dockerfile-mode site-lisp configuration

(add-to-list 'load-path "@SITELISP@")
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))
(autoload 'dockerfile-mode "dockerfile-mode" "Mode for editing Dockerfiles")
