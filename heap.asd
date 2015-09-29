(defpackage :heap-asd
  (:use :cl :asdf))

(in-package :heap-asd)

(defsystem :heap
  :name "heap"
  :version "1.0"
  :author "Jeffrey Massung"
  :license "Apache 2.0"
  :description "Binary Heap for Common Lisp."
  :serial t
  :components ((:file "heap")))
