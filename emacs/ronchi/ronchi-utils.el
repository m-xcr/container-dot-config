;;; ronchi-utils.el --- My utility functions.  -*- lexical-binding: t; -*-

;;; Commentary:
;;

;;; Code:

(defun ronchi/org-insert-status-update ()
  "Inserts status update at top of current headline body"
  (interactive)
  (org-next-visible-heading (- 1))
  (end-of-line)
  (newline-and-indent 2)
  (insert (format "Update %s: " (format-time-string "%d %b %Y"))))

(defun ronchi/insert-curr-date ()
  "Insert (print) the current day and month at current buffer point."
  (interactive)
  (insert (format-time-string "%d %b %Y")))

(defun ronchi/message-curr-time ()
  (interactive)
  (message (format-time-string "%A, %d %b %Y, %H:%M:%S")))

(provide 'ronchi-utils)

;;; ronchi-utils.el ends here
