;;; org-s5.el --- helpers for s5 org export

;; Copyright (C) 2009  Free Software Foundation, Inc.

;; Author: Yann Hodique <yann.hodique@gmail.com>
;; Keywords:

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;;; Commentary:

;;

;;; Code:

(defvar org-s5-html-preamble-header nil)
(defvar org-s5-html-preamble-footer nil)

(defun org-s5-string-or-call (v)
  (or
   (and org-s5-html-preamble-footer
        (or (and (functionp v)
                 (funcall v))
            (and (stringp v) v)))
   ""))

(defun org-s5-html-preamble-function (&rest ignore)
  (when (and (boundp 'html-pre-real-contents)
             (null html-pre-real-contents))
    (setq html-pre-real-contents ""))
  (insert (format "<div class='layout'>
<div id='controls'></div>
<div id='currentSlide'></div>
<div id='header'>%s</div>
<div id='footer'>%s</div>
</div>
<div class='presentation'>
<div class='slide front'>
  <div id='front-logo'></div>
<h1 class='front'>%s</h1><h3>%s</h3></div>"
                  (org-s5-string-or-call org-s5-html-preamble-header)
                  (org-s5-string-or-call org-s5-html-preamble-footer)
                  title author)))

(defun org-s5-html-postamble-function (&rest ignore)
  (insert "</div>"))

(provide 'org-s5)
;;; org-s5.el ends here
