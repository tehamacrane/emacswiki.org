;;; mon-regexp-symbols.el --- Regexp lists of common match/replace a pairs
;; -*- mode: EMACS-LISP; -*-

;;; ================================================================
;; Copyright © 2008-2010 MON KEY. All rights reserved.
;;; ================================================================

;; FILENAME: mon-regexp-symbols.el
;; AUTHOR: MON KEY
;; MAINTAINER: MON KEY
;; CREATED: 2008-07
;; VERSION: 1.0.0
;; COMPATIBILITY: Emacs23.*
;; KEYWORDS: lisp, calendar, i18n

;;; ================================================================

;;; COMMENTARY: 

;; =================================================================
;;; DESCRIPTION:
;;; mon-regexp-symbols provides a collection of Symbols bound to lisp lists of
;;; regexp/replacement pairs. Allows simple easy interactive command invocation
;;; using symbols as arguments to containing lists of regexps.
;;;
;;; Symbols used frequently can can easily be converted to defvar's
;;; allowing docstrings xrefs etc. Likewise, keeping them at the symbol
;;; level allows reading in files as regexps.
;;;
;;; This file defines regexps and lookuplists for many of the procedures in 
;;; :FILE mon-replacement-utils.el
;;; and is required by that library for it to function correctly. 
;;;
;;; FUNCTIONS:►►►
;;;
;;; FUNCTIONS:◄◄◄
;;;
;;; MACROS:
;;;
;;; METHODS:
;;;
;;; CLASSES:
;;;
;;; CONSTANTS:
;;;
;;; VARIABLES:
;;; `*regexp-abrv-dotted-month->canonical*', `*regexp-simple-abrv-month->canonical*',
;;; `*regexp-clean-ebay-time-chars*',
;;; `*regexp-clean-ebay-month->canonical-style1*',
;;; `*regexp-clean-ebay-month->canonical-style2*', `*regexp-bound-month->canonical*',
;;; `*regexp-month->canonical-ws*', `*regexp-month->MM*', `*regexp-MM->month*',
;;; `*regexp-MM->month-whitespace-aware*', `*regexp-philsp-months*', `*regexp-philsp-apos*',
;;; `*regexp-philsp-location*', `*regexp-philsp-swap-location*', `*regexp-philsp-fix-month-dates*',
;;; `*regexp-clean-wikipedia*', `*regexp-clean-whitespace*',
;;; `*regexp-clean-big-whitespace*', `*regexp-clean-imdb*', `*regexp-clean-loc*',
;;; `*regexp-clean-ulan*', `*regexp-clean-ulan-fields*', `*regexp-ulan-contribs*'
;;; `*regexp-clean-ulan-diacritics*', `*regexp-clean-ulan-dispatch-chars*'
;;; `*regexp-ital-to-eng*', `*regexp-defranc-dates*', `*regexp-defranc-places*',
;;; `*regexp-defranc-benezit*', `*regexp-german-to-eng*', `*regexp-clean-bib*',
;;; `*regexp-common-abbrevs*', `*mon-wrap-url-schemes*', 
;;; `*regexp-percent-encoding-reserved-chars*', 
;;; `*regexp-cp1252-to-latin1*', `*regexp-clean-url-utf-escape*',
;;; `*regexp-clean-html-escape*', `*regexp-clean-xml-parse*',
;;; `*regexp-clean-gilt-group*',`*regexp-clean-benezit-fields*'
;;; `*regexp-clean-mon-file-keywords*', `*regexp-rgb-hex*'
;;; `*regexp-symbol-defs-big*', `*regexp-symbol-defs*'
;;;
;;; ALIASED/ADVISED/SUBST'D:
;;; `regexp-version-alist' -> `version-regexp-alist'
;;;
;;; DEPRECATED:
;;;
;;; RENAMED:
;;;
;;; MOVED:
;;; `mon-help-regexp-symbol-defs-TEST' -> mon-doc-help-utils.el
;;;
;;; REQUIRES:
;;;
;;; NOTES: ATTENTION ALL MONKEYS!!!!
;;; _DO NOT_ Modify lists w/out looking at their calling function(s) first.
;;;
;;; TODO:
;;; 
;;; THIRD-PARTY-SOURCES:
;;; Regexps of alists contained herein were sourced from publicly accessible 
;;; data made available at getty.edu. The digital version of the ULAN is 
;;; Copyright ©J.Paul Getty Trust.  Code presented or contained of following file
;;; does not in any way represent the ULAN, J.P. Getty Trust, www.getty.edu, nor
;;; their assocates or affiliatets.
;;;
;;; URL: http://www.emacswiki.org/emacs/mon-regexp-symbols.el
;;; FIRST-PUBLISHED: 
;;
;;; HEADER-ADDED: <Timestamp: #{2009-09-15T11:02:46-04:00Z}#{09382} - by MON KEY>
;;;
;;; FILE-CREATED:
;;; <Timestamp: Summer 2008 - by MON KEY>
;;
;; =================================================================

;;; LICENSE:

;; =================================================================
;; This file is not part of GNU Emacs.

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 3, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth
;; Floor, Boston, MA 02110-1301, USA.
;; =================================================================
;; Permission is granted to copy, distribute and/or modify this
;; document under the terms of the GNU Free Documentation License,
;; Version 1.3 or any later version published by the Free Software
;; Foundation; with no Invariant Sections, no Front-Cover Texts,
;; and no Back-Cover Texts. A copy of the license is included in
;; the section entitled ``GNU Free Documentation License''.
;; 
;; A copy of the license is also available from the Free Software
;; Foundation Web site at:
;; (URL `http://www.gnu.org/licenses/fdl-1.3.txt').
;;; ==============================
;; Copyright © 2008-2010 MON KEY 
;;; ==============================

;;; CODE:

(eval-when-compile (require 'cl))

;;; ==============================
;;; :CREATED <Timestamp: Wednesday July 01, 2009 @ 06:39.55 PM - by MON KEY>
(defvaralias 'regexp-version-alist 'version-regexp-alist)

;;; ==============================
;;; :CREATED <Timestamp: #{2009-08-31T21:03:05-04:00Z}#{09362} - by MON KEY>
(defvar *regexp-clean-xml-parse* '((" \"$" "")
                                   ("^\" (" "(")
                                   ("^\")" ")")
                                   (" \"$" "")
                                   (" nil " " ")
                                   (" nil" " "))
"*Regexp list to match clean strings generated with `xml-parse-file'.\n
:CALLED-BY `mon-cln-xml<-parsed'\n
:SEE-ALSO `mon-cln-xml<-parsed-strip-nil', `mon-cln-html-tags',
`*regexp-percent-encoding-reserved-chars*', `*regexp-clean-url-utf-escape*',
`*regexp-clean-html-escape*'.\n►►►")
;;
;;; :TEST-ME  *regexp-clean-xml-parse*
;;
;;;(progn (makunbound '*regexp-clean-xml-parse*)
;;;       (unintern '*regexp-clean-xml-parse*) )
;;; 
;;; ==============================
;;; :CREATED <Timestamp: #{2009-10-12T13:03:45-04:00Z}#{09421} - by MON>
(defvar *regexp-clean-mon-file-keywords*
  '(("^;;; SUBST or ALIASES:" ";;; ALIASED/ADVISED/SUBST'D:")
    ;;
    ("^;;; test-me; " ";;; :TEST-ME ")
    ("^;;; test-me;" ";;; :TEST-ME ")
    ("^;\\{2,4\\}test-me;" ";;; :TEST-ME ")
    ("^;\\{2,4\\}testme;" ";;; :TEST-ME ")
    ("^;\\{2,4\\}testme:" ";;; :TEST-ME ")
    ("^;\\{2,4\\}test me:" ";;; :TEST-ME ")
    ("^;\\{2,4\\}test-me" ";;; :TEST-ME ")
    ("^;\\{2,4\\} UNCOMMENT-TO-TEST:" ";;; :UNCOMMENT-TO-TEST")
    ("^;\\{2,4\\} UNCOMMENT TO TEST:" ";;; :UNCOMMENT-TO-TEST")
    ("^;\\{2,4\\} UNCOMMENT BELOW TO TEST:" ";;; :UNCOMMENT-TO-TEST")
    ("^;\\{2,4\\} UNCOMMENT-BELOW-TO-TEST:" ";;; :UNCOMMENT-TO-TEST")
    (" - by MON KEY>$"     " - by MON>")
    ;;
    ("EXAMPLE:" ":EXAMPLE")
    ("^See also;" ":SEE-ALSO")
    ("^See also:" ":SEE-ALSO")
    ("^see also;" ":SEE-ALSO")
    ("See aslo;" ":SEE-ALSO")
    (" See: "  " :SEE ")
    (" See; " " :SEE ")
    ("^See also " ":SEE-ALSO ")
    ;;
    ("retrun" "return")
    ("Retrun" "return")
    ;;
    ("Called interactively" "called-interactively")
    ;;
    ("[^:]called by: "   ":CALLED-BY")
    ("[^:]called by; "   ":CALLED-BY")
    ("[^:]called by "    ":CALLED-BY")
    ("[^:]Called by: "   ":CALLED-BY")
    ("[^:]Called by; "   ":CALLED-BY")
    ("[^:]Called by "    ":CALLED-BY")
    ("[^:]called-by: "   ":CALLED-BY")
    ("[^:]called-by; "   ":CALLED-BY")
    ("[^:]called-by "    ":CALLED-BY")
    ("[^:]Called-by: "   ":CALLED-BY")
    ("[^:]Called-by; "   ":CALLED-BY")
    ("[^:]Called-by "    ":CALLED-BY")
    ;;
    ("FIXME:"  ":FIXME")
    (";; note: " ";; :NOTE ")
    ("^;;; NOTE:" ";;; :NOTE")
    ("^;;; NOTES:" ";;; :NOTE")
    ("^;;; CREATED:" ";;; :CREATED")
    ("^;;; MODIFICATIONS:" ";;; :MODIFICATIONS")
    (" AS-OF: " " :AS-OF ")
    ("^;;; WORKING-AS-OF:" ";;; :WORKING-AS-OF")
    ;;
    ("^;;; COURTESY:" ";;; :COURTESY")
    ("WAS:" ":WAS")
    ("HIS:" ":HIS")
    ("VERSION:" ":VERSION"))
  "*Regexp to canonicalize MON 'keywords' in elisp files.
Typically these appear comments or docstrings of file.
:NOTE Check the contents of file's lisp forms before evaluating this symbol as
an argument to `mon-replace-region-regexp-lists' or any other function which 
loops without querying the user, it is easy to alter procedures accidentally.\n
:SEE-ALSO `mon-help-insert-tags', `mon-help-mon-tags',
`*mon-help-mon-tags-alist*', `*regexp-mon-doc-help-meta-tags*',
`*regexp-mon-doc-help-comment-tags*', `*regexp-mon-doc-help-docstring-tags*',
`*regexp-mon-doc-help-pointer-tags*'.\n►►►")
;;
;;; :TEST-ME *regexp-clean-mon-file-keywords*
;;
;;;(progn (makunbound '*regexp-clean-mon-file-keywords*)
;;;       (unintern '*regexp-clean-mon-file-keywords*) )

;;; ==============================
;;; :STANDARD
;;; `defun', `defmacro'  `defsubst' `defsubst*' 
;;; `defvar' `defconst' 
;;; `defcustom' `deftheme',  `defgroup', `defface'
;;; `defalias', `defadvice' `defvaralias', `defimage'
;;; :EIEIO 
;;; `defmethod' `defclass' `defgeneric'
;;; :EMACS-CL 
;;; `defmacro*', `defun*', `defsubst*'
;;; :CL
;;; `deftype', `defsetf', `defstruct', `defconstant' `defparameter'
;;; `defpackage', 
;;; 
;;; ==============================
;;; :TODO Add 
;;; :ELISP `defgroup' `defimage' `defadvice' `defalias' `defvaralias'
;;; :COMMON-LISP `defclass', `defconstant', `defgeneric' `defparameter'
;;;              `defsetf' `defstruct' `deftype' `defmethod' `defpackage'
;;; :CREATED <Timestamp: 2009-08-03-W32-1T11:04:11-0400Z - by MON KEY>
(defvar *regexp-symbol-defs* nil
  "*Regexp list to match lisp forms that define.
Match values include following symbols occuring at BOL prefixed by `(' and
followed by the symbol they define:\n
 `defun' `defun*' `defmacro' `defmacro*' `defsubst' `defsubst*'
 `defconst' `defvar'
 `defcustom' `defface' `deftheme'
:NOTE Tests can be run on this regexp with `mon-help-regexp-symbol-defs-TEST'.\n
:CALLED-BY `mon-insert-lisp-testme',`mon-insert-doc-help-tail'.\n
:SEE-ALSO `*regexp-symbol-defs-big*',
`lisp-font-lock-keywords', `lisp-font-lock-keywords-1', `lisp-font-lock-keywords-2'.\n►►►")
;;
(when (not (bound-and-true-p *regexp-symbol-defs*))
  (setq *regexp-symbol-defs*
        (concat 
         ;; :FIXME Doesn't match on cases where the lambda list is on the next line.
         ;;...1..         
         "^\\((" ;;opening paren
         ;;grp 2 -> 
         ;; `defun' `defun*' `defmacro' `defmacro*' `defsubst' `defsubst*'
         ;; `defconst' `defvar' 
         ;; `defcustom' `defface' `deftheme'
         ;;..2................................................
         ;; :WAS
         "\\(def\\(?:c\\(?:onst\\|ustom\\)\\|face\\|macro\\*?\\|subst\\*?\\|theme\\|un\\*?\\|var\\)\\)"  
         ;;^2^^^^^^^^^....................     ;; :NOTE leading whitepspace
         ;; :WAS 
         " \\([A-Za-z0-9/><:*-]+\\)"      ;; grp 3 -> *some/-symbol:->name<-2*
         ;;...4........................
         "\\(\\( (\\)\\|\\( '\\)\\|\\( `\\)\\)\\)" ;;grp 4 -> ` (' or ` ''
         )))
;;
;;; :TEST-ME  *regexp-symbol-defs*
;;
;;;(progn (makunbound '*regexp-symbol-defs*) (unintern '*regexp-symbol-defs*) )

;;; ==============================
;;; :CREATED <Timestamp: #{2010-02-24T20:04:49-05:00Z}#{10084} - by MON KEY>
(defvar *regexp-symbol-defs-big* nil
  "*Regexp list to match lisp operator forms that define.\n
Match values include following symbols occuring at BOL prefixed by `(' and
followed by the symbol they define. 
Like `*regexp-symbol-defs-big*' but covers a broader range of operators.\n
 `defadvice' `defalias' `defclass' `defconst' `defconstant' `defcustom'
 `defface' `defgeneric' `defgroup' `defimage' `defmacro' `defmacro*'
 `defmethod' `defpackage' `defparameter' `defsetf' `defstruct' `defsubst'
 `defsubst*' `deftheme' `deftype' `defun' `defun*' `defvar' `defvaralias'
:NOTE Tests can be run on this regexp with `mon-help-regexp-symbol-defs-TEST'.\n
:SEE-ALSO `*regexp-symbol-defs-big*',
`lisp-font-lock-keywords', `lisp-font-lock-keywords-1', `lisp-font-lock-keywords-2'.\n►►►")
;;
(when (not (bound-and-true-p *regexp-symbol-defs-big*))
  (setq *regexp-symbol-defs-big*
(concat "^\\((" ;; grp1
        "\\(?2:"
        (substring
         (regexp-opt
          '("defadvice" "defalias" "defclass" "defconst" "defconstant"
           "defcustom" "defface" "defgeneric" "defgroup" "defimage" "defmacro"
           "defmacro*" "defmethod" "defpackage" "defparameter" "defsetf"
           "defstruct" "defsubst" "defsubst*" "deftheme" "deftype" "defun"
           "defun*" "defvar" "defvaralias"))
         4) ;; grp2
        ;;" \\('?[A-Za-z0-9/><:*-]+\\)" ;; grp3 -> *some/-symbol:->name<-2*
        " \\('?[A-Za-z0-9/><:*-]+\\)" ;; grp3 -> *some/-symbol:->name<-2*
        "\\(\\( ([^()&\"]\\)\\| \\('\\|t\\|nil\\|\"\\|((\\|()\\|(&\\|`(\\)\\)\\)"  ;grp4 5,6
        )))
;;
;;; (progn (makunbound '*regexp-symbol-defs-big*) (unintern '*regexp-symbol-defs-big*) )

;;; ==============================
;;; :NOTE Matches short years at BOL in bib entries 'YY "^'\\([0-9]\\{2,2\\}\\) "YY".
(defvar *regexp-abrv-dotted-month->canonical*
  '(("\\<Jan\\." "January") ("\\<Feb\\." "February") ("\\<Mar\\." "March")
    ("\\<Apr\\." "April") ("\\<Jun\\." "June") ("\\<Jul\\." "July")
    ("\\<Aug\\." "August") ("\\<Sep\\." "September") ("\\<Sept\\." "September")
    ("\\<Oct\\." "October") ("\\<Nov\\." "November") ("\\<Dec\\." "December"))
