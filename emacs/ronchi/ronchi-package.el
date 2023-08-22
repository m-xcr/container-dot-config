;;; ronchi-package.el --- My customizations related to Emacs package management.

;;; Commentary:
;;

;;; Code:

(defun ronchi/install-packages (custom-packages)
  "Install my custom packages list."
  (dolist (package custom-packages)
    (if (package-installed-p (intern package))
	(message (format "Package '%s' already installed, skipping it." package))
      (progn
	(message (format "Package '%s' not yet installed. Installing it ..." package))
	(package-install (intern package))))))

(provide 'ronchi-package)

;;; ronchi-package.el ends here
