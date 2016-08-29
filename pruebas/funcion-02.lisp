(defun foo (x)
  (1+ x))

(lambda (x)
  (case x
    (1 (loop repeat 3 do (alert "foo")))
    (:bar (alert "bar"))
    (otherwise 4)))

(dotimes (x 3) (+ x x))
