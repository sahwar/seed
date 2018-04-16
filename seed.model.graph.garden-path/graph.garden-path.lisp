;;;; graph.garden-path.lisp

(in-package #:seed.model.graph.garden-path)

(defmacro graph-garden-path (function-name &rest nodes)
  "Build the function for traversal of a path given the specification of the nodes in the path."
  (let ((node-ids (mapcar (lambda (node) (getf node :id))
			  nodes)))
    (labels ((build-conditions (node)
	       (let ((last-link-index (1- (length (getf node :links)))))
		 `(cond ,@(mapcar (lambda (link-data link-index)
				    (let ((nix (position (getf link-data :id)
							 node-ids))
					  (link link-data))
				      (cond ((or (eq :switch (getf node :type))
						 (eq :action (getf node :type)))
					     `(,(if (= link-index last-link-index)
						    t (getf link :if))
						(funcall (aref nodes ,nix)
							 state content)))
					    ((eq :option (getf node :type))
					     `(,(if (= link-index last-link-index)
						    t `(= input ,link-index))
						(funcall (aref nodes ,nix)
							 state content))))))
				  (getf node :links)
				  (loop for i from 0 to last-link-index collect i)))))
	     (import-designated-symbols (form)
	       (mapcar (lambda (element) (cond ((listp element)
						(import-designated-symbols element))
					       ((not (symbolp element))
						element)
					       ((string= "STATE" (string-upcase element))
						'state)
					       (t element)))
		       form)))
    `(let ((nodes nil))
       (setq nodes (vector ,@(mapcar (lambda (node)
				       `(lambda (state &optional content)
					  (let ((content ,(if (getf node :items)
							      `(append content (quote (,(getf node :items))))
							      `content)))
					    ,@(import-designated-symbols (getf node :do))
					    ,(cond ((eq :portal (getf node :type))
						    `(funcall (function ,(getf node :to)) state))
						   ((eq :switch (getf node :type))
						    (build-conditions node))
						   (t `(values content state
							       (lambda (state input) ,(build-conditions node))))))))
				     nodes)))
       (defun ,function-name (state) (funcall (aref nodes 0) state))))))

(defun generate-blank-node (type)
  "Generate a blank node for use in a garden path, starting with a UUID key so the node can be uniquely identified for logging purposes."
  (let ((base (list :id (let ((str (make-string-output-stream)))
			  (uuid:format-as-urn str (uuid:make-v1-uuid))
			  (intern (string-upcase (third (split-sequence #\: (get-output-stream-string str))))
				  "KEYWORD"))
		    :type type :meta (list :title "" :about ""))))
    (append base (if (eq :portal type)
		     (list :to nil)
		     (list :items nil :do nil :links nil)))))

(defun generate-blank-link ()
  "Generate a blank link to connect garden path nodes."
  (list :id nil :meta (list :title "" :about "")
	:items nil :if nil))

(defun add-blank-node (list type)
  (append list (list (generate-blank-node type))))

(defun add-blank-link (node-id list)
  (loop for item in list
     do (if (eq node-id (first item))
	    (let ((this-node (rest item)))
	      (setf (getf this-node :links)
		    (append (getf this-node :links)
			    (list (generate-blank-link)))))))
  list)

