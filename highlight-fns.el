;;; highlight-fns.el --- Highlight called Lisp functions.
;; 
;; Filename: highlight-fns.el
;; Description: Highlight called Lisp functions.
;; Author: Drew Adams
;; Maintainer: Drew Adams
;; Copyright (C) 2013, Drew Adams, all rights reserved.
;; Created: Sat Aug 17 13:59:36 2013 (-0700)
;; Version: 0
;; Package-Requires: ()
;; Last-Updated: Sat Aug 17 15:32:11 2013 (-0700)
;;           By: dradams
;;     Update #: 38
;; URL: http://www.emacswiki.org/highlight-fns.el
;; Doc URL: http://emacswiki.org/HighlightLispFunctions
;; Keywords: highlight, lisp, functions
;; Compatibility: GNU Emacs: 22.x, 23.x, 24.x
;; 
;; Features that might be required by this library:
;;
;;   None
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;; Commentary: 
;; 
;;    A minor mode that highlights function calls in Emacs-Lisp mode.
;;
;;  Put this in your init file:
;;
;;    (require 'highlight-fns)
;;
;;  `highlight-lisp-fns-mode', is a toggle command that turns the
;;  highlighting on/off in the current buffer, which should be in
;;  Emacs-Lisp mode.
;;
;;  If you want to turn on this highlighting automatically whenever
;;  you enter Emacs-Lisp mode then you can do this in your init file:
;;
;;    (require 'highlight-fns)
;;    (add-hook 'emacs-lisp-mode-hook 'highlight-lisp-fns-mode 'APPEND)
;;
;;  The highlighting works by identifying a known function in the car
;;  of a list.  This means that it can sometimes highlight when it
;;  should not and fail to highlight when it should, as follows:
;;
;;  * The name of a known function as the car of a list that is not
;;    a function call is highlighted.  For example:
;;
;;    (let ((setq  (foobar)))...) ; `setq' is a variable here.
;;
;;  * A function argument that is invoked by a higher-order function
;;    is not highlighted.  Only functions in the car of a list are
;;    highlighted.  For example:
;;
;;    (funcall #'max '(41 42 3 4 52)) ; `max' is not highlighted.
;;
;;
;;  Faces defined here:
;;
;;    `highlight-lisp-fns'.
;;
;;  Commands defined here:
;;
;;    `highlight-lisp-fns-mode'.
;;
;;  Non-interactive functions defined here:
;;
;;    `highlight-lisp-fns'.
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;; Change Log:
;;
;; 2013/08/17 dadams
;;     Created.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 3, or
;; (at your option) any later version.
;; 
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;; 
;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth
;; Floor, Boston, MA 02110-1301, USA.
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;; Code:

(defface highlight-lisp-fns
    '((t (:inherit font-lock-constant-face)))
  "Face used to highlight called Lisp functions."
  :group 'programming :group 'faces)

(define-minor-mode highlight-lisp-fns-mode
    "Toggle highlighting called Lisp functions in the current buffer.
The buffer should be in Emacs-Lisp mode.
With prefix ARG, turn the mode on if ARG is positive, off otherwise."
  :group 'programming
  :link `(url-link :tag "Send Bug Report"
                   ,(concat "mailto:" "drew.adams" "@" "oracle" ".com?subject=\
highlight-fns.el bug: \
&body=Describe bug here, starting with `emacs -Q'.  \
Don't forget to mention your Emacs and library versions."))
  :link '(url-link :tag "Download" "http://www.emacswiki.org/highlight-fns.el")
  :link '(url-link :tag "Description" "http://emacswiki.org/HighlightLispFunctions")
  :link '(emacs-commentary-link :tag "Commentary" "highlight-fns")
  (if highlight-lisp-fns-mode
      (font-lock-add-keywords nil '((highlight-lisp-fns . 'highlight-lisp-fns))
                              'APPEND)
    (font-lock-remove-keywords nil '((highlight-lisp-fns . 'highlight-lisp-fns))))
  (when font-lock-mode (font-lock-mode -1))
  (font-lock-mode 1)
  (when (if (> emacs-major-version 22)
            (called-interactively-p 'interactive)
          (called-interactively-p))
    (message "Highlighting called Lisp functions is now %s."
             (if highlight-lisp-fns-mode "ON" "OFF"))))

(defun highlight-lisp-fns (_limit)
  "Highlight called Lisp functions.  Use as a font-lock MATCHER function."
  (let ((opoint  (point))
        (found   nil))
    (with-syntax-table emacs-lisp-mode-syntax-table
      (while (not found)
        (cond ((condition-case ()
                   (save-excursion
                     (skip-chars-forward "'")
                     (setq opoint  (point))
                     (let ((obj  (read (current-buffer))))
                       (and (symbolp obj)  (fboundp obj)
                            (progn (set-match-data (list opoint (point))) t))))
                 (error nil))
               (forward-sexp 1)
               (setq opoint  (point)
                     found   t))
              (t
               (if (looking-at "\\(\\sw\\|\\s_\\)")
                   (forward-sexp 1)
                 (forward-char 1)))))
      found)))

;;;;;;;;;;;;;;;;;;;;;;;

(provide 'highlight-fns)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; highlight-fns.el ends here
