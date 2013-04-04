;;; htwi.el --- ひとりtwitterみたいなやつ

;; Copyright (C) 2012  Masashi Oyamada

;; Author: Masashi Oyamada <marcy8468@gmail.com>
;; Keywords: tools

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; 


;;; Code:
(defvar htwi-dir "/tmp/")
(defvar htwi-file-ext ".txt")
(defvar htwi-format "%H:%M:%S")
(defvar htwi-file-string "")

(defun htwi ()
  (interactive)
  (with-current-buffer (get-buffer-create "htwi")
    (let ((fname (concat htwi-dir (format-time-string "%Y%m%d") htwi-file-ext)))
      (erase-buffer)
      (if (file-exists-p fname)
          (insert-file-contents fname)
        (insert htwi-file-string))
      (goto-char (point-max))
      (insert (format-time-string htwi-format)
              (format-time-string " ")
              (read-from-minibuffer "htwi: " "")
              "\n")
      (write-region (point-min) (point-max) fname))))

(provide 'htwi)
;;; htwi.el ends here