"*Regexp for use with date related strings.\n
:SEE-ALSO `*regexp-bound-month->canonical*', `*regexp-simple-abrv-month->canonical*',
`*regexp-month->MM*', `*regexp-MM->month*', `*regexp-MM->month-whitespace-aware*',
`*regexp-philsp-fix-month-dates*',`*regexp-philsp-months*'.\n►►►")
;;
;;; :TEST-ME  *regexp-abrv-dotted-month->canonical*
;;
;;;(progn (makunbound '*regexp-abrv-dotted-month->canonical*) 
;;;       (unintern '*regexp-abrv-dotted-month->canonical*) )

;;; ==============================
(defvar *regexp-simple-abrv-month->canonical*
 '((" Jan " "January")  (" Feb " "February")  (" Mar " "March")   (" April "  "April")
  (" Jun " "June")  (" Jul " "July")  (" Aug " "August")  (" Sep " "September")
  (" Oct " "October")  (" Nov " "November")  (" Dec " "December"))
 "*Regexp alist for abreviated months with leading and trailing whitespace.\n
Regexp's are of the form:
\" Mmm \" -> \"Mmmmmmm\"\n
:SEE-ALSO `*regexp-bound-month->canonical*', `*regexp-simple-abrv-month->canonical*',
`*regexp-month->MM*' `*regexp-MM->month*', `*regexp-MM->month-whitespace-aware*',
`*regexp-philsp-fix-month-dates*', `*regexp-philsp-months*'.\n►►►")
;;
;;; :TEST-ME  *regexp-simple-abrv-month->canonical*
;;
;;;(progn (makunbound '*regexp-simple-abrv-month->canonical*) 
;;;       (unintern '*regexp-simple-abrv-month->canonical*) )

;;; ==============================
;;; :CREATED <Timestamp: Wednesday July 29, 2009 @ 06:19.33 PM - by MON KEY>
(defvar *regexp-clean-ebay-time-chars*  
  '((44  32)
    (40  32)
    (41  32))
  "*Regexp alist of chars to replace in ebay times.\n
Chars are all associated with char 32 SPC.
44 -> ,\n40 -> (\n41 -> )\n
:EXAMPLE\n(August 07, 200913:52:24 PDT\)\n
:NOTE This type of string corresponds to the regexps of:
`*regexp-clean-ebay-month->canonical-style1*'.\n
:CALLED-BY `mon-cln-ebay-time-string'.\n
:SEE-ALSO `*regexp-clean-ebay-month->canonical-style1*',
`*regexp-clean-ebay-month->canonical-style2*'.\n►►►")
;;
;;; :TEST-ME 
;;(let (pop-list)
;;   (setq pop-list *regexp-clean-ebay-time-chars*)
;;   (while pop-list
;;     (princ (char-to-string (car (pop pop-list))) (current-buffer))))
;;
;;;(progn (makunbound '*regexp-clean-ebay-time-chars*)
;;;       (unintern '*regexp-clean-ebay-time-chars*) )

;;; ==============================
;;; :CREATED <Timestamp: Wednesday July 29, 2009 @ 06:58.52 PM - by MON KEY>
(defvar *regexp-clean-ebay-month->canonical-style1*
  '(("(Jan " "January ") 
    ("(Feb " "February ") 
    ("(Mar " "March ") 
    ("(Apr " "April ") 
    ("(Jun " "June ") 
    ("(Jul " "July ") 
    ("(Aug " "August ") 
    ("(Sep " "September ") 
    ("(Sept " "September ") 
    ("(Oct " "October ") 
    ("(Nov " "November ")
    ("(Dec " "December "))
"*Regexp alist to clean ebay timestrings from eBay webpage.\n
:EXAMPLE\n\(Aug 07, 200913:52:24 PDT\)\n
:CALLED-BY `mon-cln-ebay-time-string'.\n
:SEE-ALSO: `*regexp-clean-ebay-time-chars*', `*regexp-clean-ebay-month->canonical-style3*',
`*regexp-clean-ebay-month->canonical-style2*'.\n►►►")
;;
;;; :TEST-ME  *regexp-clean-ebay-month->canonical-style1*
;;
;;;(progn (makunbound '*regexp-clean-ebay-month->canonical-style1*) 
;;;       (unintern '*regexp-clean-ebay-month->canonical-style1*) )

;;; ==============================
;;; :CREATED <Timestamp: Wednesday July 29, 2009 @ 06:58.46 PM - by MON KEY>
(defvar *regexp-clean-ebay-month->canonical-style2* nil
"*Regexp alist to clean ebay timestrings from eBay.\n
Style2 from eBay listing manager.\n
:EXAMPLE\nJul-29 11:05                 <-style2\n
:CALLED-BY `mon-cln-ebay-time-string'.\n
:SEE-ALSO: `*regexp-clean-ebay-time-chars*', `*regexp-clean-ebay-month->canonical-style3*',
`*regexp-clean-ebay-month->canonical-style1*'.\n►►►")
(unless (bound-and-true-p *regexp-clean-ebay-month->canonical-style2*)
  (setq *regexp-clean-ebay-month->canonical-style2*
        '(("Jan-" "January ") 
          ("Feb-" "February ") 
          ("Mar-" "March ") 
          ("Apr-" "April ") 
          ("Jun-" "June ") 
          ("Jul-" "July ")
          ("Aug-" "August ") 
          ("Sept-" "September ") 
          ("Sep-" "September ") 
          ("Oct-" "October ") 
          ("Nov-" "November ") 
          ("Dec-" "December "))))
;;
;;; :TEST-ME  *regexp-clean-ebay-month->canonical-style2* 
;;
;;;(progn (makunbound '*regexp-clean-ebay-month->canonical-style2*) 
;;;       (unintern '*regexp-clean-ebay-month->canonical-style2*) )

;;; ==============================
;;; :MODIFICATIONS <Timestamp: #{2010-03-11T16:44:22-05:00Z}#{10104} - by MON KEY>
;;; :CREATED <Timestamp: Wednesday July 29, 2009 @ 05:12.02 PM - by MON KEY>
(defvar *regexp-clean-ebay-month->canonical-style3* nil 
  "*Regexp alist to clean ebay timestrings from eBay.\n
Style3 from eBay post listing email confirmations.\n
Aug-10-09 09:16:14 PDT       <-style3\n
:CALLED-BY `mon-cln-ebay-time-string'\n
:SEE-ALSO `*regexp-clean-ebay-time-chars*',
`*regexp-clean-ebay-month->canonical-style1*',
`*regexp-clean-ebay-month->canonical-style2*'.\n►►►")
 ;;
(unless (bound-and-true-p *regexp-clean-ebay-month->canonical-style3*)
  (setq *regexp-clean-ebay-month->canonical-style3*
        (let ((from-style2 *regexp-clean-ebay-month->canonical-style2*)
              (sub-yr (substring (current-time-string) -2))
              ;; :NOTE `mon-get-current-year' isn't loaded yet from mon-utils.el
              ;;(subseq (mon-get-current-year) 2 4)) 
              ;;(sub-cent (subseq (mon-get-current-year) 0 2))
              (bld-rgxp (concat 
                         "\\("                    ;grp1 
                         "\\(%s\\)"               ;<- grp2 Mmm-
                         "\\([0-9]\\{2,2\\}\\)"   ;<- grp3 DD
                         "\\(-\\)"                ;<- grp4 hyphen post DD
                         "\\(%s\\)"               ;<- grp5 sub-yr
                         "\\( [0-9]\\{2,2\\}:[0-9]\\{2,2\\}:[0-9]\\{2,2\\} \\)" ;<- grp6 " HH:MM:SS "
                         "\\(.*\\)"     ;<- grp7  TimeZone/whatevers-left 
                         "\\)"))  
              Mmm-)
          (mapc #'(lambda (x) 
                    (push `(,(format bld-rgxp (car x) sub-yr) ,(cadr x)) Mmm-))
                from-style2)
          (setq Mmm- (nreverse Mmm-)))))
;;
;;; :TEST-ME  *regexp-clean-ebay-month->canonical-style3*
;;; :TEST-ME (car *regexp-clean-ebay-month->canonical-style3*) 
;;; :TEST-ME (caar *regexp-clean-ebay-month->canonical-style3*) 
;;; :TEST-ME (cdar *regexp-clean-ebay-month->canonical-style3*) 
;;
;;;(progn (makunbound '*regexp-clean-ebay-month->canonical-style3*) 
;;;       (unintern '*regexp-clean-ebay-month->canonical-style3*) )

;;; ==============================
(defvar *regexp-bound-month->canonical*
  '(("\\bJan\\b" "January") ("\\bFeb\\b" "February") ("\\bMar\\b" "March")
    ("\\bApr\\b" "April") ("\\bJun\\b" "June") ("\\bJul\\b" "July")
    ("\\bAug\\b" "August") ("\\bSep\\b" "September") ("\\bSept\\b" "September")
    ("\\bOct\\b" "October") ("\\bNov\\b" "November") ("\\bDec\\b" "December"))
"*Regexp alist of abbreviated months with trailing and leading whitespace. 
A nearly identical set of expressions set in `*regexp-philsp-months*' but adds a prefix
\"- \" before the month name for used in `mon-cln-philsp'.\n
:SEE-ALSO `*regexp-abrv-dotted-month->canonical*',
`*regexp-simple-abrv-month->canonical*', `*regexp-MM->month-whitespace-aware*',
`*regexp-month->MM*', `*regexp-MM->month*', `*regexp-philsp-fix-month-dates*'.\n►►►")
;;
;;; :TEST-ME  *regexp-bound-month->canonical*
;;
;;;(progn (makunbound '*regexp-bound-month->canonical*) 
;;;       (unintern '*regexp-bound-month->canonical*) )

;;; ==============================
(defvar *regexp-month->canonical-ws*
  '(("\\bJan\\." "January")("\\bFeb\\." "February")
    ("\\bMar\\." "March") ("\\bApr\\." "April")
    ("\\bJun\\." "June") ("\\bJul\\." "July")
    ("\\bAug\\." "August") ("\\bSep\\." "September")
    ("\\bSept\\." "September") ("\\bOct\\." "October")
    ("\\bNov\\." "November") ("\\bDec\\." "December")
    ;; ==============================
    ("Jan\\.[: :]" "January ") ("Feb\\.[: :]" "February ")
    ("Mar\\.[: :]" "March ") ("Apr\\.[: :]" "April ")
    ("Jun\\.[: :]" "June ") ("Jul\\.[: :]" "July ")
    ("Aug\\.[: :]" "August ") ("Sep\\.[: :]" "September ")
    ("Sept\\.[: :]" "September ") ("Oct\\.[: :]" "October ")
    ("Nov\\.[: :]" "November ") ("Dec\\.[: :]" "December ")
    ;; ==============================
    ("\\<Jan\\." "January") ("\\<Feb\\." "February")
    ("\\<Mar\\." "March") ("\\<Apr\\." "April")
    ("\\<Jun\\." "June") ("\\<Jul\\." "July")
    ("\\<Aug\\." "August") ("\\<Sep\\." "September")
    ("\\<Sept\\." "September") ("\\<Oct\\." "October")
    ("\\<Nov\\." "November") ("\\<Dec\\." "December")
    ;; ==============================
    ("[: :]Jan\\." " January") ("[: :]Feb\\." " February")
    ("[: :]Mar\\." " March") ("[: :]Apr\\." " April")
    ("[: :]Jun\\." " June") ("[: :]Jul\\." " July")
    ("[: :]Aug\\." " August") ("[: :]Sep\\." " September")
    ("[: :]Sept\\." " September") ("[: :]Oct\\." " October")
    ("[: :]Nov\\." " November") ("[: :]Dec\\." " December")
    ;; ==============================
    ;; :NOTE MUST come after the previous case!
    ("\\bJan\\b" "January")("\\bFeb\\b" "February")
    ("\\bMar\\b" "March") ("\\bApr\\b" "April")
    ("\\bJun\\b" "June") ("\\bJul\\b" "July")
    ("\\bAug\\b" "August") ("\\bSep\\b" "September")
    ("\\bSept\\b" "September") ("\\bOct\\b" "October")
    ("\\bNov\\b" "November") ("\\bDec\\b" "December")
    ;; =============================
    (" Jan " " January ")(" Feb " " February ")
    (" Mar " " March ")(" Apr "  " April ")
    (" Jun " " June ")(" Jul " "July")
    (" Aug " " August ")(" Sep " " September ")
    (" Oct " "October")(" Nov " "November")(" Dec " " December ")
    ;; ==============================
    ("Jan[: :]" "January ") ("Feb[: :]" "February ")
    ("Mar[: :]" "March ") ("Apr[: :]" "April ")
    ("Jun[: :]" "June ") ("Jul[: :]" "July ")
    ("Aug[: :]" "August ") ("Sep[: :]" "September ")
    ("Oct[: :]" "October ") ("Nov[: :]" " November ")
    ("Dec[: :]" " December "))
  "*Alist of regexps combination of abbreviated month replacements.\n
List includes combinations for:
    \"\\bJan\\.\" \"January\"
    \"Jan\\.[: :]\" \"January \"
    \"[: :]Jan\\.\" \" January\"
    \"\\bJan\\b\" \"January\"
    \" Jan \" \" January \"
    \"Jan[: :]\" \"January \"\n
:Note This variable combines regexps from the following variables:
`*regexp-simple-abrv-month->canonical*', `*regexp-abrv-dotted-month->canonical*',
`*regexp-bound-month->canonical*'.\n
:SEE-ALSO `*regexp-MM->month*', `*regexp-month->MM*',
`*regexp-MM->month-whitespace-aware*', `*regexp-philsp-months*',
`*regexp-philsp-fix-month-dates*'.\n►►►")
;;    
;;; :TEST-ME  *regexp-month->canonical-ws*
;;
;;;(progn (makunbound '*regexp-month->canonical-ws*) 
;;;       (unintern '*regexp-month->canonical-ws*) )

;;; ==============================
(defvar *regexp-month->MM*
  '(("January" "01")("February"  "02")("March"  "03")("April"  "04")
    ("May"  "05") ("June"  "06")("July"  "07")("August"  "08")
    ("September"  "09")("October"  "10")("November"  "11")("December"  "12"))
"*Regexp for use with date related strings.\n
:SEE-ALSO `*regexp-bound-month->canonical*',
`*regexp-abrv-dotted-month->canonical*',
`*regexp-simple-abrv-month->canonical*', `*regexp-MM->month*',
`*regexp-MM->month-whitespace-aware*', `*regexp-philsp-months*',
`*regexp-philsp-fix-month-dates*'.\n►►►")
;;
;;; :TEST-ME  *regexp-month->MM*
;;
;;;(progn (makunbound '*regexp-month->MM*) (unintern '*regexp-month->MM*) )

;;; ==============================
;;; :NOTE Matches MMwhitepspace Month forms.
(defvar *regexp-MM->month*
    '(("\\([: :]01\\)"  " January") ("\\([: :]02\\)"  " February")
      ("\\([: :]03\\)"  " March") ("\\([: :]04\\)"  " April")("\\([: :]05\\)"  " May")
      ("\\([: :]06\\)"  " June") ("\\([: :]07\\)"  "July") ("\\([: :]08\\)"  " August")
      ("\\([: :]09\\)"  " September") ("\\([: :]10\\)"  " October")
      ("\\([: :]11\\)"  " November") ("\\([: :]12\\)"  " December"))
    "*Regexp for use with date related strings.\n
:SEE-ALSO `*regexp-bound-month->canonical*', `*regexp-abrv-dotted-month->canonical*',
`*regexp-simple-abrv-month->canonical*', `*regexp-month->MM*',
`*regexp-MM->month-whitespace-aware*', `*regexp-philsp-months*',
`*regexp-philsp-fix-month-dates*'.\n►►►")
;;
;;; :TEST-ME  *regexp-MM->month*
;;
;;;(progn (makunbound '*regexp-MM->month*) (unintern '*regexp-MM->month*) )

;;; ==============================
(defvar *regexp-MM->month-whitespace-aware*
  '(("^\\(01[: :]\\)" "January ")       ("^\\(01\\)" "January")  
    ("^\\(02[: :]\\)" "February ")      ("^\\(02\\)" "February") 
    ("^\\(03[: :]\\)" "March ")	        ("^\\(03\\)" "March")    
    ("^\\(04[: :]\\)" "April ")	        ("^\\(04\\)" "April")    
    ("^\\(05[: :]\\)" "May ")	        ("^\\(05\\)" "May")	     
    ("^\\(06[: :]\\)" "June ")	        ("^\\(06\\)" "June")     
    ("^\\(07[: :]\\)" "July ")	        ("^\\(07\\)" "July")     
    ("^\\(08[: :]\\)" "August ")        ("^\\(08\\)" "August")   
    ("^\\(09[: :]\\)" "September ")     ("^\\(09\\)" "September")
    ("^\\(10[: :]\\)" "October ")       ("^\\(10\\)" "October")  
    ("^\\(11[: :]\\)" "November ")      ("^\\(11\\)" "November") 
    ("^\\(12[: :]\\)" "December ")      ("^\\(12\\)" "December") 
					; ==============================
    ("\\(01[: :]\\)" "January ")        ("\\([: :]01\\)"  " January")   
    ("\\(02[: :]\\)" "February ")       ("\\([: :]02\\)"  " February")  
    ("\\(03[: :]\\)" "March ")	        ("\\([: :]03\\)"  " March")	    
    ("\\(04[: :]\\)" "April ")	        ("\\([: :]04\\)"  " April")	    
    ("\\(05[: :]\\)" "May ")	        ("\\([: :]05\\)"  " May")	    
    ("\\(06[: :]\\)" "June ")	        ("\\([: :]06\\)"  " June")	    
    ("\\(07[: :]\\)" "July ")	        ("\\([: :]07\\)"  " July")	    
    ("\\(08[: :]\\)" "August ")	        ("\\([: :]08\\)"  " August")    
    ("\\(09[: :]\\)" "September ")      ("\\([: :]09\\)"  " September") 
    ("\\(10[: :]\\)" "October ")        ("\\([: :]10\\)"  " October")   
    ("\\(11[: :]\\)" "November ")       ("\\([: :]11\\)"  " November")  
    ("\\(12[: :]\\)" "December ")       ("\\([: :]12\\)"  " December")  
					; ==============================
    ("\\([: :]01[: :]\\)" " January ")
    ("\\([: :]02[: :]\\)" " February ")
    ("\\([: :]03[: :]\\)" " March ")
    ("\\([: :]04[: :]\\)" " April ")
    ("\\([: :]05[: :]\\)" " May ")
    ("\\([: :]06[: :]\\)" " June ")
    ("\\([: :]07[: :]\\)" " July ")
    ("\\([: :]08[: :]\\)" " August ")
    ("\\([: :]09[: :]\\)" " September ")
    ("\\([: :]10[: :]\\)" " October ")
    ("\\([: :]11[: :]\\)" " November ")
    ("\\([: :]12[: :]\\)" " December "))
  ;; ==============================
  "*Regexp that is whitespace aware to replace numbered lists to Month Name.\n
:SEE-ALSO `*regexp-MM->month*', `*regexp-month->MM*', `*regexp-bound-month->canonical*',
`*regexp-abrv-dotted-month->canonical*', `*regexp-simple-abrv-month->canonical*',
`*regexp-philsp-months*', `*regexp-philsp-fix-month-dates*'.\n►►►")
;;
;;; :TEST-ME  *regexp-MM->month-whitespace-aware*
;;
;;;(progn (makunbound '*regexp-MM->month-whitespace-aware*) 
;;;       (unintern '*regexp-MM->month-whitespace-aware*) )

;;; ==============================
;;; :NOTE Fixes matches for code point: 0x2019 char 8217 i.e.:
;;; `CharAposChar' & `AposNumNum' for Philsp regexps as per:
;;; :SEE (URL `http://www.philsp.com/homeville/FMI/a7.htm')
;;; ==============================
;;; Following kbd macro philsp keyboard-macros definitions for matching
;;; apos data in artist/authors fixing junk definitions are deprecated:
;;; `philsp-all', `philsp-alld', `philsp-bol', `philsp-eol', `philsp-auth-rplc-apos',
;;; `philsp-rplc-auth-bol', `*regexp-philsp-apos*', `philsp-mag-bol', `philsp-mag-brackets'
;;; `philsp-mag-ebay', `philsp-mag-contents',
;;; These used to appear in :FILE naf-skeletons.el
;;; They have been replaced by `mon-cln-philsp' which calls the variables:
;;; `*regexp-philsp-months*', `philp-apos', `*regexp-philsp-location*',
;;; `*regexp-philsp-swap-location*', `*regexp-philsp-fix-month-dates*',
;;; `mon-cln-philsp' lives in :FILE mon-replacement-utils.el
;;; ==============================
(defvar *regexp-philsp-months*
  '(("\\bJan\\b" "- January") ("\\bFeb\\b" "- February") ("\\bMar\\b" "- March")
    ("\\bApr\\b" "- April") ("\\bJun\\b" "- June") ("\\bJul\\b" "- July")
    ("\\bAug\\b" "- August") ("\\bSep\\b" "- September") ("\\bSept\\b" "- September")
    ("\\bOct\\b" "- October") ("\\bNov\\b" "- November") ("\\bDec\\b" "- December"))
  "*Regexp to replace bounded abbreviated months \"\\bMMM\\b\".\n
Replace matches with fully canonical form prefixed by \"- \".\n
:CALLED-BY `mon-cln-philsp'.\n
:SEE-ALSO `*regexp-philsp-fix-month-dates*', `*regexp-philsp-months*',
`*regexp-philsp-apos', `*regexp-philsp-location*',
`*regexp-bound-month->canonical*', `*regexp-abrv-dotted-month->canonical*',
`*regexp-simple-abrv-month->canonical*', `*regexp-month->MM*',
`*regexp-MM->month*'.\n:USED-IN `naf-mode'.\n►►►")
;;
;;; :TEST-ME  *regexp-philsp-months*
;;
;;;(progn (makunbound '*regexp-philsp-months*)
;;;       (unintern '*regexp-philsp-months*) )

;;; ==============================
(defvar *regexp-philsp-apos*
  '(("\\(\\(’\\)\\([0-9]\\{2,2\\}\\)\\)" "19\\3")
    ("\\(\\([a-z]\\)\\(’\\)\\([a-z]\\)\\)" "\\2\'\\4"))
  "*Regexp to match occurences of code point 0x2019.\n
Matches for (0x2019 - RIGHT SINGLE QUOTATION MARK) replaced by
ASCII char (39 - APOSTROPHE).\
Replacements of abbreviated YY inserts the prefix 19 to yield 19YY.\n
:CALLED-BY `mon-cln-philsp'.
:SEE-ALSO `*regexp-philsp-months*', `*regexp-philsp-location*',
`*regexp-philsp-swap-location*', `*regexp-philsp-fix-month-dates*'\n
:USED-IN `naf-mode'.\n►►►")
;;
;;; :TEST-ME  *regexp-philsp-apos*
;;
;;;(progn (makunbound '*regexp-philsp-apos*)
;;;       (unintern '*regexp-philsp-apos*) )

;;; ==============================
(defvar *regexp-philsp-location*
  `((,(concat 
       "\\(^[: :]\\{4,4\\}\\*[: :]?\\)"
       "\\(\\(Cover[: :]Artist\\)\\|\\(Interior[: :]Artwork\\)\\)"
       "\\([:;:]?[: :]?\\)") 
      "#(\\2)#"))
  "*Regexp to discard the \"    * \" string at BOL.\n
Replace matches and wrap \"Cover Artist;\" and \"Interior Artwork;\".\n
Discard trailing (semi-colon;) and wrap target string with #hash-symbols#.\n
:CALLED-BY `mon-cln-philsp' in preparation for `*regexp-philsp-swap-location*'.\n
:SEE-ALSO `*regexp-philsp-months*', `*regexp-philsp-apos',
`*regexp-philsp-swap-location*', `*regexp-philsp-fix-month-dates*'\n
:USED-IN `naf-mode'.\n►►►")
;;
;;; :TEST-ME  *regexp-philsp-location*
;;
;;;(progn (makunbound '*regexp-philsp-location*)
;;;       (unintern '*regexp-philsp-location*) )

;;; ==============================
(defvar *regexp-philsp-swap-location*
  '(("^\\(#\\(.*\\)#\\)\\(.*$\\)" "\\3 - \\2"))
  "*Regexp to swap the location of the \"Cover Artist\" and \"Interior Artwork\".\n
Shift the former to the EOL position and the later to BOL.\n
:CALLED-BY `mon-cln-philsp' :AFTER `*regexp-philsp-location*'.\n
:SEE-ALSO `*regexp-philsp-months*', `*regexp-philsp-apos',
`*regexp-philsp-location*', `*regexp-philsp-fix-month-dates*'\n
:USED-IN `naf-mode'.\n►►►")
;;
;;; :TEST-ME  *regexp-philsp-swap-location*
;;
;;;(progn (makunbound '*regexp-philsp-swap-location*)
;;;       (unintern '*regexp-philsp-swap-location*) )

;;; ==============================
(defvar *regexp-philsp-fix-month-dates* 
  '(("\\(\\(January\\)\\([: :]\\([0123][0-9]\\)\\{1,1\\}[: :]\\)\\)" "\\2 \\4, ")
    ("\\(\\(February\\)\\([: :]\\([0123][0-9]\\)\\{1,1\\}[: :]\\)\\)" "\\2 \\4, ")
    ("\\(\\(March\\)\\([: :]\\([0123][0-9]\\)\\{1,1\\}[: :]\\)\\)" "\\2 \\4, ")
    ("\\(\\(April\\)\\([: :]\\([0123][0-9]\\)\\{1,1\\}[: :]\\)\\)" "\\2 \\4, ")
    ("\\(\\(June\\)\\([: :]\\([0123][0-9]\\)\\{1,1\\}[: :]\\)\\)" "\\2 \\4, ")
    ("\\(\\(July\\)\\([: :]\\([0123][0-9]\\)\\{1,1\\}[: :]\\)\\)" "\\2 \\4, ")
    ("\\(\\(August\\)\\([: :]\\([0123][0-9]\\)\\{1,1\\}[: :]\\)\\)" "\\2 \\4, ")
    ("\\(\\(September\\)\\([: :]\\([0123][0-9]\\)\\{1,1\\}[: :]\\)\\)" "\\2 \\4, ")
    ("\\(\\(October\\)\\([: :]\\([0123][0-9]\\)\\{1,1\\}[: :]\\)\\)" "\\2 \\4, ")
    ("\\(\\(November\\)\\([: :]\\([0123][0-9]\\)\\{1,1\\}[: :]\\)\\)" "\\2 \\4, ")
    ("\\(\\(December\\)\\([: :]\\([0123][0-9]\\)\\{1,1\\}[: :]\\)\\)" "\\2 \\4, "))
  "*Regexp for use with `mon-cln-philsp'.\n
:SEE-ALSO `*regexp-philsp-months*', `*regexp-philsp-apos',
`*regexp-philsp-location*', `*regexp-philsp-swap-location*',
`*regexp-bound-month->canonical*', `*regexp-abrv-dotted-month->canonical*',
`*regexp-simple-abrv-month->canonical*', `*regexp-month->MM*',
`*regexp-MM->month*'.\n:USED-IN `naf-mode'.\n►►►")
;;
;;; :TEST-ME  *regexp-philsp-fix-month-dates*
;;
;;;(progn (makunbound '*regexp-philsp-fix-month-dates*)
;;;       (unintern '*regexp-philsp-fix-month-dates*) )

;;; ==============================
(defvar *regexp-clean-wikipedia*
  '(("\[[0-9]+\]" "")
    ("Aller à : Navigation, rechercher" "") ;; :WIKI-FRANCE
    ("Collection privée" "Private Collection") ;; :WIKI-FRANCE
    ("^Divisions" "Divisions:")
    ("^Employees" "Employees:")
    ("^Founded" "Founded:")
    ("^Headquarters" "Headquarters:")
    ("^Industry" "Industry:")
    ("^Key people" "Key-people:")
    (" Liens externes" "")  ;; :WIKI-FRANCE
    ("Notes et références" "Notes and references:") ;; :WIKI-FRANCE
    ("Portail de la peinture" "")  ;; :WIKI-FRANCE
    ("^Operating income" "Operating-income:")
    ("^Products" "Products:")
    ("^Profit" "Profit:")
    ("(Redirigé depuis .*)" "") ;; :WIKI-FRANCE
    ("^References\n" "Wikipedia-Sources:\n")
    ("^Références \\[modifier\\]\n" "Wikipedia-References:\n") ;; :WIKI-FRANCE
    ("^Références \n" "Wikipedia-References:\n") ;; :WIKI-FRANCE
    ("^Revenue" "Revenue:")
    ("^:SEE-ALSO\n" ":SEE-ALSO:\n")
    ("^Sommaire" "")
    ("^Sources \\[modifier\\]" "Wikipedia-Sources: ")
    ("^Subsidiaries" "Subsidiaries:")
    ("^Type" "Type:")
    ("^Un article de Wikipédia, l'encyclopédie libre." "") ;; :WIKI-FRANCE
    ("^Voir aussi" ":SEE-ALSO:") ;; :WIKI-FRANCE
    ("^Website" "Website::")
    (" ↑ " " ")
    ("▲" "")
    ("€" "(Euro)")
    ("Main article: " "")
    ("^Flag of " "")
    (" .*\.svg" "")
    ("^[A-z0-9]+.*\.svg" "")
    ("\\[View Article\\]" "")
    ("\\[archive\\]" "")
    ("\\[masquer\\]" "") ;; :WIKI-FRANCE
    ("\\[edit\\]" "")
    ("\\[hide\\]" "")
    ("\\[show\\]" "")
    ("\\[original research?\\]" "")
    ("\([:.:]*?\\[citation needed\\]\)" ".")
    ("\\[citation needed\\]" "")
    ("\\[modifier\\]" "") ;; :WIKI-FRANCE
    ("′" "'")  ;; :NAME PRIME :CODE-POINT 0x2032 :NOTE Used in GeoHack coords
    ("’" "'")  ;; :NAME RIGHT SINGLE QUOTATION MARK :CODE-POINT 0x2019 
    ("‘" "'")
    ("“" "\"") ;; :NAME LEFT DOUBLE QUOTATION MARK :CODE-POINT 0x201C
    ("”" "\"") ;; :NAME RIGHT DOUBLE QUOTATION MARK :CODE-POINT 0x201D
    ("″" "\"") ;; :NAME DOUBLE PRIME code-point: 0x2033 - used in GeoHack coords
    ("\\b\. \. \. "  "... ")
    (" \. \. \. " " ... ")
    ;; ("\\( \. \. \. \\)\\|\\(\.\.\. \\)" 
    ("…" "...") ;; :NAME HORIZONTAL ELLIPSIS :CODE-POINT 0x2026
    ("–" "-")  ;; :NAME EN DASH :CODE-POINT 0x2013
    ("—" "-")  ;; :NAME EM DASH :CODE-POINT 0x2014
    ("œ" "oe")
    ("æ" "ae")
    ("n°" "No.")  ;; numbering
    ("N°" "No.")  ;; numbering
    ("^    \* " "- " )
    ("^- \\* \\([0-9.]+ \\)" "- o \\1")
    ("^- \\*[\\[:blank:]]+$" "")
    ;; <-fall through case should come after `("^    \* " "- " )'
    ;; for when there is nothing to enumerate.
    )
  "*Regexps to match *some* wikipedia formatting.\n
Add wiki related regexps to this list to replace other wikipedia cruft.\n
:NOTE Useful for straightening up the multiple-encodings and diacritic problems
unique to Wikpedia's mutli-user entered text.
:CALLED-BY `mon-cln-wiki'
:SEE-ALSO `mon-cln-imdb', `mon-trans_cp1252_to_latin1', `mon-cln-loc'.\n
:USED-IN `naf-mode'.\n►►►")
;;
;;; :TEST-ME  *regexp-clean-wikipedia*
;;
;;;(progn (makunbound '*regexp-clean-wikipedia*)
;;;       (unintern '*regexp-clean-wikipedia*) )

;;; ==============================
(defvar *regexp-clean-whitespace*
  '(("\\(\\> +\\)" " ") ("\\(\\_> +\\)" " "))
  ;; A more exact but ascii perverted approach:
  ;; \([A-z]\)\([:  :]+?\)\([A-z]\)  \1 \3
  "*Regexp to match in string whitespace for cleanup functions.\n
:CALLED-BY `mon-cln-whitespace'.\n
:SEE-ALSO `mon-cln-imdb',  `mon-abr-to-month', `mon-num-to-month'\n
`mon-replace-common-abrevs',`mon-trans_cp1252_to_latin1'.\n
:USED-IN `naf-mode'.\n►►►")
;;
;;; :TEST-ME  *regexp-clean-whitespace*
;;
;;;(progn (makunbound  '*regexp-clean-whitespace*)
;;;       (unintern '*regexp-clean-whitespace*) )

;;; ==============================
(defvar *regexp-clean-big-whitespace*
   '(("\\(\\> +\\)" " ")
     ("\\(\\_> +\\)" " ")
     ("\\([[:blank:]][[:blank:]]+\\)" " "))
   "*Regexp to match in-string, trailing, and tabified whitespace for cleanups.\n 
:CALLED-BY `mon-cln-BIG-whitespace'.\n
:SEE-ALSO `mon-cln-whitespace',`mon-kill-whitespace',
`mon-cln-trail-whitespace',`mon-cln-imdb', `mon-trans_cp1252_to_latin1',
`mon-replace-common-abrevs',`mon-abr-to-month', `mon-num-to-month'.
:USED-IN `naf-mode'.\n►►►")
;;
;;; :TEST-ME  *regexp-clean-big-whitespace*
;;
;;;(progn (makunbound '*regexp-clean-big-whitespace*)
;;;        (unintern '*regexp-clean-big-whitespace*) )

;;; ==============================
(defvar *regexp-clean-imdb*
   '((" More at IMDb Pro »" "")
     ("^advertisement$" "")
     ("^Jump to filmography as:.*$" "")
     ("^    \\* 19[0-9]+s$" "")
     ("\\.\\.\\.\\." "-")
     ("      \\.\\.\\. " "      - ")
     ("\\.\\.\\. more$" " ")
     ("^.*[0-9]+?\\. " "- "))
   "*Regexps to match cruft gathered by IMDB \(Internet Movie DataBase\) scrapes.\n
:CALLED-BY `mon-cln-imdb'\n
:SEE \(URL `http://www.imdb.com').
:SEE-ALSO\n
:USED-IN `naf-mode'.\n►►►")
;;
;;; :TEST-ME  *regexp-clean-imdb*
;;;
;;;(progn (makunbound '*regexp-clean-imdb*) (unintern '*regexp-clean-imdb*) )

;;; ==============================
(defvar *regexp-clean-loc*
  `(("è" "è")            ;; :NAME COMBINING GRAVE ACCENT :CODE-POINT 0x0300
    ("è" "è")            ;; :NAME COMBINING GRAVE ACCENT :CODE-POINT 0x0300
    ("È" "È")            ;; :NAME COMBINING ACUTE ACCENT :CODE-POINT 0x0301
    ("é" "é")            ;; :NAME COMBINING ACUTE ACCENT :CODE-POINT 0x0301
    ("é" "é")            ;; :NAME COMBINING ACUTE ACCENT :CODE-POINT 0x0301
    ("í" "í")            ;; :NAME COMBINING ACUTE ACCENT :CODE-POINT 0x0301
    ("á" "á")            ;; :NAME COMBINING ACUTE ACCENT :CODE-POINT 0x0301
    ("ç" "ç")           ;; :NAME COMBINING ACUTE ACCENT :CODE-POINT 0x0301
    ("ç" "ç")           ;; :NAME COMBINING CEDILLA :CODE-POINT 0x0327
    ("æ" "ae")           ;; :NAME LATIN SMALL LETTER AE
    ("œ" "oe")           ;; :NAME LATIN SMALL LIGATURE OE :CODE-POINT 0x0153 :CHARACTER (339, #o523, #x153)
    ("—" "-")            ;; :NAME EM DASH :CODE-POINT 0x2014
    ("–" "-")            ;; :NAME EN DASH :CODE-POINT 0x2013
    ("«" "\"")           ;; :NAME LEFT-POINTING DOUBLE ANGLE QUOTATION MARK :CODE-POINT 0xAB
    ("»" "\"")           ;; :NAME RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK :CODE-POINT 0xBB
    ("′" "'")            ;; :NAME PRIME :CODE-POINT 0x2032 :NOTE used in GeoHack coords
    ("’" "'")            ;; :NAME RIGHT SINGLE QUOTATION MARK :CODE-POINT 0x2019 
    ("“" "\"")           ;; :NAME LEFT DOUBLE QUOTATION MARK :CODE-POINT 0x201C
    ("”" "\"")           ;; :NAME RIGHT DOUBLE QUOTATION MARK :CODE-POINT 0x201D
    ("″" "\"")           ;; :NAME DOUBLE PRIME :CODE-POINT 0x2033 - :NOTE used in GeoHack coords
    ("″" "'")            ;; :NAME DOUBLE PRIME :CODE-POINT 0x2033
    ("ẞ" "ß")            ;; :NAME LATIN SMALL LETTER SHARP S
    ("…" "...")          ;; :NAME HORIZONTAL ELLIPSIS :CODE-POINT 0x2026
    (,(char-to-string 160)"") ;; :NAME NO-BREAK SPACE :CODE-POINT 0xA0 (160, #o240, #xa0)
    (,(char-to-string 160)"") ;; :NAME SOFT HYPHEN :CODE-POINT 0xAD :CHARACTER (173, #o255, #xad)
    ("n°" "No.")         ;; :NAME DEGREE SIGN :CODE-POINT 0xB0 :CHARACTER (176, #o260, #xb0)
    ("N°" "No.")         ;; 
    )
  "*Regexps to match combining character diacritics in LOC NAFS.\n
:NOTE Add LOC scrape cruft here :BEFORE creating dedicated variable.\n
:CALLED-BY `mon-cln-loc'\n
:SEE-ALSO `mon-cln-wiki', `mon-cln-imdb',`regexp-ulan-diacritics',
`mon-trans_cp1252_to_latin1'.\n:USED-IN `naf-mode'.\n►►►")
;;
;;; :TEST-ME  *regexp-clean-loc*
;;
;;;(progn (makunbound '*regexp-clean-loc*) 
;;;       (unintern '*regexp-clean-loc*) )

;;; ==============================
(defvar *regexp-clean-gilt-group* 
  '(("\\([: :]\\{50,58\\}'\\)" "")
    ("fl\.Product\.MetaImage\.*," "")
    ("\\?.*',$" "")
    ("\\?.*;$" ""))
  "*Regexps match image links in HTML source from gilt.com.\n
Invoke to get a working list to pass to a useable wget include file.
:CALLED-BY `bug-cln-gilt-group'.
:SEE \(URL `http://www.gilt.com'\)
:SEE-ALSO .\n►►►")
;;
;;; :TEST-ME *regexp-cln-gilt-group*
;;
;;;(progn (makunbound '*regexp-cln-gilt-group*)
;;;       (unintnern '*regexp-cln-gilt-group*) )

;;; ==============================
(defvar *regexp-ital-to-eng* 
  '( ;; :ITALIAN-MONTHS-OF-YEAR->ENGLISH
    ("gennaio" "January")      ("febbraio" "February")
    ("marzo" "March")          ("aprile" "April")
    ("maggio" "May")           ("giugno" "June")
    ("luglio" "July")          ("agosto" "August")
    ("settembre" "September")  ("ottobre" "October")
    ("novembre" "November")    ("dicembre" "December")
    ;; :ITALIAN-DAYS-OF-WEEK->ENGLISH
    ("lunedì" "Monday")        ("martedì" "Tuesday")
    ("mercoledì" "Wednesday")  ("giovedì" "Thursday")
    ("venerdì" "Friday")       ("sabato" "Saturday")
    ("domenica" "Sunday")
    ;; :ITALIAN-PLACE-NAMES->ENGLISH
    ("Zurigo" "Zurich"))
  "*Regexp list to match and replace Italian dates and place names with Engrish.\n
:CALLED-BY `mon-ital-date-to-eng'.\n
:SEE-ALSO `mon-cln-wiki', `mon-cln-imdb', `mon-defranc-places',
`mon-replace-common-abrevs'.\n:USED-IN `naf-mode'.\n►►►")
;;
;;; :TEST-ME  *regexp-ital-to-eng*
;;
;;;(progn (makunbound '*regexp-ital-to-eng*) (unintern '*regexp-ital-to-eng*) )

;;; ==============================
(defvar *regexp-defranc-dates*
  '(;; :FRENCH-DAYS-OF-YEAR->ENGLISH
    ("Lundi" "Monday")       ("Mardi" "Tuesday") 
    ("Mercredi" "Wednesday") ("Jeudi" "Thursday")
    ("Vendredi" "Friday")    ("Samedi" "Saturday")
    ("Dimanche" "Sunday")    
    ;; :FRENCH-MONTHS-OF-YEAR->ENGLISH
    ("janvier" "January")
    ("fevrier" "February")
    ("février" "February")
    ("[: :]mars[: :]" "March")
    ("avril" "April")	   
    ("[: :]juin[: :]" "June")	   
    ("juillet" "July")	   
    ("septembre" "September") 
    ("octobre" "October")	   
    ("novembre" "November")   
    ("décembre" "December")   
    ("decembre" "December")
    ("\\([: :]jan\.[: :]\\)" " January ") 
    ("^\\(jan\.[: :]\\)" "January ")   
    ("\\([: :]fév\\.[: :]\\)" " February ")
    ("\\([: :]fev\\.[: :]\\)" " February ")
    ("^\\(fev\.[: :]\\)" "February ")  
    ("^\\(fév\.[: :]\\)" "February ")  
    ("\\([: :]avr\.[: :]\\)" " April ")        
    ("^\\(avr\.[: :]\\)" "April ")     
    ("\\([: :]mai[: :]\\)" " May ")         
    ("^\\(mai[: :]\\)" "May ")         
    ("\\([: :]mai[: :]\\)" " May ")            
    ("\\([: :]juil\.[: :]\\)"  " July ")       
    ("^\\(juil\.[: :]\\)"  "July ")    
    ("\\([: :]aout[: :]\\)" " August ")	   
    ("\\([: :]août[: :]\\)" " August ")        
    ("^\\([: :]aout[: :]\\)" " August ")     
    ("^\\(août[: :]\\)" "August ")     
    ("\\([: :]sept\.[: :]\\)" " September ")   
    ("^\\(sept\.[: :]\\)" "September ")
    ("\\([: :]oct\.[: :]\\)" " October ")      
    ("^\\(oct\.[: :]\\)" "October ")   
    ("\\([: :]nov\.[: :]\\)" " November ")     
    ("^\\(nov\.[: :]\\)" "November ")  
    ("\\([: :]déc\.[: :]\\)" " December ")     
    ("^\\(déc\.[: :]\\)" "December "))
  "*Regexps to match French day of week, months, abbrevd months, and months.
Match these with and without out diacritics to convert French date strings
\(months, days\) to equivalent Engrish strings.\n
:CALLED-BY `mon-defranc-dates'\n
:SEE-ALSO `naf-mode-french-months' `mon-ital-date-to-eng'.\n
:USED-IN `naf-mode'.\n►►►")
;;
;;; :TEST-ME  *regexp-defranc-dates*
;;
;;;(progn (makunbound '*regexp-defranc-dates*) (unintern '*regexp-defranc-dates*) )

;;; ==============================
(defvar *regexp-defranc-places* 
  '(("États-Unis" "United States")      ;;tricky 
    ("Etats-Unis" "United States")
    ("États Unis" "United States")
    ("Etats Unis" "United States")
    ("Grèce" "Greece")
    ;; :CITY-NAMES-AUCTION-FRENCH->ENGLISH
    ("COPENHAGUE" "Copenhagen")
    ("LONDRES" "London")
    ("GENÈVE" "Geneva")
    ("BRUXELLES" "Brussels")
    ("VIENNE" "Vienna")
    ;; :CITY-NAMES-FRENCH->ENGLISH
    ("Anvers" "Antwerp")
    ("Assise" "Assisi")
    ("Athènes" "Athens")
    ("Augsbourg" "Augsburg")
    ("Berlín" "Berlin")
    ("Bologne" "Bologna")
    ("Bretagne" "Brittany")
    ("Dresde" "Dresden")
    ("Dresde" "Dresden" )
    ("Düsseldorf" "Dusseldorf")
    ("Grenade" "Grenada")
    ("Normandie" "Normandy")
    ("Luxemburg" "Luxembourg")
    ("Montréal" "Montreal")
    ("Moscou" "Moscow")
    ("Múnich" "Munich")
    ("Saint Pétersbourg" "Saint Petersburg")
    ("Saint-Pétersbourg" "Saint Petersburg")
    ("Édimbourg" "Edinburgh")
    ("Edimbourg" "Edinburgh")
    ("Cité du Vatican" "Vatican City" )
    ("Séville" "Seville")
    ("Seóul" "Seoul" )
    ("Venise" "Venice")
    ;; :NATIONALITY-TRANS-FRENCH->ENGLISH
    ("Hollandais" "Dutch")
    ("Barcelone" "Barcelona")
    ("Français" "French")
    ("Italien" "Italian")
    ("Africain" "African")
    ("Africaine" "African")
    ("Algérien" "Algerian")
    ("Algérienne" "Algerian")
    ("Allemand" "German")
    ("Allemande" "German")
    ("Américain" "American")
    ("Américaine" "American")
    ("Anglais" "English")
    ("anglais" "English")
    ("Anglaise" "English")
    ("Argentine" "Argentinean")
    ("Asiatique" "Asian")
    ("Australien" "Australian")
    ("australien" "Australian")
    ("Australienne" "Australian")
    ("Autrichien" "Austrian")
    ("Autrichienne" "Austrian")
    ("autrichien" "Austrian")
    ("Belge" "Belgian")
    ("Belgique" "Belgian")
    ("Britannique" "British")
    ("Brésilien" "Brazilian")
    ("Brésilienne" "Brazilian")
    ("Canadien" "Canadian")
    ("Canadienne" "Canadian")
    ("Chinois" "Chinese")
    ("Chinoise" "Chinese")
    ("Danoise" "Danish")
    ("danoise" "Danish")
    ("égyptienne" "Egyptian")
    ("Égyptienne" "Egyptian")
    ("Espagnol" "Spanish")
    ("Espagnole" "Spanish")
    ("Européen" "Spanish")
    ("Européenne" "European")
    ("flamande" "Flemish")
    ("Français" "French")
    ("français" "French")
    ("Française" "French")
    ("française" "French")
    ("Hollandais" "Dutch")
    ("Hongrois" "Hungarian")
    ("Indien" "Indian")
    ("Indienne" "Indian")
    ("Irlandais" "Irish")
    ("Irlandaise" "Irish")
    ("Italien" "Italian")
    ("Italienne" "Italian")
    ("Japonais" "Japanese")
    ("Japonaise" "Japanese")
    ("Marocain" "Moroccan")
    ("Marocaine" "Moroccan")
    ("Mexicain" "Mexican")
    ("Mexicaine" "Mexican")
    ("Norvégien" "Norwegian")
    ("Néerlandais" "Dutch")
    ("Néerlandaise" "Dutch")
    ("Polonais" "Polish")
    ("Polonaise" "Polish")
    ("Portugais" "Portuguese")
    ("Portugaise" "Portuguese")
    ("Suisse" "Swiss")
    ("suédoise" "Swedish")
    ("Suédoise" "Swedish")
    ("Suédois" "Swedish")
    ("Sénégalais" "Senegalese")
    ("Sénégalaise" "Senegalese")
    ("Tchéchoslovaque" "Czech")
    ("Égyptien" "Egyptian")
    ("Égyptienne" "Egyptian"))  
  "*Regexps to match French place names with and without diacrtits.
Match with and without out all uppercase styled names - for Bénézit auctions.\n
:CALLED-BY `mon-defranc-places'.
:SEE-ALSO `*regexp-defranc-benezit*', `*regexp-clean-benezit-fields*'.\n►►►")
;;
;;; :TEST-ME  *regexp-defranc-places*
;;
;;;(progn (makunbound '*regexp-defranc-places*)
;;;       (unintern '*regexp-defranc-places*) )

;;; ==============================
;;; :NOTE Needs to be fleshed out into a dedicated benezit.el
;;;       Not ready to flag away à -> a).
;;; :RENAMED `regexp-defranc-benezit' -> `*regexp-defranc-benezit*'
;;; :REMOVED Benezit specific fields to `*regexp-clean-benezit-fields*'
;;; :MODIFICATIONS <Timestamp: #{2009-09-18T15:07:44-04:00Z}#{09385} - by MON KEY>
(defvar *regexp-defranc-benezit*
  '( ;; :BENEZIT-HEADERS-FRENCH
    ("Actif à" "Active in") 
    ("siècle" "Century")
    ("Mort en" "Died in")
    ("Mort vers" "Died circa")
    ("Mort le" "Died")
    ("Mort à" "Died in")
    ("Né en" "Born in")
    ("Né le" "Born")
    ("Né à" "Born in")
    ("Née en" "Born in")
    ("Née à" "Born in")
    ("Née le" "Born")
    ("æ" "ae")
    ("œ" "oe")
    ("Voir aussi" ":SEE-ALSO")
    ("Il exposa au" "Exhibited at the")
    ("Il exposa à" "Exhibited in")
    ("Roi" "King")
    ;; :ROLES-FRENCH->ENG 
    ("Affichiste" "Poster Artist")
    ("Aquafortiste" "Etcher")
    ("Aquarelliste" "Watercolorist")
    ("Architecte" "Architect")
    ("Auteur" "Author")
    ("Caricaturiste" "Caricaturist")
    ("Couturier" "Clothing Designer")
    ("Crtique d'Art" "Art Critic")
    ("Dessinateur" "Designer")
    ("Dessinatrice" "Designer")
    ("Décorateur de Maison" "Interior Decorator")
    ("Décorateur de Théâtre" "Set Designer")
    ("Fondeur" "caster")
    ("Graveur" "Engraver")
    ("Graveur sur Bois" "wood engraver")
    ("Illustrateur de Livres Pour Enfants" "Childrens Book Artist")
    ("Illustrateur" "Illustrator")
    ("Illustratrice" "Illustrator")
    ("Lithographe" "Lithographer")
    ("Peintre de Portaits" "Portraitist")
    ("Portraitiste" "Portraitist")
    ("Sculpteur" "Sculptor")
    ("Écrivain" "Author")
    ("Céramiste" "ceramicist")
    ("Peintre de Cartons de Tapisseries" "tapestry designer")
    ("Tapissier" "tapestry maker")
    ("Orfèvre" "goldsmith")
    ("Sérigraphe" "Serigrapher")
    ("Peintre de Natures Mortes" "Still Life Painter")
    ("Fresquiste" "fresco painter")
    ("Peintre de Paysages" "Landscape Painter")
    ("Paysagiste" "Landscapist")
    ("Modeleur" "modeler")
    ("Mosaïste" "mosaicist")
    ("Peintre Verrier" "glass painter")
    ("Peintre" "Painter")
    ("peintre" "painter"))
  "*Regexps to match and convert French Bénézit term to equivalent English term.\n
:NOTE Tries to conservatively match on terms with diacrtics.
:CALLED-BY `mon-defranc-benezit'.\n
:SEE-ALSO `*regexp-clean-benezit-fields*', `mon-cln-benezit-fields'.\n►►►")
;;
;;; :TEST-ME  *regexp-defranc-benezit*
;;
;;;(progn (makunbound '*regexp-defranc-benezit*)
;;;       (unintern '*regexp-defranc-benezit*) )

;;; ==============================
;;; :CREATED <Timestamp: #{2009-09-18T15:11:27-04:00Z}#{09385} - by MON KEY>
(defvar *regexp-clean-benezit-fields*
  '(("^Musées :" "BENEZIT-MUSEUMS:") 
    ("^Musees:" "BENEZIT-MUSEUMS:") 
    ("^Musees :" "BENEZIT-MUSEUMS:") 
    ("^Musees:" "BENEZIT-MUSEUMS:") 
    ("^MUSÉES:" "BENEZIT-MUSEUMS:") 
    ("^MUSÉES :" "BENEZIT-MUSEUMS:") 
    ("^Bibliogr.:"  "BENEZIT-BIBLIOGRAPHY:") 
    ("^Bibliogr. :" "BENEZIT-BIBLIOGRAPHY:") 
    ("^BIBLIOGR.:" "BENEZIT-BIBLIOGRAPHY:") 
    ("^BIBLIOGR. :" "BENEZIT-BIBLIOGRAPHY:") 
    ("^Ventes Publiques" "BENEZIT-AUCTION-RECORDS:") 
    ("^VENTES PUBLIQUES :" "BENEZIT-AUCTION-RECORDS:") 
    ("^VENTES PUBLIQUES:" "BENEZIT-AUCTION-RECORDS:") )
  "*Regexp match and normalize commonly encountered Benezit fields.\n
:CALLED-BY `mon-cln-benezit-fields'.\n
Fontlocked with `naf-mode-benezit-section-flag'.\n
:SEE-ALSO `*regexp-defranc-benezit*', `mon-defranc-benezit'.\n
:USED-IN `naf-mode'.\n►►►")
;;
;;; :TEST-ME  *regexp-clean-benezit-fields*
;;
;;;(progn (makunbound '*regexp-clean-benezit-fields*) 
;;;       (unintern '*regexp-clean-benezit-fields*) )

;;; ==============================
(defvar *regexp-german-to-eng*
 '(;; :PLACE-NAMES-GERMAN
   ("Kopenhagen" "Copenhagen") 
   ("München" "Munich")
   ("Zürich" "Zurich")
   ;("Königin" "Konigin")
   ("Groqß-Berlin" "Greater Berlin")
   ;; :ROLES-GERMAN
   ("Architekt" "Architect"))
"*A list of translation pairs for translating place names from German to Engrish.\n
:SEE-ALSO .\n
:USED-IN `naf-mode'.\n►►►")
;;
;;; :TEST-ME  *regexp-german-to-eng*
;;
;;;(progn (makunbound '*regexp-german-to-eng*) (unintern '*regexp-german-to-eng*) )

;;; ==============================
(defvar *regexp-clean-bib*
   '(("n°" "No.")      ;; :NUMBERING
     ("N°" "No.")      ;; :NUMBERING
     ("no\\." "No.")   ;; :NUMBERING
     ("pp\\." "pages")
     ("§" "sections")  ;; :NAME SECTION-SIGN :CODE-POINT 0xA7
     ("vol" "Volume")
     ("vol\\." "Volume")
     ("vols" "Volumes")
     ("Vol" "Volume")
     ("Vols" "Volumes")
     ("Vol\\." "Volume"))
   "*Regexp list to match and normalize common bibliography abbreviations.\n
:CALLED-BY `mon-cln-bib'.
:SEE-ALSO .\n►►►")
;;
;;; :TEST-ME  *regexp-clean-bib* 
;;;(progn (makunbound '*regexp-clean-bib*) (unintern '*regexp-clean-bib*) )

;;; ==============================
(defvar *regexp-common-abbrevs*
 '(("\\( Acad\\. of\\)" " Academy of")
    ("\\( Phila\\. \\)" " Philadelphia ")
    ("\\( Chi\\. \\)" " Chicago ")
    ("\\( Mass\\. \\)" " Massachusetts ")
    ("\\( Conn\\. \\)" " Connecticut ")
    ("\\( Ont\\. \\)" " Ontario ")
    ("\\( Can\\. \\)" " Canada ")
    ("\\( N\\. Y\\. \\)" " New York ")
    ("\\( Amer\\. \\)" " American ")
    ("\\( Au\\. \\)" " Author ")
    ("\\( Bro\\. \\)" " Brother ")
    ("\\( Bros\\. \\)" " Brothers ")
    ("\\( Cath\\. Sch\\. \\)" " Catholic School ")
    ("\\( Ch\\. \\)" " Choir ")
    ("\\( Coll\\. \\)" " College ")
    ("\\( Comp\\. \\)" " Composer ") 
    ("\\( Cons\\. \\)" " Conservatory ")
    ("\\( Dept\\. \\)" " Department ")
    ("\\( Ed\\. \\)" " Editor ")
    ("\\( Inst\\. \\)" " Institute ")
    ("\\( Met\\. Opera Co\\. \\)" " Metropolitan Opera Company ")
    ("\\( Mus\\. \\)" " Music ")
    ("\\( Orch\\. \\)" " Orchestra ")
    ("\\( Sch\\. \\)" " School ")
    ("\\( Soc\\. of\\)" " Society of")
    ("\\( Stud\\. \\)" " Studied ")
    ("\\( Univ\\. of\\)" " University of ")
    ("\\( cond\\. \\)" " Condcutor ")
    ("\\( ed\\. \\)" " edition ")
    ("\\( acomp\\. \\)" " accompaniment ")
    ("\\( dir\\. \\)" " Director ")
    ("\\( fac\\. \\)" " faculty ")
    ("\\( incl\\. \\)" " including ")
    ("\\( org\\. \\)" " organ ")
    ("\\( pia\\. \\)" " piano ")
    ("\\( prof\\. \\)" " Professor ")
    ("\\( publ\\. \\)" " published ")
    ("\\( res\\. \\)" " resides ")
    ("\\( sop\\. \\)" " soprano ")
    ("\\( yrs\\. \\)" " years ")
    ("\\( vols\\. \\)" " volumes ")
    ("\\( tchr\\. \\)" " teacher "))
 "*Regexp list to mach and normalize common abbreviations.\n
Especially useful for those with `.' at end of string.
:NOTE: Function first designed for used to search replace in:
The Etude Bios Composers Musicians Bios - Etude July 1933 p 434.\n
:CALLED-BY `mon-replace-common-abbrevs'.\n
:SEE-ALSO .\n
:USED-IN `naf-mode'.\n►►►")
;;
;;; :TEST-ME  *regexp-common-abbrevs*
;;
;;;(progn (makunbound '*regexp-common-abbrevs*)
;;;       (unintern '*regexp-common-abbrevs*) )

;;; ==============================
;;; :COURTESY :FILE thingatpt.el
;;; :SEE: (URL `http://www.iana.org/assignments/uri-schemes.html')
;;; :CREATED <Timestamp: Saturday April 18, 2009 @ 04:32.19 PM - by MON KEY>
(defvar *mon-wrap-url-schemes*
  (let  ((wrap-if
          '("ftp://" "http://" "gopher://" "mailto:" "news:" "nntp:"
            "telnet://" "wais://" "file:/" "prospero:" "z39.50s:" "z39.50r:"
            "cid:" "mid:" "vemmi:" "service:" "imap:" "nfs:" "acap:" "rtsp:"
            "tip:" "pop:" "data:" "dav:" "opaquelocktoken:" "sip:" "tel:" "fax:"
            "modem:" "ldap:" "https://" "soap.beep:" "soap.beeps:" "urn:" "go:"
            "afs:" "tn3270:" "mailserver:" "crid:" "dict:" "dns:" "dtn:" "h323:"
            "ipp:" "iris.beep:" "mtqp:" "mupdate:" "pres:" "sips:"  "snmp:" "tftp:"
            "xmlrpc.beep:" "xmlrpc.beeps:" "xmpp:" "snews:" "irc:" "mms://" "mmsh://"
            "info:" "im:" "tag:")))
    (regexp-opt wrap-if 'paren))
  "*Regexp to wrap URLs with \(URL `'\).\n 
Elements of list are wrapped as follows:
 http://www.google.com ->  \(URL `http://www.google.com'\)\n
:CALLED-BY `mon-wrap-all-urls' to identify URLs in buffer.\n
:SEE (URL `http://www.iana.org/assignments/uri-schemes.html').\n
:SEE-ALSO `mon-wrap-one-url' `mon-wrap-url', `mon-wrap-text',`mon-wrap-span',
`mon-wrap-selection', `mon-wrap-with', `thing-at-point-url-at-point',
`*regexp-clean-xml-parse*',`*regexp-percent-encoding-reserved-chars*',
`*regexp-clean-url-utf-escape*', `*regexp-clean-html-escape*'.\n►►►")
;;
;;; :TEST-ME  *mon-wrap-url-schemes*
;;
;;;(progn (makunbound '*mon-wrap-url-schemes*)(unintern '*mon-wrap-url-schemes*) )


;;; ==============================
;;; :NOTE :SEE :FILE faces.el :FUNCTION `read-color'
;;; :CREATED <Timestamp: #{2010-02-17T11:28:46-05:00Z}#{10073} - by MON KEY>
(defvar *regexp-rgb-hex*
  '((bol->eol . ;; "^#?\\([a-fA-F0-9][a-fA-F0-9][a-fA-F0-9]\\)+$")
     "^#?\\([[:xdigit:]]\\{6,6\\}\\)$")
    (bol-wspc->eol . ;; "^ #?\\([a-fA-F0-9][a-fA-F0-9][a-fA-F0-9]\\)+")
     "^ #?\\([[:xdigit:]]\\{6,6\\}\\)$")
    (leading-wspc->eol . ;; " #?\\([a-fA-F0-9][a-fA-F0-9][a-fA-F0-9]\\)+$")
     " #?\\([[:xdigit:]]\\{6,6\\}\\)$")
    (bol->trailing-wspc . ;; " #?\\([a-fA-F0-9][a-fA-F0-9][a-fA-F0-9]\\)+$")
     "^#?\\([[:xdigit:]]\\{6,6\\}\\) ")
     (wspc-bracketed . ;; " #?\\([a-fA-F0-9][a-fA-F0-9][a-fA-F0-9]\\)+ ")
      " ?#?\\([[:xdigit:]]\\{6,6\\}\\) ?"))
  "*Regexp alist key value pairs to match RGB hex strings.
Elements of list are conses of the form:
 \(SYMBOL-REGEXP-TYPE . \"REGEXP-STRING\")\n
Various keys are provided for matching RGB hex strings at bol, eol, with/without
leading/trailing whitespace.\n
:EXAMPLE\n\n(assoc 'wspc-bracketed *regexp-rgb-hex*)\n
:SEE-ALSO `*regexp-hexcolor-keywords*', `mon-hexcolor-add-to-font-lock'.\n►►►")

;;; ==============================
;;; :NOTE Percent-encoding reserved characters:
;;; reserved    = gen-delims / sub-delims
;;; gen-delims  = ":" / "/" / "?" / "#" / "[" / "]" / "@"
;;; sub-delims  = "!" / "$" / "&" / "'" / "(" / ")"
;;;                   / "*" / "+" / "," / ";" / "="
;;; :SEE: RFC 3986
;;; ==============================
(defvar *regexp-percent-encoding-reserved-chars*
  '(("%21" "!")    ("%2A" "*")    ("%27" "'")    ("%28" "(")
    ("%29" ")")    ("%3B" ";")    ("%3A" ":")    ("%40" "@")
    ("%26" "&")    ("%3D" "=")    ("%2B" "+")    ("%24" "$")
    ("%2C" ",")    ("%2F" "/")    ("%3F" "?")    ("%25" "%")
    ("%23" "#")    ("%5B" "[")    ("%5D" "]"))
"*Regexp list to match and normalize percent encoded chars.\n.
:SEE-ALSO `*mon-wrap-url-schemes*', `*regexp-clean-xml-parse*',
`*regexp-percent-encoding-reserved-chars*', `*regexp-clean-url-utf-escape*',
`*regexp-clean-html-escape*'.\n►►►")
;;
;;; :TEST-ME  *regexp-percent-encoding-reserved-chars*
;;
;;;(progn (makunbound '*regexp-percent-encoding-reserved-chars*) 
;;;       (unintern '*regexp-percent-encoding-reserved-chars* ) )

;;; ==============================
;;; :TODO Needs to be adjusted for UTF-8
(defvar *regexp-cp1252-to-latin1*
  '(("\x80" "e")     ("\x81" " ")       ("\x82" "'")    ("\x83" "f")
    ("\x84" "\"")    ("\x85" "...")     ("\x86" "+")    ("\x87" "#")
    ("\x88" "^")     ("\x89" "0/00")    ("\x8A" "S")    ("\x8B" "<")
    ("\x8C" "OE")    ("\x8D" " ")       ("\x8E" "Z")    ("\x8F" " ")
    ("\x90" " ")     ("\x91" "`")       ("\x92" "'")    ("\x93" "\"")
    ("\x94" "\"")    ("\x95" "*")       ("\x96" "-")    ("\x97" "--")
    ("\x98" "~")     ("\x99" "\(TM\)")  ("\x9A" "s")    ("\x9B" ">")
    ("\x9C" "oe")    ("\x9D" " ")       ("\x9E" "z")    ("\x9F" "Y"))
"*Regexp list to convert cp1252 enchoded chars to latin1-iso-8859-*.\n
:CALLED-BY `mon-trans-cp1252-to-latin1'.\n
:SEE-ALSO `mon-make-iso-latin-1-approximation', `mon-cln-iso-latin-1',
`*iso-latin-1-approximation*'.\n►►►")
;;
;;; :TEST-ME  *regexp-cp1252-to-latin1*
;;
;;;(progn (makunbound '*regexp-cp1252-to-latin1*)
;;;       (unintern '*regexp-cp1252-to-latin1*) )

;;; ==============================
;;; :COURTESY Jeremy English's <jhe@jeremyenglish.org> :HIS google-define.el
;;; :CREATED <Timestamp: #{2010-03-22T11:51:35-04:00Z}#{10121} - by MON KEY>
(defconst *google-define-html-entry-table*
  `(("&#34;"  "&quot;" "\"")  ("&#38;"  "&amp;" "&")    ("&#39;" "&yow;" "'")
    ("&#62;"  "&gt;" ">")     ("&#160;" "&nbsp;" " ")   ("&#161;" "&iexcl;" "¡")
    ("&#162;" "&cent;" "¢")   ("&#163;" "&pound;" "£")  ("&#164;" "&curren;" "¤")
    ("&#165;" "&yen;" "¥")    ("&#166;" "&brvbar;" "¦") ("&#167;" "&sect;" "§")
    ("&#168;" "&uml;" "¨")    ("&#169;" "&copy;" "©")   ("&#170;" "&ordf;" "ª")
    ("&#171;" "&laquo;" "«")  ("&#172;" "&not;" "¬")    ("&#173;" "&shy;" "\xad") ;<- :CHANGED
    ("&#174;" "&reg;" "®")    ("&#175;" "&macr;" "¯")   ("&#176;" "&deg;" "°")
    ("&#177;" "&plusmn;" "±") ("&#178;" "&sup2;" "²")   ("&#179;" "&sup3;" "³")
    ("&#180;" "&acute;" "´")  ("&#181;" "&micro;" "µ")  ("&#182;" "&para;" "¶")
    ("&#183;" "&middot;" "·") ("&#184;" "&cedil;" "¸")  ("&#185;" "&sup1;" "¹")
    ("&#186;" "&ordm;" "º")   ("&#187;" "&raquo;" "»")  ("&#188;" "&frac14;" "¼")
    ("&#189;" "&frac12;" "½") ("&#190;" "&frac34;" "¾") ("&#191;" "&iquest;" "¿")
    ("&#192;" "&Agrave;" "À") ("&#193;" "&Aacute;" "Á") ("&#194;" "&Acirc;" "Â")
    ("&#195;" "&Atilde;" "Ã") ("&#196;" "&Auml;" "Ä")   ("&#197;" "&Aring;" "Å")
    ("&#198;" "&AElig;" "Æ")  ("&#199;" "&Ccedil;" "Ç") ("&#200;" "&Egrave;" "È")
    ("&#201;" "&Eacute;" "É") ("&#202;" "&Ecirc;" "Ê")  ("&#203;" "&Euml;" "Ë")
    ("&#204;" "&Igrave;" "Ì") ("&#205;" "&Iacute;" "Í") ("&#206;" "&Icirc;" "Î")
    ("&#207;" "&Iuml;" "Ï")   ("&#208;" "&ETH;" "Ð")    ("&#209;" "&Ntilde;" "Ñ")
    ("&#210;" "&Ograve;" "Ò") ("&#211;" "&Oacute;" "Ó") ("&#212;" "&Ocirc;" "Ô")
    ("&#213;" "&Otilde;" "Õ") ("&#214;" "&Ouml;" "Ö")   ("&#215;" "&times;" "×")
    ("&#216;" "&Oslash;" "Ø") ("&#217;" "&Ugrave;" "Ù") ("&#218;" "&Uacute;" "Ú")
    ("&#219;" "&Ucirc;" "Û")  ("&#220;" "&Uuml;" "Ü")   ("&#221;" "&Yacute;" "Ý")
    ("&#222;" "&THORN;" "Þ")  ("&#223;" "&szlig;" "ß")  ("&#224;" "&agrave;" "à")
    ("&#225;" "&aacute;" "á") ("&#226;" "&acirc;" "â")  ("&#227;" "&atilde;" "ã")
    ("&#228;" "&auml;" "ä")   ("&#229;" "&aring;" "å")  ("&#230;" "&aelig;" "æ")
    ("&#231;" "&ccedil;" "ç") ("&#232;" "&egrave;" "è") ("&#233;" "&eacute;" "é")
    ("&#234;" "&ecirc;" "ê")  ("&#235;" "&euml;" "ë")   ("&#236;" "&igrave;" "ì")
    ("&#237;" "&iacute;" "í") ("&#238;" "&icirc;" "î")  ("&#239;" "&iuml;" "ï")
    ("&#240;" "&eth;" "ð")    ("&#241;" "&ntilde;" "ñ") ("&#242;" "&ograve;" "ò")
    ("&#243;" "&oacute;" "ó") ("&#244;" "&ocirc;" "ô")  ("&#245;" "&otilde;" "õ")
    ("&#246;" "&ouml;" "ö")   ("&#247;" "&divide;" "÷") ("&#248;" "&oslash;" "ø")
    ("&#249;" "&ugrave;" "ù") ("&#250;" "&uacute;" "ú") ("&#251;" "&ucirc;" "û")
    ("&#252;" "&uuml;" "ü")   ("&#253;" "&yacute;" "ý") ("&#254;" "&thorn;" "þ")
    ("&#255;" "&yuml;" "ÿ")   ("&#60;" "&lt;" "<"))
   "
:CALLED-BY `*regexp-clean-url-utf-escape*', `*regexp-clean-html-escape*'
:SEE-ALSO `*mon-wrap-url-schemes*', `*regexp-clean-xml-parse*',
`*regexp-percent-encoding-reserved-chars*', `*regexp-clean-url-utf-escape*',
`*regexp-clean-ulan-diacritics*', `*regexp-cp1252-to-latin1*'.\n►►►")

;;; ==============================
;;; :TODO Conversion code-slide for `naf-mode' related code remains (unfinished) in:
;;; :FILE /notes/naf-url-googl-code-slide.el
;;; :MOVED <- mon-url-utils.el <Timestamp: Tuesday February 17, 2009>
;;; :MODIFICATIONS <Timestamp: #{2010-03-22T11:51:21-04:00Z}#{10121} - by MON KEY>
;;; ==============================
(defvar *regexp-clean-url-utf-escape*
  '(("&#34;"   "\"") ("&#38;"    "&") ("&#39;"    "'") ("&#60;"    "<")
    ("&#62;"    ">") ("&#160;"   " ") ("&#161;"   "¡") ("&#162;"   "¢")
    ("&#163;"   "£") ("&#164;"   "¤") ("&#165;"   "¥") ("&#166;"   "¦")
    ("&#167;"   "§") ("&#168;"   "¨") ("&#169;"   "©") ("&#170;"   "ª")
    ("&#171;"   "«") ("&#172;"   "¬") ("&#173;"   "\xad") ("&#174;"   "®")
    ("&#175;"   "¯") ("&#176;"   "°") ("&#177;"   "±") ("&#178;"   "²")
    ("&#179;"   "³") ("&#180;"   "´") ("&#181;"   "µ") ("&#182;"   "¶")
    ("&#183;"   "·") ("&#184;"   "¸") ("&#185;"   "¹") ("&#186;"   "º")
    ("&#187;"   "»") ("&#188;"   "¼") ("&#189;"   "½") ("&#190;"   "¾")
    ("&#191;"   "¿") ("&#192;"   "À") ("&#193;"   "Á") ("&#194;"   "Â")
    ("&#195;"   "Ã") ("&#196;"   "Ä") ("&#197;"   "Å") ("&#198;"   "Æ")
    ("&#199;"   "Ç") ("&#200;"   "È") ("&#201;"   "É") ("&#202;"   "Ê")
    ("&#203;"   "Ë") ("&#204;"   "Ì") ("&#205;"   "Í") ("&#206;"   "Î")
    ("&#207;"   "Ï") ("&#208;"   "Ð") ("&#209;"   "Ñ") ("&#210;"   "Ò")
    ("&#211;"   "Ó") ("&#212;"   "Ô") ("&#213;"   "Õ") ("&#214;"   "Ö")
    ("&#215;"   "×") ("&#216;"   "Ø") ("&#217;"   "Ù") ("&#218;"   "Ú")
    ("&#219;"   "Û") ("&#220;"   "Ü") ("&#221;"   "Ý") ("&#222;"   "Þ")
    ("&#223;"   "ß") ("&#224;"   "à") ("&#225;"   "á") ("&#226;"   "â")
    ("&#227;"   "ã") ("&#228;"   "ä") ("&#229;"   "å") ("&#230;"   "æ")
    ("&#231;"   "ç") ("&#232;"   "è") ("&#233;"   "é") ("&#234;"   "ê")
    ("&#235;"   "ë") ("&#236;"   "ì") ("&#237;"   "í") ("&#238;"   "î")
    ("&#239;"   "ï") ("&#240;"   "ð") ("&#241;"   "ñ") ("&#242;"   "ò")
    ("&#243;"   "ó") ("&#244;"   "ô") ("&#245;"   "õ") ("&#246;"   "ö")
    ("&#247;"   "÷") ("&#248;"   "ø") ("&#249;"   "ù") ("&#250;"   "ú")
    ("&#251;"   "û") ("&#252;"   "ü") ("&#253;"   "ý") ("&#254;"   "þ")
    ("&#255;"   "ÿ"))
  "*Regexp to match replace utf8-escaped strings with character-representation.\n
:SEE-ALSO `*google-define-html-entry-table*', `*regexp-clean-html-escape*',
`*mon-wrap-url-schemes*', `*regexp-clean-xml-parse*',
`*regexp-percent-encoding-reserved-chars*',
`*regexp-clean-url-utf-escape*', `*regexp-clean-ulan-diacritics*'.\n►►►")
;;
;;; :TEST-ME  *regexp-clean-url-utf-escape*
;;
;;;(progn (makunbound '*regexp-clean-url-utf-escape*)
;;;       (unintern '*regexp-clean-url-utf-escape*) )

;;; ==============================
(defvar *regexp-clean-html-escape*
  '(("&quot;"   "\"") ("&amp;"     "&") ("&yow;"     "'") ("&lt;"      "<")
    ("&gt;"      ">") ("&nbsp;"    " ") ("&iexcl;"   "¡") ("&cent;"    "¢")
    ("&pound;"   "£") ("&curren;"  "¤") ("&yen;"     "¥") ("&brvbar;"  "¦")
    ("&sect;"    "§") ("&uml;"     "¨") ("&copy;"    "©") ("&ordf;"    "ª")
    ("&laquo;"   "«") ("&not;"     "¬") ("&shy;"     "\xad") ("&reg;"     "®") 
    ("&macr;"    "¯") ("&deg;"     "°") ("&plusmn;"  "±") ("&sup2;"    "²") 
    ("&sup3;"    "³") ("&acute;"   "´") ("&micro;"   "µ") ("&para;"    "¶") 
    ("&middot;"  "·") ("&cedil;"   "¸") ("&sup1;"    "¹") ("&ordm;"    "º") 
    ("&raquo;"   "»") ("&frac14;"  "¼") ("&frac12;"  "½") ("&frac34;"  "¾") 
    ("&iquest;"  "¿") ("&Agrave;"  "À") ("&Aacute;"  "Á") ("&Acirc;"   "Â") 
    ("&Atilde;"  "Ã") ("&Auml;"    "Ä") ("&Aring;"   "Å") ("&AElig;"   "Æ") 
    ("&Ccedil;"  "Ç") ("&Egrave;"  "È") ("&Eacute;"  "É") ("&Ecirc;"   "Ê") 
    ("&Euml;"    "Ë") ("&Igrave;"  "Ì") ("&Iacute;"  "Í") ("&Icirc;"   "Î") 
    ("&Iuml;"    "Ï") ("&ETH;"     "Ð") ("&Ntilde;"  "Ñ") ("&Ograve;"  "Ò") 
    ("&Oacute;"  "Ó") ("&Ocirc;"   "Ô") ("&Otilde;"  "Õ") ("&Ouml;"    "Ö") 
    ("&times;"   "×") ("&Oslash;"  "Ø") ("&Ugrave;"  "Ù") ("&Uacute;"  "Ú") 
    ("&Ucirc;"   "Û") ("&Uuml;"    "Ü") ("&Yacute;"  "Ý") ("&THORN;"   "Þ") 
    ("&szlig;"   "ß") ("&agrave;"  "à") ("&aacute;"  "á") ("&acirc;"   "â") 
    ("&atilde;"  "ã") ("&auml;"    "ä") ("&aring;"   "å") ("&aelig;"   "æ") 
    ("&ccedil;"  "ç") ("&egrave;"  "è") ("&eacute;"  "é") ("&ecirc;"   "ê") 
    ("&euml;"    "ë") ("&igrave;"  "ì") ("&iacute;"  "í") ("&icirc;"   "î") 
    ("&iuml;"    "ï") ("&eth;"     "ð") ("&ntilde;"  "ñ") ("&ograve;"  "ò") 
    ("&oacute;"  "ó") ("&ocirc;"   "ô") ("&otilde;"  "õ") ("&ouml;"    "ö") 
    ("&divide;"  "÷") ("&oslash;"  "ø") ("&ugrave;"  "ù") ("&uacute;"  "ú") 
    ("&ucirc;"   "û") ("&uuml;"    "ü") ("&yacute;"  "ý") ("&thorn;"   "þ") 
    ("&yuml;"    "ÿ"))
  "*List of regexp match/replace pairs for HTML escaped chars.\n
:SEE-ALSO `*google-define-html-entry-table*', `*regexp-clean-html-escape*',
`*mon-wrap-url-schemes*', `*regexp-clean-xml-parse*',
`*regexp-percent-encoding-reserved-chars*', `*regexp-clean-url-utf-escape*',
`*regexp-clean-ulan-diacritics*', `*regexp-cp1252-to-latin1*'.\n►►►")
;;
;;; :TEST-ME  *regexp-clean-html-escape*
;;
;;;(progn (makunbound '*regexp-clean-html-escape*)
;;;        (unintern '*regexp-clean-html-escape*) )

;;; ==============================
(defvar *regexp-clean-ulan-diacritics*
  '(("$00a" "á")  ("$00c" "ć")  ("$00e" "é")  ("$00i" "í")
    ("$00l" "ĺ")  ("$00n" "ń")  ("$00o" "ó")  ("$00r" "ŕ")
    ("$00s" "ś")  ("$00u" "ú")  ("$00y" "ý")  ("$00z" "ź")
    ("$01a" "ā")  ("$01e" "ē")  ("$01i" "ī")  ("$01o" "ō")
    ("$01u" "ū")  ("$02a" "à")  ("$02e" "è")  ("$02i" "ì")
    ("$02o" "ò")  ("$02u" "ù")  ("$02y" "ỳ")  ("$03a" "â")
    ("$03c" "ĉ")  ("$03e" "ê")  ("$03g" "ĝ")  ("$03h" "ĥ")
    ("$03i" "î")  ("$03j" "ĵ")  ("$03o" "ô")  ("$03s" "ŝ")
    ("$03u" "û")  ("$03w" "ŵ")  ("$03y" "ŷ")  ("$04a" "ä")
    ("$04e" "ë")  ("$04i" "ï")  ("$04o" "ö")  ("$04u" "ü")
    ("$04y" "ÿ")  ("$05c" "ç")  ("$05g" "ģ")  ("$05k" "ķ")
    ("$05l" "ļ")  ("$05n" "ņ")  ("$05r" "ŗ")  ("$05s" "ş")
    ("$05t" "ţ")  ("$06a" "ă")  ("$06e" "ĕ")  ("$06g" "ğ")
    ("$06i" "ĭ")  ("$06o" "ŏ")  ("$06u" "ŭ")  ("$07a" "ǎ")
    ("$07c" "č")  ("$07d" "ď")  ("$07e" "ě")  ("$07i" "ǐ")
    ("$07l" "ľ")  ("$07n" "ň")  ("$07o" "ǒ")  ("$07r" "ř")
    ("$07s" "š")  ("$07t" "ť")  ("$07u" "ǔ")  ("$07z" "ž")
    ("$08c" "ċ")  ("$08e" "ė")  ("$08g" "ġ")  ("$08z" "ż")
    ("$09a" "ã")  ("$09e" "ẽ")  ("$09i" "ĩ")  ("$09n" "ñ")
    ("$09o" "õ")  ("$09u" "ũ")  ("$09y" "ỹ")  ("$10a" "å")
    ("$10u" "ů")  ("$12o" "ő")  ("$12u" "ű")  ("$13l" "ł")
    ("$14o" "ø")  ("$15a" "ạ")  ("$15e" "ẹ")  ("$15i" "ị")
    ("$15o" "ọ")  ("$15u" "ụ")  ("$15y" "ỵ")  ("$16l" "ŀ")
    ("$17a" "ą")  ("$17e" "ę")  ("$17i" "į")  ("$17u" "ų")
    ("$18s" "ß")  ("$19t" "þ")  ("$20T" "Þ")  ("$21d" "ð")
    ("$24a" "ấ")  ("$24e" "ế")  ("$24o" "ố")  ("$25o" "ợ")
    ("$25u" "ự")  ("$26o" "ớ")  ("$26u" "ứ")  ("$27a" "ắ")
    ("$29a" "ậ")  ("$29e" "ệ")  ("$29o" "ộ")  ("$30a" "ầ")
    ("$30e" "ề")  ("$30o" "ồ")  ("$36u" "ữ")  ("$31a" "ằ")
    ("$32o" "ờ")  ("$32u" "ừ")  ("$36o" "ỡ")  ("$37a" "ẵ")
    ("$38a" "ẫ")  ("$38e" "ễ")  ("$38o" "ỗ")  ("$39a" "ặ")
    ("$50o" "ơ")  ("$50u" "ư")  ("$55d" "đ")  ("$47s" "ș")
    ("$56t" "ŧ")  ("$69" "”")   ("$70a" "æ")  ("$71o" "œ")
    ("$73i" "ı")  ("$74" "·")   ("$75" "‘")   ("$81h" "ħ")
    ("$92a" "ə")  ("$93n" "ŋ")  ("$98a" "ª")  ("$99o" "º")
    ("$00A" "Á")  ("$00C" "Ć")  ("$00E" "É")  ("$00I" "Í")
    ("$00L" "Ĺ")  ("$00N" "Ń")  ("$00O" "Ó")  ("$00R" "Ŕ")
    ("$00S" "Ś")  ("$00U" "Ú")  ("$00Y" "Ý")  ("$00Z" "Ź")
    ("$02A" "À")  ("$02E" "È")  ("$02I" "Ì")  ("$02O" "Ò")
    ("$02U" "Ù")  ("$02Y" "Ỳ")  ("$01A" "Ā")  ("$01E" "Ē")
    ("$01I" "Ī")  ("$01O" "Ō")  ("$01U" "Ū")  ("$03A" "Â")
    ("$03C" "Ĉ")  ("$03E" "Ê")  ("$03G" "Ĝ")  ("$03H" "Ĥ")
    ("$03I" "Î")  ("$03J" "Ĵ")  ("$03O" "Ô")  ("$03S" "Ŝ")
    ("$03U" "Û")  ("$03W" "Ŵ")  ("$03Y" "Ŷ")  ("$04A" "Ä")
    ("$04E" "Ë")  ("$04I" "Ï")  ("$04O" "Ö")  ("$04U" "Ü")
    ("$04Y" "Ÿ")  ("$05C" "Ç")  ("$05G" "Ģ")  ("$05K" "Ķ")
    ("$05L" "Ļ")  ("$05N" "Ņ")  ("$05R" "Ŗ")  ("$05S" "Ş")
    ("$05T" "Ţ")  ("$06A" "Ă")  ("$06E" "Ĕ")  ("$06G" "Ğ")
    ("$06I" "Ĭ")  ("$06O" "Ŏ")  ("$06U" "Ŭ")  ("$07A" "Ǎ")
    ("$07C" "Č")  ("$07D" "Ď")  ("$07E" "Ě")  ("$07I" "Ǐ")
    ("$07L" "Ľ")  ("$07N" "Ň")  ("$07O" "Ǒ")  ("$07R" "Ř")
    ("$07S" "Š")  ("$07T" "Ť")  ("$07U" "Ǔ")  ("$07Z" "Ž")
    ("$08C" "Ċ")  ("$08E" "Ė")  ("$08G" "Ġ")  ("$08I" "İ")
    ("$08M" "Ṁ")  ("$08N" "Ṅ")  ("$08R" "Ṙ")  ("$08Z" "Ż")
    ("$09A" "Ã")  ("$09E" "Ẽ")  ("$09I" "Ĩ")  ("$09N" "Ñ")
    ("$09O" "Õ")  ("$09U" "Ũ")  ("$09Y" "Ỹ")  ("$10A" "Å")
    ("$10U" "Ů")  ("$14O" "Ø")  ("$12O" "Ő")  ("$12U" "Ű")
    ("$13L" "Ł")  ("$15A" "Ạ")  ("$15E" "Ẹ")  ("$15I" "Ị")
    ("$15O" "Ọ")  ("$15U" "Ụ")  ("$15Y" "Ỵ")  ("$16L" "Ŀ")
    ("$17A" "Ą")  ("$17E" "Ę")  ("$17I" "Į")  ("$17U" "Ų")
    ("$21D" "Ð")  ("$24A" "Ấ")  ("$24E" "Ế")  ("$24O" "Ố")
    ("$26O" "Ớ")  ("$26U" "Ứ")  ("$29A" "Ậ")  ("$29E" "Ệ")
    ("$29O" "Ộ")  ("$25O" "Ợ")  ("$25U" "Ự")  ("$27A" "Ắ")
    ("$38O" "Ỗ")  ("$37A" "Ẵ")  ("$39A" "Ặ")  ("$50O" "Ơ")
    ("$50U" "Ư")  ("$55D" "Đ")  ("$56T" "Ŧ")  ("$57A" "Æ")
    ("$58O" "Œ")  ("$81H" "Ħ")  ("$93N" "Ŋ")  ("$31A" "Ằ")
    ("$30A" "Ầ")  ("$30E" "Ề")  ("$30O" "Ồ")  ("$32O" "Ờ")
    ("$32U" "Ừ")  ("$36O" "Ỡ")  ("$36U" "Ữ")  ("$38A" "Ẫ")
    ("$38E" "Ễ")  ("$47S" "Ș"))
  "*Regexp list to match and normalize ULAN encoded chars.\n
:SEE-ALSO `mon-cln-ulan', `*regexp-clean-ulan*', `*regexp-clean-ulan-fields*',
`*regexp-clean-ulan-dispatch-chars*', `*regexp-percent-encoding-reserved-chars*',
`*regexp-clean-url-utf-escape*', `*regexp-clean-html-escape*', `*regexp-clean-loc*',
`*regexp-cp1252-to-latin1*'.\n:USED-IN `naf-mode'.\n►►►")
;;
;;; :TEST-ME  *regexp-clean-ulan-diacritics*
;;
;;;(progn (makunbound '*regexp-cleann-ulan-diacritics*)
;;;       (unintern '*regexp-cleann-ulan-diacritics*) )

;;; ==============================
;;; !!!! DON'T Fuck with the formatting here. Best to leave it alone.
;;; There are TABS interspersed with other whitespace.!!!! 
;;; ==============================
(defvar *regexp-clean-ulan*
  '(  ("\\([: :]\\{2,2\\}[:	:]Record Type:\\)" "Record Type:")
      ("\\([:	:]Born:\\)" "Born:")
      ("^\\(\\([: :]\\{2,2\\}[:	:]\\)\\|\\([:	:][: :]?\\)\\)[: :]*?" "")
      ("^\\(\\([: :]?\\)\\([\\\\.]\\{5,85\\}\\)\\([: :]\\|[:	:]\\|[:	:]\\)+\\)" "")
      ("\\([: :]\\([\\\\.]\\{4,10\\}\\)\\([: :]\\|[:	:]\\|[:	:]\\)+\\)" " ")
      ("^\\([\\\\.]\\{4,4\\}[: :]\\{2,2\\}[:	:]\\)" "")
      ("\\(^\\(	\\)\\([A-Za-z]\\)\\)" "\\3")
      ("\\(^\\(	 \\.\\.\\.\\.  	\\)\\([A-Za-z]\\)\\)" "\\3")
      ("\\( \\.\\.\\.\\.  	\\)" " ")
      ("^\\(	 \\.\\.\\.\\.\\.\\.\\.\\.  	\\)" "")
      ("^\\(	 \\.\\.\\.\\.  	\\)" " ")
      ("\\(^\\(	\\)\\(\(\\)\\)" "\\3")
      ("^\\(\\(Note\\|Subject\\)\\(: \\.\\.\\.\\.\\.\\.\\.\\. 	\\)\\)" " ")
      ("\\(^\\(\\.\\.\\.\\.\\.\\.\\.\\.\\.\\.\\.\\.\\.\\.\\.\\.\\.\\.\\.\\.\\.\\.\\.\\.\\.\\.  	\\)\\([A-Za-z]\\)\\)" " \\3")
      ("\\(^\\(\\.\\.\\.\\.\\.\\.\\.\\.\\.\\.\\.\\.\\.\\.\\.\\.\\.\\.\\.\\.\\.\\.\\.\\.  	\\)\\([A-Za-z]\\)\\)" " \\3")
      ("\\(^\\(\\.\\.\\.\\.\\.\\.\\.\\.\\.\\.\\.\\.\\.\\.\\.\\.\\.\\.\\.\\.  	\\)\\([A-Za-z]\\)\\)" " \\3")
      ("^\\(\\.\\.\\.\\.\\.\\.\\.\\.\\.\\.\\.\\.\\.\\.\\.\\.\\.\\.  	\\)" " ")
      ("^\\(\\.\\.\\.\\.\\.\\.\\.\\.\\.\\.\\.\\.\\.\\.\\.\\.  	\\)" " ")
      ("\\( \\.\\.\\.\\.\\.\\.\\.\\. 	\\)" " ")
      ("\\( \\.\\.\\.\\.\\. \\)" " ")
      ("\\(^\\(	\\)$\\)" ""))
  "*Regexps for `mon-cln-ulan'. Replace unwanted formatting of ULAN scrapes.
Highly specific regexps for  periods, linebreaks, whitespace, tabs, etc.
While it may be possible to do grouping, character code, or syntax searches the
current approach guarantees success.\n
For additional specifications:
:SEE \(URL `http://www.getty.edu/research/conducting_research/vocabularies/ulan/').
:NOTE ULAN is ©J.Paul Getty Trust
:SEE-ALSO `*regexp-clean-ulan-fields*',`*regexp-clean-ulan-dispatch-chars*',
`*regexp-clean-ulan-diacritics*', `*regexp-ulan-contribs*'.\n:USED-IN `naf-mode'.\n►►►")
;;
;;; :TEST-ME  *regexp-clean-ulan*
;;
;;;(progn (makunbound '*regexp-clean-ulan*)
;;;       (unintern '*regexp-clean-ulan*) )

;;; ==============================
;;; :NOTE Not in current list:
;;; ^Display Date for Role: = ^Display-Date-for-Role:
;;; ^Display Date for the related person or corporate body: => Display-Date-for-the-related-person-or-corporate-body:
;;; ^Display Date for the parent: => Display-Date-for-the-parent:
;;; ^Start and End Places: => Start-and-End-Places:
;;; ^Start: 
;;; ^location: => Location:
;;; ^active => Active:  ;date-active-face-ulan
;;; :MODIFICATIONS <Timestamp: #{2009-08-31T14:50:10-04:00Z}#{09361} - by MON KEY>
(defvar *regexp-clean-ulan-fields*
 '(("^apprentice of "       ":APPRENTICE-OF ")     ;;; '(("^apprentice of "      "apprentice-of: ")     
   ("^apprentice was "      ":APPRENTICE-WAS ")    ;;;   ("^apprentice was "     "apprentice-:WAS ")    
   ("^assisted by "         ":ASSISTED-BY ")       ;;;   ("^assisted by "        "assisted-by: ")       
   ("^associate of "        ":ASSOCIATE-OF ")      ;;;   ("^associate of "       "associate-of: ")      
   ("^child of "            ":CHILD-OF ")          ;;;   ("^child of "           "child-of: ")          
   ("^collaborated with "   ":COLLABORATED-WITH ") ;;;   ("^collaborated with "  "collaborated-with: ") 
   ("^founder of "          ":FOUNDER-OF ")        ;;;   ("^founder of "         "founder-of: ")        
   ("^grandchild of "       ":GRANDCHILD-OF ")     ;;;   ("^grandchild of "      "grandchild-of: ")     
   ("^grandparent of "      ":GRANDPARENT-OF ")    ;;;   ("^grandparent of "     "grandparent-of: ")    
   ("^grandparent was "     ":GRANDPARENT-WAS " )  ;;;   ("^grandparent was "    "grandparent-:WAS " )  
   ("^influenced "          ":INFLUENCE ")         ;;;   ("^influenced "         "influence: ")         
   ("^member of "           ":MEMBER-OF ")         ;;;   ("^member of "          "member-of: ")         
   ("^parent of "           ":PARENT-OF ")         ;;;   ("^parent of "          "parent-of: ")         
   ("^partner of "          ":PARTNER-OF ")        ;;;   ("^partner of "         "partner-of: ")        
   ("^sibling of "          ":SIBLING-OF ")        ;;;   ("^sibling of "         "sibling-of: ")        
   ("^spouse of  "          ":SPOUSE-OF ")         ;;;   ("^spouse of  "         "spouse-of: ")         
   ("^student of "          ":STUDENT-OF ")        ;;;   ("^student of "         "student-of: ")        
   ("^student was "         ":STUDENT-WAS " )      ;;;   ("^student was "        "student-:WAS " )      
   ("^teacher of "          ":TEACHER-OF ")        ;;;   ("^teacher of "         "teacher-of: ")        
   ("^teacher was "         ":TEACHER-WAS ")       ;;;   ("^teacher was "        "teacher-:WAS ")       
   ("^worked with "         ":WORKED-WITH "))      ;;;   ("^worked with "        "worked-with: "))      
  "*Regexp list to match and normalize ULAN roles.\n
Invoked after evaluating `*regexp-clean-ulan*' to begin process of
cannonicalizing ULAN fields.\n
Elements of list are normalized as follows:
 \"^teacher of \" -> \":TEACHER-OF \"\n
:CALLED-BY `mon-cln-ulan'\n
For additional specifications:
:SEE \(URL `http://www.getty.edu/research/conducting_research/vocabularies/ulan/').\n
:NOTE ULAN is ©J.Paul Getty Trust
:SEE-ALSO `*regexp-clean-ulan*',`*regexp-clean-ulan-dispatch-chars*',
`*regexp-clean-ulan-diacritics*', `*regexp-ulan-contribs*'.\n
:USED-IN `naf-mode'.\n►►►")
;;
;;; :TEST-ME  *regexp-clean-ulan-fields*
;;;(progn (makunbound '*regexp-clean-ulan-fields*)
;;;       (unintern '*regexp-clean-ulan-fields*) )

;;; ==============================
;;; ==============================
;;; :TODO :ADD-ME to above variable `*regexp-clean-ulan-fields*'
;;; (defvar defconst let let* setq
;;;  '(("nephew of")
;;;    ("uncle of")
;;;    ("partner of")
;;;    ("partner in")
;;;    ("child by marriage (in-law) of")
;;;    ("sibling by marriage (in-law) of")
;;;    ("cousin of")
;;;    ("worked with")
;;;    ("colleague of")
;;; ;;; ("     member of")
;;; ;;; ("     court artist to")
;;; ;;; ("     employee was")
;;; ;;; ("     patron was")
;;; ;;; ("     collaborated with")
;;;    ("partner was/is (firm to person)")
;;;    ("founded by")
;;;    ("assistant of")
;;;    ("partner in")
;;;    ("employee of")
;;;    ("employee was")
;;;    ("great-grandchild of")
;;;    ("court artist to")
;;;    ("patron was")
;;;    ("related to")
;;;    ("collaborated with")
;;;    ("sibling of")
;;;    ("nephew of")
;;;    ("uncle of")
;;;    ("partner of")
;;;    ("partner in")
;;;    ("child by marriage (in-law) of")
;;;    ("sibling by marriage (in-law) of")
;;;    ("cousin of")
;;;    ("worked with")
;;;    ("apprentice of")
;;;    ("apprentice was")
;;;    ("assisted by")
;;;    ("associate of")
;;;    ("child of")
;;;    ("founder of")
;;;    ("grandchild of")
;;;    ("grandparent of")
;;;    ("grandparent was")
;;;    ("influence")
;;;    ("member of")
;;;    ("parent of")
;;;    ("partner of")
;;;    ("sibling of")
;;;    ("spouse of")
;;;    ("student of")
;;;    ("student was")
;;;    ("teacher of")
;;;    ("teacher was")
;;;    ("worked with")))
;;; ==============================
;;; ==============================


;;; ==============================
;;; :NOTE Converts following from:
;;;   :TEACHER-OF Schoonover, Frank Earle 
;;;   (American illustrator and painter, 1877-1972) [500022845]
;;; To the normalized form:
;;;   (:TEACHER-OF #{McBurney, James Edwin} 
;;;   #{American painter, illustrator, and muralist, 1868-1955} #{500125563})
;;; The intention here is to allow further CL macro displatching on these lists.
;;; :CREATED <Timestamp: #{2009-08-31T16:49:41-04:00Z}#{09361} - by MON KEY>
(defvar *regexp-clean-ulan-dispatch-chars*
  (let (regexp-clean-ulan-dispatch-chars) 
    (mapc (lambda (x)
            (setq regexp-clean-ulan-dispatch-chars
                  (cons `(,x
                          ,(format "\(\\2 #{\\3}\n#{\\4} #{\\5}\)" ))
                        regexp-clean-ulan-dispatch-chars)))
          (mapcar (lambda (y) 
                    (concat "^\\(\\(" (substring (cadr y) 0 (string-match " " (cadr y)))
                            "\\)[: :]\\([A-z,. ].*\\)[: :]\\{2,2\\}\n\(\\(.*\\)\) \\[\\([0-9]\\{9,9\\}\\)\\]\\)"))
                 *regexp-clean-ulan-fields*))
    regexp-clean-ulan-dispatch-chars)
  "*Regexp list 
invoked after evaluating `*regexp-clean-ulan-fields*'.
:CALLED-BY `mon-cln-ulan'.
Elements of are converted from the following format:\n
 :TEACHER-OF Schoonover, Frank Earle
 \(American illustrator and painter, 1877-1972\) [500022845]\n
To this the normalized form:\n
 \(:TEACHER-OF #{McBurney, James Edwin}
 #{American painter, illustrator, and muralist, ca. 1868-1955} #{500125563}\)\n
:NOTE The normalized form is intendended to allow further processing with a CL
macro dispatching char.
:NOTE We don't convert the dateforms to a dedicated list because these often
occur as \(or in conjunction with\) other alphanumeric strings inlcuding:
 'active', 'ca.', '-ca.', 'circa', 'or', '1Nth Century', '1Nth centuries', etc.
These occurences should be parsed in an additional separate pass.\n
For additional specifications:
:SEE \(URL `http://www.getty.edu/research/conducting_research/vocabularies/ulan/'\).\n
:NOTE ULAN is ©J.Paul Getty Trust.
:SEE-ALSO `*regexp-clean-ulan*', `*regexp-clean-ulan-diacritics*',
`*regexp-ulan-contribs*'.\n
:USED-IN `naf-mode'.\n►►►")
;;
;;; :TEST-ME  *regexp-clean-ulan-dispatch-chars*
;;
;;;(progn (search-forward-regexp  
;;;;....1..2.....................3.................................4.............5......................
;;;"^\\(\\(:TEACHER-OF\\)[: :]\\([A-z,. ].*\\)[: :]\\{2,2\\}\n\(\\(.*\\)\) \\[\\([0-9]\\{9,9\\}\\)\\]\\)" nil t)
;;;(replace-match (format "\(\\2 #{\\3}\n#{\\4} #{\\5}\)" )))

;;; :UNCOMMENT-TO-TEST
;;;:TEACHER-OF Ivory, Percy van Eman  
;;;(American painter and illustrator, 1883-1960) [500105044]
;;
;;;(progn (makunbound '*regexp-clean-ulan-dispatch-chars*)
;;;       (unintern '*regexp-clean-ulan-dispatch-chars*) )

;;; ==============================
;;; :CREATED <Timestamp: #{2009-08-31T21:44:12-04:00Z}#{09362} - by MON>
(defvar *regexp-ulan-contribs*
  (let ((brief-name
         '("A&AAL-UO" "AC" "ADA-Yale" "AIC" "AKAG" "AMSA" "ANC" "ART500" "AS" "AVERY" "AVRL-UCBerkeley"
           "BAFM" "BHA" "BPL" "BSR" "BSZ" "BU" "BVRL-UNM" "Bib-Uffizi"
           "CCA" "CENSUS" "CHIN" "CL-Courtauld" "CLVR" "CLWC" "CMA" "COBE"
           "DA-UC" "DCLUMN" "DHA-UCBerkeley" "DIBAM" "DLI" 
           "EH"
           "FAC-LutherColl" "FAL-IU" "FDA" "FRANKG" "FRICK" "FSL"
           "GCI" "GOMRC" "GRI-DRM" "GRL" "GRL-Archives" "GRL-TS" "GRLCD" "GRLIRIS" "GRLPA" "GRLPSC" "GRLSC"
           "HRC"
           "ICCD" "ICH" "IHS" "ITS" 
           "JHU" "JLMM" "JPGM" 
           "LML" 
           "MAM" "MHS" "MIA" "MNM-TePapa" 
           "NCS" "NIRP" "NMAfA" "NMWA" "NYU" 
           "ORL" 
           "PHM" "PROV" "PSA" "PUC" 
           "RCL" "Records-V&A" "Rotch-MIT" 
           "SCA" "SCM" "SUL" "SmithColl" "Suzzallo-UW" 
           "TRICOL" 
           "UCR/CMP" "UMMA" "UNMA" "UOI" "UOM" "UOU" "USF" "UTA" "UWO" 
           "VP" "VP-adjunct" "VP-emeritus" "VP-intern" "VRC-UTA" 
           "WCI" "WCP" "WHS" "WL-Courtauld" "WordImage-V&A" 
           "YCBA"))
        (full-name
         '("Architecture and Allied Arts Library, University of Oregon (Eugene, Oregon)"
           "Allegheny College (Allegheny, Pennsylvania)"
           "American Decorative Arts, Yale University (New Haven, Connecticut)"
           "Art Institute of Chicago (Chicago, Illinois)"
           "Albright-Knox Art Gallery (Buffalo, New York)"
           "American Society of Appraisers (Herndon, Virginia)"
           "Autry National Center (Los Angeles, California)"
           "art500 (art500.com)"
           "Academia Sinica (Nankang, Taiwain)"
           "Avery Index to Architectural Periodicals, Columbia University (New York, New York)"
           "Architecture Visual Resources Library, University of California, Berkeley" 
           "Bildarchiv Foto Marburg (Marburg, Germany)"
           "Bibliography of the History of Art / Bibliographie d'Histoire de l'Art, The Getty Center (Los Angeles, California)"
           "Boston Public Library (Boston, Massachusetts)"
           "British School at Rome (Rome, Italy)"
           "Bibliotheksservice-Zentrum Baden-Wuerttemberg (Stuttgart, Germany)"
           "Bucknell University (Lewisburg, Pennsylvania) "
           "Bunting Visual Resources Library, University of New Mexico (Albuquerque, New Mexico)"
           "Biblioteca degli Uffizi (Florence, Italy)" 
           "Canadian Centre for Architecture / Centre Canadien d'Architecture (Montreal, Canada)"
           "Census of Antique Art and Architecture Known to the Renaissance (Berlin, Germany)"
           "Canadian Heritage Information Network (Gatineau, Quebec, Canada)"
           "Conway Library, Courtauld Institute of Art, University of London, Somerset House (London, England)"
           "Carpenter Library and Visual Resources, Bryn Mawr College (Bryn Mawr, Pennsylvania)"
           "Chapin Library, Williams College (Williamstown, Massachusetts)"
           "Cleveland Museum of Art (Cleveland, Ohio)"
           "College of Built Environments, University of Washington (Seattle, Washington)" 
           "Digital Assets, Merced Library, University of California (Merced, California)"
           "Digital Content Library, University of Minnesota (Minneapolis, Minnesota)"
           "Department of the History of Art, University of California, Berkeley (Berkeley, California)"
           "Dirección de Bibliotecas, Archivos y Museos (Santiago, Chile)"
           "Library Image Collection (DLI), National Gallery of Art (Washington, DC)" 
           "English Heritage (Swindon, England)" 
           "Fine Arts Collection, Luther College (Decorah, Iowa)"
           "Fine Arts Library, Indiana University (Bloomington, Indiana)"
           "Foundation for Documents of Architecture (Washington, DC)"
           "Franklin Gallery"
           "Frick Art Reference Library (New York, New York)"
           "Folger Shakespeare Library (Washington, DC)"
           "Getty Conservation Institute, The Getty Center (Los Angeles, California)"
           "Georgia O'Keeffe Museum Research Center (Sante Fe, New Mexico)"
           "Getty Research Institute, Digital Resource Management, The Getty Center (Los Angeles, California)"
           "Getty Research Institute, Research Library catalog records, The Getty Center (Los Angeles, California)" 
           "Getty Research Institute, Research Library, Institutional Archives, The Getty Center (Los Angeles, California)"
           "Getty Research Institute, Research Library, Technical Services, The Getty Center (Los Angeles, California)"
           "Getty Research Institute, Research Library Collection Development, The Getty Center (Los Angeles, California)"
           "Formerly used to refer to the GRL (Getty Research Institute, Research Library catalog records)"
           "Formerly used to refer to the GRLPSC (Getty Research Institute, Research Library Photo Study Collection)"
           "Getty Research Institute, Research Library Photo Study Collection, The Getty Center (Los Angeles, California)"
           "Getty Research Institute, Research Library, Special Collections, The Getty Center (Los Angeles, California)" 
           "Harry Ransom Center (Austin, Texas)" 
           "Istituto Centrale per il Catalogo e la Documentazione (Rome, Italy)" 
           "Documentation Center, Iranian Cultural Heritage, Tourism and Handicrafts Organization (Iran)" 
           "Indian Health Service (Rockville, Maryland)" 
           "Getty Information Technology Services, The Getty Center (Los Angeles, California)" 
           "Johns Hopkins University (Baltimore, Maryland)"
           "Judah L. Magnes Museum (Berkeley, California)"
           "J. Paul Getty Museum (Malibu, California)" 
           "Lane Medical Library, Stanford University (Stanford, California)" 
           "Milwaukee Art Museum (Milwaukee, Wisconsin)"
           "Minnesota Historical Society (St. Paul, Minnesota)"
           "Minneapolis Institute of Arts (Minneapolis, Minnesota)"
           "Museum of New Zealand Te Papa Tongarewa (Wellington, New Zealand)" 
           "North Carolina State University Libraries (Raleigh, North Carolina)"
           "National Inventory Research Project (University of Glasgow, Scotland)"
           "National Museum of African Art Library (Washington, DC)"
           "National Museum of Women in the Arts (Washington, DC)"
           "New York University (New York, New York)" 
           "Otto G. Richter Library (Coral Gables, Florida)" 
           "Powerhouse Museum (Sydney, Australia)" 
           "Getty Provenance Index, The Getty Center (Los Angeles, California)" 
           "Princeton University School of Architecture (Princeton, New Jersey)" 
           "Pontificia Universidad Católica de Chile (Santiago, Chile)" 
           "Russian Collections, Ltd. (Columbus, Ohio)" 
           "Records - Victoria and Albert Museum (London, England)"
           "Rotch Library of Architecture & Planning, MIT (Cambridge, Massachustts)"
           "Society for Contemporary Arts (Czech Republic)"
           "St. Catharines Museum (St. Catharines, Ontario, Canada)"
           "Syracuse University Library (Syracuse, New York)"
           "Art Department Imaging Center, Smith College (Northampton, Massachustts)"
           "Suzzallo Library, University of Washington (Seattle, Washington)"
           "Trinity College (Hartford, Connecticut)"
           "UCR/California Museum of Photography (Riverside, California)"
           "University of Michigan Museum of Art (Ann Arbor, Michigan)"
           "University of Massachusetts, Amherst"
           "School of Art and Art History, University of Iowa (Iowa City, Iowa)"
           "Architecture/Fine Arts Library, University of Manitoba (Winnepeg, Manitoba, Canada)"
           "Fine Arts & Architecture Library, University of Utah (Salt Lake City, Utah)"
           "College of Visual and Performing Arts, University of South Florida (Tampa, Florida)"
           "Art and Art History Department, University of Texas at Austin "
           "Department of Visual Arts, University of Western Ontario (London, Ontario, Canada)"
           "Getty Vocabulary Program"
           "Getty Vocabulary Program, adjunct editor"
           "Vocabulary Program, emeritus"
           "Getty Vocabulary Program, intern editor"
           "Visual Resources Collection of the Art and Art History Department, University of Texas at Austin"
           "Witt Computer Index, The Courtauld Institute of Art (London, England)"
           "Witt Checklist of Painters ca. 1200-1976, The Courtauld Institute of Art (London, England)"
           "Wisconsin Historical Society (Madison, Wisconsin)"
           "Witt Library, Courtauld Institute of Art (London, England)"
           "Word & Image Department, Victoria and Albert Museum (London, England)"
           "Yale Center for British Art (New Haven, Connecticut)"))
        (contributor-id
         '("2500000110" "2500000143" "2500000126" "2500000148" "2500000169" "2500000182"
           "2500000151" "2500000140" "2500000178" "2500000008" "2500000129" "2500000125"
           "2500000005" "2500000183" "2500000180" "2500000168" "2500000157" "2500000109"
           "2500000145" "2500000007" "2500000020" "2500000159" "2500000124" "2500000185"
           "2500000142" "2500000138" "2500000184" "2500000123" "2500000173" "2500000127"
           "2500000131" "2500000141" "2500000144" "2500000112" "2500000111" "2500000019"
           "2500000176" "2500000015" "2500000160" "2500000088" "2500000139" "2500000014"
           "2500000012" "2500000006" "2500000017" "2500000004" "2500000090" "2500000089"
           "2500000003" "2500000016" "2500000156" "2500000164" "2500000163" "2500000150" 
           "2500000106" "2500000175" "2500000166" "2500000009" "2500000158" "2500000177" 
           "2500000136" "2500000186" "2500000114" "2500000154" "2500000162" "2500000117" 
           "2500000113" "2500000188" "2500000134" "2500000146" "2500000011" "2500000155" 
           "2500000122" "2500000167" "2500000118" "2500000121" "2500000128" "2500000181" 
           "2500000135" "2500000119" "2500000132" "2500000172" "2500000170" "2500000147" 
           "2500000171" "2500000174" "2500000137" "2500000165" "2500000120" "2500000149" 
           "2500000133" "2500000013" "2500000010" "2500000161" "2500000179" "2500000187" 
           "2500000002" "2500000001" "2500000115" "2500000130" "2500000116" "2500000152"))
        build-full)
    (while brief-name
      (setq build-full 
            (cons `(,(pop brief-name) ,(pop full-name) ,(pop contributor-id)) build-full)))
    build-full)
  "*Regexp list of ULAN sources and contributors.\n
Lists have the form:
 \(Brief_Name Full_Name Contributor_ID\)\n
For additioanl specs SEE:
\(URL `http://www.getty.edu/research/conducting_research/vocabularies/ulan/'\).\n
:NOTE ULAN is ©J.Paul Getty Trust.
:SEE-ALSO `*regexp-clean-ulan*', `*regexp-clean-ulan-fields*',
`*regexp-clean-ulan-diacritics*',`*regexp-clean-ulan-dispatch-chars*',
`mon-cln-ulan'.\n
:USED-IN `naf-mode'.\n►►►")
;;
;;; :TEST-ME  *regexp-ulan-contribs*
;;; :TEST-ME (assoc "YCBA" *regexp-ulan-contribs*)
;;
;;;(progn (makunbound '*regexp-ulan-contribs*)
;;;       (unintern '*regexp-ulan-contribs*) )

;;; ==============================
;;; :SEE (URL `http://en.wikipedia.org/wiki/List_of_XML_and_HTML_character_entity_references'
;;; :SEE  (URL `http://www.w3.org/TR/REC-html40/sgml/entities.html') <- W3C
;;; Portions © International Organization for Standardization 1986
;;; Permission to copy in any form is granted for use with
;;; conforming SGML systems and applications as defined in
;;; ISO 8879, provided this notice is included in all copies.
;;;
;;; :HTML-4-CHARACTER ENTITY-SET
;;; '<!ENTITY % HTMLlat1 PUBLIC  "-//W3C//ENTITIES Latin 1//EN//HTML"> %HTMLlat1;'
;;; <!ENTITY nbsp   CDATA "&#160;" -- no-break space = non-breaking space,U+00A0 ISOnum -->
;;; <!ENTITY iexcl  CDATA "&#161;" -- inverted exclamation mark, U+00A1 ISOnum -->
;;; <!ENTITY cent   CDATA "&#162;" -- cent sign, U+00A2 ISOnum -->
;;; <!ENTITY pound  CDATA "&#163;" -- pound sign, U+00A3 ISOnum -->
;;; <!ENTITY curren CDATA "&#164;" -- currency sign, U+00A4 ISOnum -->
;;; <!ENTITY yen    CDATA "&#165;" -- yen sign = yuan sign, U+00A5 ISOnum -->
;;; <!ENTITY brvbar CDATA "&#166;" -- broken bar = broken vertical bar, U+00A6 ISOnum -->
;;; <!ENTITY sect   CDATA "&#167;" -- section sign, U+00A7 ISOnum -->
;;; <!ENTITY uml    CDATA "&#168;" -- diaeresis = spacing diaeresis, U+00A8 ISOdia -->
;;; <!ENTITY copy   CDATA "&#169;" -- copyright sign, U+00A9 ISOnum -->
;;; <!ENTITY ordf   CDATA "&#170;" -- feminine ordinal indicator, U+00AA ISOnum -->
;;; <!ENTITY laquo  CDATA "&#171;" -- left-pointing double angle quotation mark = left pointing guillemet, U+00AB ISOnum -->
;;; <!ENTITY not    CDATA "&#172;" -- not sign, U+00AC ISOnum -->
;;; <!ENTITY shy    CDATA "&#173;" -- soft hyphen = discretionary hyphen, U+00AD ISOnum -->
;;; <!ENTITY reg    CDATA "&#174;" -- registered sign = registered trade mark sign,U+00AE ISOnum -->
;;; <!ENTITY macr   CDATA "&#175;" -- macron = spacing macron = overline = APL overbar, U+00AF ISOdia -->
;;; <!ENTITY deg    CDATA "&#176;" -- degree sign, U+00B0 ISOnum -->
;;; <!ENTITY plusmn CDATA "&#177;" -- plus-minus sign = plus-or-minus sign, U+00B1 ISOnum -->
;;; <!ENTITY sup2   CDATA "&#178;" -- superscript two = superscript digit two = squared, U+00B2 ISOnum -->
;;; <!ENTITY sup3   CDATA "&#179;" -- superscript three = superscript digit three = cubed, U+00B3 ISOnum -->
;;; <!ENTITY acute  CDATA "&#180;" -- acute accent = spacing acute, U+00B4 ISOdia -->
;;; <!ENTITY micro  CDATA "&#181;" -- micro sign, U+00B5 ISOnum -->
;;; <!ENTITY para   CDATA "&#182;" -- pilcrow sign = paragraph sign, U+00B6 ISOnum -->
;;; <!ENTITY middot CDATA "&#183;" -- middle dot = Georgian comma = Greek middle dot, U+00B7 ISOnum -->
;;; <!ENTITY cedil  CDATA "&#184;" -- cedilla = spacing cedilla, U+00B8 ISOdia -->
;;; <!ENTITY sup1   CDATA "&#185;" -- superscript one = superscript digit one, U+00B9 ISOnum -->
;;; <!ENTITY ordm   CDATA "&#186;" -- masculine ordinal indicator, U+00BA ISOnum -->
;;; <!ENTITY raquo  CDATA "&#187;" -- right-pointing double angle quotation mark = right pointing guillemet, U+00BB ISOnum -->
;;; <!ENTITY frac14 CDATA "&#188;" -- vulgar fraction one quarter = fraction one quarter, U+00BC ISOnum -->
;;; <!ENTITY frac12 CDATA "&#189;" -- vulgar fraction one half = fraction one half, U+00BD ISOnum -->
;;; <!ENTITY frac34 CDATA "&#190;" -- vulgar fraction three quarters = fraction three quarters, U+00BE ISOnum -->
;;; <!ENTITY iquest CDATA "&#191;" -- inverted question mark = turned question mark, U+00BF ISOnum -->
;;; <!ENTITY Agrave CDATA "&#192;" -- latin capital letter A with grave = latin capital letter A grave, U+00C0 ISOlat1 -->
;;; <!ENTITY Aacute CDATA "&#193;" -- latin capital letter A with acute, U+00C1 ISOlat1 -->
;;; <!ENTITY Acirc  CDATA "&#194;" -- latin capital letter A with circumflex, U+00C2 ISOlat1 -->
;;; <!ENTITY Atilde CDATA "&#195;" -- latin capital letter A with tilde, U+00C3 ISOlat1 -->
;;; <!ENTITY Auml   CDATA "&#196;" -- latin capital letter A with diaeresis, U+00C4 ISOlat1 -->
;;; <!ENTITY Aring  CDATA "&#197;" -- latin capital letter A with ring above = latin capital letter A ring, U+00C5 ISOlat1 -->
;;; <!ENTITY AElig  CDATA "&#198;" -- latin capital letter AE = latin capital ligature AE, U+00C6 ISOlat1 -->
;;; <!ENTITY Ccedil CDATA "&#199;" -- latin capital letter C with cedilla, U+00C7 ISOlat1 -->
;;; <!ENTITY Egrave CDATA "&#200;" -- latin capital letter E with grave, U+00C8 ISOlat1 -->
;;; <!ENTITY Eacute CDATA "&#201;" -- latin capital letter E with acute, U+00C9 ISOlat1 -->
;;; <!ENTITY Ecirc  CDATA "&#202;" -- latin capital letter E with circumflex, U+00CA ISOlat1 -->
;;; <!ENTITY Euml   CDATA "&#203;" -- latin capital letter E with diaeresis, U+00CB ISOlat1 -->
;;; <!ENTITY Igrave CDATA "&#204;" -- latin capital letter I with grave, U+00CC ISOlat1 -->
;;; <!ENTITY Iacute CDATA "&#205;" -- latin capital letter I with acute, U+00CD ISOlat1 -->
;;; <!ENTITY Icirc  CDATA "&#206;" -- latin capital letter I with circumflex, U+00CE ISOlat1 -->
;;; <!ENTITY Iuml   CDATA "&#207;" -- latin capital letter I with diaeresis, U+00CF ISOlat1 -->
;;; <!ENTITY ETH    CDATA "&#208;" -- latin capital letter ETH, U+00D0 ISOlat1 -->
;;; <!ENTITY Ntilde CDATA "&#209;" -- latin capital letter N with tilde, U+00D1 ISOlat1 -->
;;; <!ENTITY Ograve CDATA "&#210;" -- latin capital letter O with grave, U+00D2 ISOlat1 -->
;;; <!ENTITY Oacute CDATA "&#211;" -- latin capital letter O with acute, U+00D3 ISOlat1 -->
;;; <!ENTITY Ocirc  CDATA "&#212;" -- latin capital letter O with circumflex, U+00D4 ISOlat1 -->
;;; <!ENTITY Otilde CDATA "&#213;" -- latin capital letter O with tilde, U+00D5 ISOlat1 -->
;;; <!ENTITY Ouml   CDATA "&#214;" -- latin capital letter O with diaeresis, U+00D6 ISOlat1 -->
;;; <!ENTITY times  CDATA "&#215;" -- multiplication sign, U+00D7 ISOnum -->
;;; <!ENTITY Oslash CDATA "&#216;" -- latin capital letter O with stroke = latin capital letter O slash, U+00D8 ISOlat1 -->
;;; <!ENTITY Ugrave CDATA "&#217;" -- latin capital letter U with grave, U+00D9 ISOlat1 -->
;;; <!ENTITY Uacute CDATA "&#218;" -- latin capital letter U with acute, U+00DA ISOlat1 -->
;;; <!ENTITY Ucirc  CDATA "&#219;" -- latin capital letter U with circumflex, U+00DB ISOlat1 -->
;;; <!ENTITY Uuml   CDATA "&#220;" -- latin capital letter U with diaeresis, U+00DC ISOlat1 -->
;;; <!ENTITY Yacute CDATA "&#221;" -- latin capital letter Y with acute, U+00DD ISOlat1 -->
;;; <!ENTITY THORN  CDATA "&#222;" -- latin capital letter THORN, U+00DE ISOlat1 -->
;;; <!ENTITY szlig  CDATA "&#223;" -- latin small letter sharp s = ess-zed, U+00DF ISOlat1 -->
;;; <!ENTITY agrave CDATA "&#224;" -- latin small letter a with grave = latin small letter a grave, U+00E0 ISOlat1 -->
;;; <!ENTITY aacute CDATA "&#225;" -- latin small letter a with acute, U+00E1 ISOlat1 -->
;;; <!ENTITY acirc  CDATA "&#226;" -- latin small letter a with circumflex, U+00E2 ISOlat1 -->
;;; <!ENTITY atilde CDATA "&#227;" -- latin small letter a with tilde, U+00E3 ISOlat1 -->
;;; <!ENTITY auml   CDATA "&#228;" -- latin small letter a with diaeresis, U+00E4 ISOlat1 -->
;;; <!ENTITY aring  CDATA "&#229;" -- latin small letter a with ring above = latin small letter a ring, U+00E5 ISOlat1 -->
;;; <!ENTITY aelig  CDATA "&#230;" -- latin small letter ae = latin small ligature ae, U+00E6 ISOlat1 -->
;;; <!ENTITY ccedil CDATA "&#231;" -- latin small letter c with cedilla, U+00E7 ISOlat1 -->
;;; <!ENTITY egrave CDATA "&#232;" -- latin small letter e with grave, U+00E8 ISOlat1 -->
;;; <!ENTITY eacute CDATA "&#233;" -- latin small letter e with acute, U+00E9 ISOlat1 -->
;;; <!ENTITY ecirc  CDATA "&#234;" -- latin small letter e with circumflex, U+00EA ISOlat1 -->
;;; <!ENTITY euml   CDATA "&#235;" -- latin small letter e with diaeresis, U+00EB ISOlat1 -->
;;; <!ENTITY igrave CDATA "&#236;" -- latin small letter i with grave, U+00EC ISOlat1 -->
;;; <!ENTITY iacute CDATA "&#237;" -- latin small letter i with acute, U+00ED ISOlat1 -->
;;; <!ENTITY icirc  CDATA "&#238;" -- latin small letter i with circumflex, U+00EE ISOlat1 -->
;;; <!ENTITY iuml   CDATA "&#239;" -- latin small letter i with diaeresis, U+00EF ISOlat1 -->
;;; <!ENTITY eth    CDATA "&#240;" -- latin small letter eth, U+00F0 ISOlat1 -->
;;; <!ENTITY ntilde CDATA "&#241;" -- latin small letter n with tilde, U+00F1 ISOlat1 -->
;;; <!ENTITY ograve CDATA "&#242;" -- latin small letter o with grave, U+00F2 ISOlat1 -->
;;; <!ENTITY oacute CDATA "&#243;" -- latin small letter o with acute, U+00F3 ISOlat1 -->
;;; <!ENTITY ocirc  CDATA "&#244;" -- latin small letter o with circumflex, U+00F4 ISOlat1 -->
;;; <!ENTITY otilde CDATA "&#245;" -- latin small letter o with tilde, U+00F5 ISOlat1 -->
;;; <!ENTITY ouml   CDATA "&#246;" -- latin small letter o with diaeresis, U+00F6 ISOlat1 -->
;;; <!ENTITY divide CDATA "&#247;" -- division sign, U+00F7 ISOnum -->
;;; <!ENTITY oslash CDATA "&#248;" -- latin small letter o with stroke, = latin small letter o slash, U+00F8 ISOlat1 -->
;;; <!ENTITY ugrave CDATA "&#249;" -- latin small letter u with grave, U+00F9 ISOlat1 -->
;;; <!ENTITY uacute CDATA "&#250;" -- latin small letter u with acute, U+00FA ISOlat1 -->
;;; <!ENTITY ucirc  CDATA "&#251;" -- latin small letter u with circumflex, U+00FB ISOlat1 -->
;;; <!ENTITY uuml   CDATA "&#252;" -- latin small letter u with diaeresis,U+00FC ISOlat1 -->
;;; <!ENTITY yacute CDATA "&#253;" -- latin small letter y with acute, U+00FD ISOlat1 -->
;;; <!ENTITY thorn  CDATA "&#254;" -- latin small letter thorn, U+00FE ISOlat1 -->
;;; <!ENTITY yuml   CDATA "&#255;" -- latin small letter y with diaeresis, U+00FF ISOlat1 -->
;;; ==============================
;;; :TODO Provide or find a function to normalize on these characters:
;;; ÀÁÂÃÄÅÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖØÙÚÛÜÝ
;;; AAAAAACEEEEIIIIDNOOOOOOUUUUY
;;; àáâãäåçèéêëìíîïñðòóôõöøùúûýýÿŔŕ
;;; aaaaaaceeeeiiiidnoooooouuuyyyRr
;;;  ß    æ    Æ   þ Þ
;;; |bs| |ae| |AE|
;;; ==============================

;;; ==============================
;;; :NOTE 
;;; :ORIGINAL-WORD->ABBREVIATION
;; acknowledgment ack
;; abstract abs
;; address addr
;; affiliation aff
;; alternate/alternative alt
;; attribution attrib
;; biography bio
;; chemical chem
;; communication communication
;; conference conf
;; contributor/contribution contrib
;; corresponding corresp
;; definition def
;; description desc
;; display disp
;; external ext
;; figure fig
;; first f (no hyphen)
;; footnote fn
;; formula formula
;; government gov
;; graphic graphic
;; group/grouping group
;; heading/header head
;; identifier/ID id
;; keyword kwd
;; location loc
;; material material
;; metadata meta
;; number num
;; prefix prefix
;; proceedings proceedings
;; publication pub
;; publisher publisher
;; quote quote
;; reference ref
;; related related
;; section sec
;; sequence/sequential seq
;; standard std
;; statement statement
;; structure struct
;; subject subj
;; subscript sub (note: not inferior)
;; superscript sup (note: not superior)
;; supplementary supplementary
;; translated/translator trans
;; underline underline
;; volume vol
;; wrapper wrap

;;; ==============================
;;; :NOTE Regexp template for finding nameforms in regions. 
;;; Template has also been pasted into "mon-name-utils.el" :CALLED-BY `mon-cln-ulan'.
;;; :WORKING-AS-OF <Timestamp: Friday February 13, 2009 @ 09:18.35 PM - by MON KEY>
;;; ==============================
;;;        (region-name (when (and transient-mark-mode mark-active)
;;; 	      (buffer-substring-no-properties (region-beginning) (region-end))))
;;;              (test-name (when (and region-name)
;;; 	       (cond
;;; 		((string-match "\\(\\([A-Z][a-z]+\\)\\([: :](\\)\\([A-Z][a-z]+\\)\\()\\)\\)" region-name) 
;;; 		 (concat (match-string 2 region-name) "%2C+"  (match-string 4 region-name)))
;;; 		((string-match "\\(\\([A-Z][a-z]+\\)\\(,[: :]\\)\\([A-Z][a-z]+\\)\\)" region-name)
;;; 		 (concat (match-string 2 region-name) "%2C+" (match-string 4 region-name)))
;;; 		((string-match "\\(\\([A-Z][a-z]+\\)\\([: :]\\)\\([A-Z][a-z]+\\)\\)" region-name)
;;; 		 (concat (match-string 4 region-name) "%2C+" (match-string 2 region-name))))))

;;; ==============================
;;; lowercaseUPPERCASE -> "lowercase UPPERCASE"
;;; :EXAMPLE find occurences of "somstreetCityname" -> "somestreet Cityname"
;;
;; (let ((case-fold-search nil))
;;   (while (search-forward-regexp 
;; 	  "\\(SOME-SAFE-BUT-GREEDY-BOUNDS*\\)\\([\\[:lower:]]\\)\\([\\[:upper:]]\\)" nil t)
;;            ;;1^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^2^^^^^^^^^^^^^^^^^^3^^^^^^^^^^^^^^^^^^^^^^
;;     (replace-match "\\1\\2 \\3")))

;;; ==============================
;;; 0-9UPPERCASE -> "N UPPERCASE"
;;; :EXAMPLE find occurences of "625Paris" -> "625 Paris"
;;
;; (let ((case-fold-search nil))
;;   (while (search-forward-regexp 
;;     "\\([0-9]\\)\\([\\[:upper:]]\\)" nil t)
;;      ^^1^^^^^^^^^^2^^^^^^^^^^^^^^^
;;     (replace-match "\\1 \\2")))

;;; ==============================
;;; :CREATED <Timestamp: #{2009-08-17T16:52:12-04:00Z}#{09341} - by MON KEY>
;;; :ROTATE-LASTNAME-TO-FRONT
;;; Quick and dirty to rotate artist names. 
;;; Both First and Last name _must be_ without hyphens, periods or other punct.
;;;     ;;...1...2...........3................4.........
;;;  '(("^\\(\\([A-z]+\\)\\([[:space:]]\\)\\(.*\\)\\)"   "\\4 (\\2)"))

;;; ==============================
;;; :CAPITALIZING-REGION
;;; ^\([A-Z-: :]*\)$ \#(capitalize-region)

;;; ==============================
;;; TIMESTAMPS of form: `YYYY-MM-DD HH:MM:SS'
;;; "\\([0-9-]+ [0-9:]+\\)" 

;;; ==============================
;;; :SIMPLE-YEAR
;;; \_<[0-9]\{4\}\_>

;;; ==============================
;;; :YEAR-RANGE
;;; "\\(\\((\\)\\([0-9]\\{4\\}?\\)\\(-?\\)\\([0-9]\\{4\\}?\\)\\()\\)\\)"

;;; ==============================
;;; :DATE-STRINGS of form: 03-15-1917 03-15-1944 1922/15/03 1493-15-03
;;; \\([0-9]\\{2,4\\}\\(-\\|/\\)[0-9]?+\\(-\\|/\\)[0-9]\\{2,4\\}\\)"

;;; ==============================
;;; :YEARS-IN-PARENS regexp finds strings of form: (YYYY)
;;;  \([0-9]\{4\}\)

;;; ==============================
;;; :SHORT-YEARS-BOL in bib entries of form `'YY'
;;; "^'\\([0-9]\\{2,2\\}\\)

;;; ==============================
;;; :ENGLISH-MONTHS
;;; (concat
;;;  "\\(A\\(pr\\(\\.\\|il\\)\\|ug\\(\\.\\|ust\\)\\)\\|Dec\\(\\.\\|ember\\)"
;;;  "\\|Feb\\(\\.\\|ruary\\)\\|J\\(an\\(\\.\\|uary\\)\\|u\\(l[.y]\\|n[.e]\\)"
;;;  "\\)\\|Ma\\(r\\(\\.\\|ch\\)\\|y\\)\\|Nov\\(\\.\\|ember\\)\\|Oct"
;;;  "\\(\\.\\|ober\\)\\|Sep\\(\\.\\|t\\(\\.\\|ember\\)\\)\\)")

;;; ==============================
;;; :ENGLISH-DATES
;;; (concat
;;;  "\\(A\\(pr\\(\\.\\|il\\)\\|ug\\(\\.\\|ust\\)\\)\\|Dec\\(\\.\\|ember\\)"
;;;  "\\|Feb\\(\\.\\|ruary\\)\\|J\\(an\\(\\.\\|uary\\)\\|u\\(l[.y]\\|n[.e]\\)\\)"
;;;  "\\|Ma\\(r\\(\\.\\|ch\\)\\|y\\)\\|Nov\\(\\.\\|ember\\)\\|Oct\\(\\.\\|ober\\)"
;;;  "\\|Sep\\(\\.\\|t\\(\\.\\|ember\\)\\)\\) "
;;;  "\\([0-3]?+[0-9]\\)\\(:?[rd\|th\|st\|,]+\\) \\<[0-9]\\{4\\}\\>")

;;; ==============================
;;; :ENGLISH-DAYS
;;; "\\<[MTWFS]\\(on\\|ues\\|ednes\\|hurs\\|ri\\|atur\\|un\\)\\(day\\)\\>"

;;; ==============================
;;; :ENGLISH-WEEKDAYS
;;; "\\<\\(Friday\\|Monday\\|S\\(aturday\\|unday\\)\\|T\\(hursday\\|uesday\\)\\|Wednesday\\)\\>"

;;; ==============================
;;; :FRENCH-MONTHS
;;; (concat
;;;  "[A-Za-z]\\(\\(\\(oût\\|vril\\|ai\\|ars\\)\\)\\|\\(\\(anv\\|évr\\)"
;;;  "\\(ier\\)\\)\\|\\(\\(cto\\|epte\\|ove\\|éce\\)\\(m?+bre\\)\\)"
;;;  "\\|\\(\\(ui\\)\\(n\\|l+et\\)\\)\\)")

;;; ==============================
;;; :FRENCH-WEEKDAYS
;;;"\\<\\(Dimanche\\|Jeudi\\|Lundi\\|M\\(ardi\\|ercredi\\)\\|Samedi\\|Vendredi\\)\\>")

;;; ==============================
;;; :FRENCH-DATES
;;; (concat 
;;;  "\\<[0-9]\\{1,2\\}\\> \\(A\\(o\\(ut\\|ût\\)\\|vr\\(\\.\\|il\\)\\)\\|Déc\\(\\.\\|embre\\)"
;;;  "\\|Fév\\(\\.\\|rier\\)\\|J\\(an\\(\\.\\|vier\\)\\|ui\\(l\\(\\.\\|let\\)\\|n\\)\\)"
;;;  "\\|Ma\\(i\\|rs\\)\\|Novembre\\|Octobre\\|Sep\\(\\.\\|tembre\\)\\|a"
;;;  "\\(o\\(ut\\(\\)?\\|ût\\(\\)?\\)\\|vr\\(\\.\\|il\\)\\)\\|déc\\(\\.\\|embre\\)"
;;;  "\\|fév\\(\\.\\|rier\\)\\|j\\(an\\(\\.\\|vier\\)\\|ui\\(l\\(\\.\\|let\\)\\|[n]\\)\\)"
;;;  "\\|ma\\(rs\\(\\)?\\|[i]\\)\\|nov\\(\\.\\|embre\\)\\|oct"
;;;  "\\(\\.\\|obre\\)\\|sep\\(\\.\\|tembre\\)\\) \\<[0-9]\\{4\\}\\>")

;;; ==============================
;;; :LIFESPAN with word boundaries of form: (1899-1946)
;;;   '"\\(\\<[(]?+[0-9]\\{4\\}-[0-9]\\{4\\}[)]?+\\>\\)" )

;;; ==============================
;;; :LIFESPAN without word boundaries 
;;;  '"\\([(]?+[0-9]\\{4\\}-[0-9]\\{4\\}[)]?+\\)" )

;;; ==============================
;;; :ACTIVE-CIRCA
;;; \\<\\(active ca\\.\\|b\\.\\|c\\(a\\.\\|irca\\)\\|d\\.\\) [0-9]\\{4\\}\\>


;;; ==============================
;;; :CREATED <Timestamp: #{2009-08-17T16:52:15-04:00Z}#{09341} - by MON KEY>
;;; Regexp to snarf Olympic Games :SEE
;;; (URL `http://www.olympic.org/uk/games/index_uk.asp')
;;; (progn (save-excursion
;;; (while (search-forward-regexp  
;;;         (concat
;;;          "^\\("                                      ;      ;=> grp 1
;;;          "\\(?2:[A-z[:punct:][:space:]]+\\)"         ; City ;=>grp 2
;;;          "\\(?3: - \\)"                              ; First seperator ;=>grp 3
;;;          "\\(?4:[0-9]\\{4,4\\}\\)"                   ; Year ;=>grp 4
;;;          "\\(?5: - \\)"                              ; Second seperator  ;=>grp 5
;;;          ;; Summer Games w/ inner roman numeral ;=>grp 6 ;=>grp 7
;;;          ;; "\\(?6:Games of the \\(?7:.*\\) Olympiad\\)"
;;;          ;; Winter Games with leading roman number ;=>grp 6 ;=>grp 7
;;;          "\\(?6:\\(?7:.* Olympic Winter Games\\)\\)"
;;;          "\\)" ) nil t)
;;;   ;;Replacements for Summer Games
;;;   ;;  (replace-match "\\2\\3\\4\\5\\7 Olympiad") 
;;;   ;;Replacements for Winter Games
;;;       (replace-match "\\2\\3\\4\\5\\7")  
;;;   (beginning-of-line) 
;;;   (search-forward-regexp  
;;;    (concat
;;;     "\\("
;;;     "\\(?2: - \\)"                                   ; Third seperatro ;=>grp 8
;;;     "\\(?3:[0-9]\\{2,2\\}\\)"                        ; Frm Day ;=>grp 9
;;;     "\\(?4: [A-z]+ \\)"                              ; From Month ;=>grp 10
;;;     "\\(?5:[0-9]\\{4,4\\}\\)"                        ; From Year ;=>grp 11
;;;     "\\(?6: - \\)"                                   ; Fourth seperator ;=>grp  12
;;;     "\\(?7:[0-9]\\{2,2\\}\\)"                        ; To Day ;=>grp 13
;;;     "\\(?8: [A-z]+ \\)"                              ; To Month ;=>grp 14
;;;     "\\(?9:[0-9]\\{4,4\\}\\)"                        ; To Year ;=>grp 15
;;;     "\\)$"))                                         ; EOL
;;;   (replace-match "\\2FROM:\\4\\3, \\5 TO:\\8\\7, \\9"))))
;;; ==============================

;;; ==============================
(provide 'mon-regexp-symbols)
;;; ==============================

;;; ==============================
;;; mon-regexp-symbols.el ends here
;;; EOF
