;TIMUR GULER
;This algorithm involves taking the amount of times each vertex appears in the sequence and subtracting 1
;effectively returning the amount of times each vertex is involved in a triangle without actually calculating
;these triangles

;test case

(defun countVertexTriangles (set numVert);function definition
 
    (setf firstList (loop :for (x y) :in set :collect (list x)));seperate the lists into individual lists
    (setf secondList (loop :for (x y) :in set :collect (list y)))
    (setf combinedList (append firstList secondList));combine those lists together for easy data access
    (setf retList (make-list numVert :initial-element '0));makes the return list with the size of numVert
    
     (setf cListLen (- (length combinedList) 1));subtract 1 in order for proper indexing
     (setf rListLen (- (length retList) 1))
 (print combinedList)
    (loop for x from 0 to rListLen do;loop through the list that will be returned
          (setf newRound -1);accounts for the fact that the number of triangles the vertex is in is the amount in combinedList-1
    (loop for y from 0 to cListLen do;loop through the list of verticies
          (setf cListIndex (elt combinedList y));get the index of the list of verticies
          (setf newX (+ x 1));the reason you do this is because retList[0]
          ;is the first element of the array however this is in the place of 1, 
          ;and retList[1] is in place of 2, therefore we add 1 to be able 
          ;to compare it to what we are trying to find
          (if (equal cListIndex (list newX));if we find a match in indexes
              (setf newRound (+ newRound 1));we add 1 to that index in retList
          )
          (setf (nth x retList) newRound);update the value of the number of triangles vertex x occupies  
     ))
    (print retList);print out the array

)

