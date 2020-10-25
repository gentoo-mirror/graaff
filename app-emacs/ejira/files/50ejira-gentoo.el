;;; ejira site-lisp configuration

(add-to-list 'load-path "@SITELISP@")

(autoload 'ejira-update-my-projects "ejira" "Synchronize data on projects listed in ejira-projects")
(autoload 'ejira-set-deadline "ejira" "Wrapper around `org-deadline' which pushes the changed deadline to server.")
(autoload 'ejira-set-priority "ejira" "Set priority of the issue under point.")
(autoload 'ejira-assign-issue "ejira" "Set the assignee of the issue under point.")
(autoload 'ejira-progress-issue "ejira" "Progress the issue under point with a selected action.")
(autoload 'ejira-set-issuetype "ejira" "Select a new issuetype for the issue under point.")
(autoload 'ejira-set-epic "ejira" "Select a new epic for the issue under point.")
(autoload 'ejira-focus-on-issue "ejira" "Open an indirect buffer narrowed to issue KEY.")
(autoload 'ejira-focus-on-clocked-issue "ejira" "Goto current or last clocked item, and narrow to it, and expand it.")
(autoload 'ejira-focus-item-under-point "ejira" "And narrow to item under point, and expand it.")
(autoload 'ejira-focus-up-level "ejira" "Try to focus the parent item of the item under point.")

