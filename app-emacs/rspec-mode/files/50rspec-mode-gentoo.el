
;;; rspec-mode site-lisp configuration

(add-to-list 'load-path "@SITELISP@")

(autoload 'rspec-mode "rspec-mode" "Minor mode for RSpec files" t)
(autoload 'rspec-verifiable-mode "rspec-mode" "Minor mode for Ruby files that have specs" t)
(autoload 'rspec-dired-mode "rspec-mode" "Minor mode for Dired buffers with spec files" t)
(autoload 'rspec-enable-appropriate-mode "rspec-mode")

(dolist (hook '(ruby-mode-hook ruby-ts-mode-hook enh-ruby-mode-hook))
  (add-hook hook 'rspec-enable-appropriate-mode))
(add-hook 'rails-minor-mode-hook 'rspec-verifiable-mode)
