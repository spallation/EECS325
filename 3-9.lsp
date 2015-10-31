(defun longest-path (start end net)
  (reverse (dfs start end (list start) (list start) net)))
If calls to a function requires prep work, either move that work into the function being called, or create a utility function that does the prep work and calls the key function. Keep calls to functions simple. In this case, the client should not need to pass two pointers to path. And why pass start when it's in the path?

(defun dfs (start end path lpath net)
  (do ((new-paths (cdr (assoc start net)) (cdr new-paths))
This is a misleading name. Variable names should say what a variable contains, and a function should say what a function returns or modifies. new-paths does NOT hold paths. It holds a list of neighbor nodes of start.
       (l path (updated-path l (car new-paths) path end net)))
A variable name should describe what the variable contains, and distinguish it from similar variables. Avoid vague names. See point 4 of http://mindprod.com/jgloss/unmainnaming.html L is OK for a generic list, but here you want it be the best path so far.
      ((null new-paths) (when (eql (car l) end) l))))
WHEN and UNLESS are not appropriate when the return value is needed. WHEN and UNLESS are for when you sometimes want to do some actions. Use IF or COND or AND/OR, as appropriate, when values matter.
I don't see why you need the WHEN at all. Your DO best path variable should just hold the best solution found during the iterating. Initially NIL or (start) depending on whether start = end

(defun updated-path (l node path end net)
  (cond ((null (member node path))
         (longer l (dfs node end (cons node path) l net)))
        ((and (eql node end) (eql node (start-of-lpath l)))
         (longer l (cons node path)))
        (t l)))
This is more complicated than necessary.
This can be done with one flat COND, if you test things in the right order. Hint: node = end is good to check first. Shouldn't need any AND or repeated tests

(defun start-of-lpath (l)
  (car (reverse l)))
Reverse makes a copy of the list. Calling it repeatedly in iteration or recursion is therefore very expensive. Nreverse is not the answer, since it messes up the original list.

(defun longer (path longest-path)
  (if (> (length path) (length longest-path))
      path
    longest-path))
