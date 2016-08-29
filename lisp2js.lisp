;;;; -*- coding: utf-8-unix; -*-
;;;; Copyright (C) 2016 José Ronquillo Rivera <josrr@ymail.com>
;;;; This file is part of lisp2js.
;;;;
;;;; lisp2js is free software: you can redistribute it and/or modify
;;;; it under the terms of the GNU General Public License as published by
;;;; the Free Software Foundation, either version 3 of the License, or
;;;; (at your option) any later version.
;;;;
;;;; lisp2js is distributed in the hope that it will be useful,
;;;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;;; GNU General Public License for more details.
;;;;
;;;; You should have received a copy of the GNU General Public License
;;;; along with lisp2js.  If not, see <http://www.gnu.org/licenses/>.
(in-package  #:common-lisp-user)
(defpackage #:lisp2js
  (:use :cl :parenscript)
  (:export #:defsource-js
	   #:list-sources-js
	   #:compile-file-to-js
	   #:compile-sources-to-js
	   #:compile-from-command-line-arguments)
  (:import-from #:getopt
		#:getopt)
  (:import-from #:uiop/image
		#:command-line-arguments)
  (:import-from #:uiop/filesystem
		#:delete-file-if-exists)
  (:import-from #:uiop/pathname
		#:split-unix-namestring-directory-components
		#:split-name-type))
(in-package #:lisp2js)

(defparameter *js-type* "js")

(defparameter *sources* (make-hash-table :test #'equal :size 20))

(defparameter *getopt-options* '(("input" :required)
				 ("output-path" :optional)
				 ("minify" :none)))

(defun compile-from-command-line-arguments (args)
  (let* ((arguments (multiple-value-list (getopt args *getopt-options*)))
	 (getopts (cadr arguments)))
    (when getopts
      (let ((input (assoc "input" getopts  :test #'equal))
	    (output-path (assoc "output-path" getopts :test #'equal))
	    (minify (assoc "minify" getopts :test #'equal)))
	(when (consp input)
	  ;;(log:debug minify)
	  (defsource-js (cdr input)
	      :output-dir (if (consp output-path) (cdr output-path) #P"./")
	      :minify (not (null minify)))
	  (compile-sources-to-js))))))

(defun list-sources-js (&optional (sources *sources*))
  (when sources
    (let ((list))
      (maphash (lambda (input output)
		 (setf list (append list (list (list input output)))))
	       sources)
      list)))

(defun defsource-js (input &key (output-dir #P"./") minify)
  (when (and (probe-file input) (probe-file output-dir))
    (let ((input-parts (multiple-value-list
			(split-unix-namestring-directory-components (namestring input)))))
      (multiple-value-bind (name type) (split-name-type (caddr input-parts))
	(declare (ignore type))
	(setf (gethash (namestring input) *sources*)
	      (list
	       (merge-pathnames (pathname (concatenate 'string name "." *js-type*))
				output-dir)
	       minify))))))

(defun compile-file-to-js (input output)
  (when (probe-file input)
    (with-open-file (*parenscript-stream* output :direction :output :if-exists :supersede)
      (ps-compile-file input :external-format :utf-8))))

(defun compile-sources-to-js (&optional (sources *sources*))
  (when sources
    (maphash (lambda (input output)
	       (delete-file-if-exists (car output))
	       (let ((*ps-print-pretty* (not (cadr output))))
		 (compile-file-to-js input (car output)))
	       (when (null (probe-file (car output)))
		 (error "Compiling ~S" input)))
	     sources)
    t))
