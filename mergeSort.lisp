(defvar comparisons 0) ; Global variable
(defun merging (array left right)
  (let ((i 0) ; Current position in left array
        (j 0) ; Current position in right array
        (k 0) ; Current position in sorted array
        (length-left (length left)) 
        (length-right (length right))
        (length-array (length array)))
    (declare (fixnum i j k length-left length-right length-array)) ; Declare variabes
    
    (loop while (and (< i length-left) (< j length-right)) ; check i<length.left AND j<length.right
          do (progn ; Execute code in loop
               (setq comparisons (+ comparisons 1)) ; Counting comparisons++
               (if (<= (nth i left) (nth j right)) ; check if ith element is <= jth element
                   (progn
                     (setf (nth k array) (nth i left)) ; array[k] = left[i]
                     (setq i (+ i 1))) ; i++
                   (progn
                     (setf (nth k array) (nth j right)) ; array[k] = right[j]
                     (setq j (+ j 1)))) ; j++
               (setq k (+ k 1)))) ; k++
    
    (loop while (< i length-left) ; i<left.length
          do (progn ; Execute code in loop
               (setf (nth k array) (nth i left)) ; array[k] = left[i]
               (setq i (+ i 1)) ; i++
               (setq k (+ k 1)))) ; k++
    
    (loop while (< j length-right) ; j<right.length
          do (progn ; Execute code in loop
               (setf (nth k array) (nth j right)) ; array[k] = right[j]
               (setq j (+ j 1)) ; j++
               (setq k (+ k 1)))) ; k++
    
    (format t "Sorted Subarray - merging:~%") ; Printing
    (display array) ; Display array
    (format t "~%") ; New line
    array)) ; Return array

(defun merge-sort (array) ; Define function merge-sort
  (let ((x (length array))) ; x = length of array
    (if (<= x 1) ; Base Case: if array has zero or one elements 
        array ; Return array, it is already sorted
        (let* ((mid (floor x 2)) ; midpoint of array is floor(x/2)
               (left-array (subseq array 0 mid)) ; left array is 0 - mid-1 
               (right-array (subseq array mid)) ; right array is mid to length-1
               (display (lambda (left right) ; Define function 'display' to print subarrays
                          (format t "The subarrays - dividing:~%") ; Printing
                          (format t "Left: ") ; Print the left subarray
                          (display left) 
                          (format t "Right: ") ; Print the right subarray
                          (display right) 
                          (format t "~%")))) ; Print newline
          (funcall display left-array right-array) ; Call the display function with left and right subarrays
          (setq array (merging array (merge-sort left-array) (merge-sort right-array))) ; Merge and sort the subarrays
          array)))) ; Return array


(defun display (array) ; Define function display
  (dolist (elem array) ; Iterate over each element
    (format t "~a " elem)) ; Print current element 
  (format t "~%")) ; Print newline


(defun main ()
  (let ((array '(1430 3292 7684 1338 193 595 4243 9002 4393 130))) ; Input array provided
    (format t "Original array:~%")
    ; Display original array
    (display array)
    (format t "~%")
    
    ; Sort the array
    (setq array (merge-sort array))
    
    ; Print number of comparisons
    (format t "Number of Comparisons: ~a~%" comparisons)
    (format t "~%")
    
    (format t "Sorted array:~%")
    ; Display sorted array
    (display array)))

(main)

