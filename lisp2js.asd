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

(asdf:defsystem #:lisp2js
  :serial t
  :description "Utilería para compilar common lisp usando Parenscript."
  :author "José Miguel Ronquillo Rivera <josrr@ymail.com>"
  :license "GPLv3"
  :depends-on (:getopt :parenscript)
  :components ((:file "lisp2js")))

