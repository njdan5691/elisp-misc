;;; elisp-misc.el --- Dan Misc elisp functions
;;
;; Author: Daniel <njdan.5691@gmail.com>
;; Keywords: lisp
;; Version: 0.0.1

;;; Commentary:

;; No Comments

;;; Code:

;;;###autoload
(defun elispm:reformat-buffer()
  (interactive)
  (save-excursion
    (delete-trailing-whitespace)
    (indent-region (point-min) (point-max) nil)))

;;;###autoload
(defun elispm:toggle-tab-width ()                                                                     
  (interactive)
  (cond ((= 8 tab-width) (setq tab-width 1))
        ((= 1 tab-width) (setq tab-width 2))
        ((= 2 tab-width) (setq tab-width 4))
        ((= 4 tab-width) (setq tab-width 6))
        ((= 6 tab-width) (setq tab-width 8))))

;;;###autoload
(defun elispm:find-file-init ()    
  "Function to visit init.el"
  (interactive)
  (find-file (expand-file-name "~/.emacs.d/init.el")))

;;;###autoload
(defun elispm:align-table (beg end)
  (interactive "r")
  (flush-lines "^$" beg end)
  (replace-string " |" "|" nil beg end)
  (replace-string "| " "|" nil beg end)
  (align-regexp beg end "\\(\\s-*\\)|" 1 0 "y")
  (sort-lines t beg end))

;;;###autoload
(defun elispm:unhtml (start end)
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


(provide 'elisp-misc)
;;; elisp-misc.el ends here
