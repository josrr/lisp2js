(defun fibonacci-recursive (n)
  (if (< n 2)
      n
      (+ (fibonacci-recursive (- n 2)) (fibonacci-recursive (- n 1)))))

(defun fibonacci-tail-recursive ( n &optional (a 0) (b 1))
  (if (= n 0)
      a
      (fibonacci-tail-recursive (- n 1) b (+ a b))))
