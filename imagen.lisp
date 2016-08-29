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
(in-package #:common-lisp-user)

(ql:quickload "lisp2js")
(in-package :lisp2js)
(uiop/image:register-image-restore-hook
 (lambda ()
   (compile-from-command-line-arguments (command-line-arguments)))
 nil)
(uiop/image:dump-image "lisp2js" :executable t)
