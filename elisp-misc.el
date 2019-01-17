(defun align-table (beg end)
  (interactive "r")
  (flush-lines "^$" beg end)
  (replace-string " |" "|" nil beg end)
  (replace-string "| " "|" nil beg end)
  (align-regexp beg end "\\(\\s-*\\)|" 1 0 "y")
  (sort-lines t beg end))

(defun unhtml (start end)
  (interactive "r")
  (save-excursion
    (save-restriction
      (narrow-to-region start end)
      (goto-char (point-min))
      (replace-string "&" "&amp;")
      (goto-char (point-min))
      (replace-string "<" "&lt;")
      (goto-char (point-min))
      (replace-string ">" "&gt;")
      )))


