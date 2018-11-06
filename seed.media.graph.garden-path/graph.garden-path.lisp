;;;; graph.garden-path.lisp

(in-package #:seed.generate)

(specify-media
 media-spec-graph-garden-path
 (graph-garden-path-content
  (follows reagent graph-id)
  `((set-branch-meta branch :change nil)
    (cond ((eq :node (caar data))
	   (labels ((transcribe (target items)
		      (if (not items)
			  target (progn (setf (getf (getf target :meta)
						    (first items))
					      (second items))
					(transcribe target (cddr items))))))
	     (setf (branch-image branch)
		   (loop for item in (branch-image branch)
		      collect (if (eq (getf item :id) (of-branch-meta branch :point))
				  (transcribe item (cdar data))
				  item)))
	     (set-branch-meta branch :change (list :node-changed t
						   :node-id (string-upcase (of-branch-meta branch :point))))
	     (branch-image branch)))
	  ((get-param :set-point)
	   (set-branch-meta branch :point (intern (get-param :node-id) "KEYWORD"))
	   (branch-image branch))
	  ((get-param :add-node)
	   (multiple-value-bind (output-data new-node-id)
	       (add-blank-node (branch-image branch)
			       (get-param :object-type)
			       (get-param :object-meta))
	     (set-branch-meta branch :change (list :node-added t :new-id (string-upcase new-node-id)))
	     (setf (branch-image branch) output-data)))
	  ((get-param :add-link)
	   (add-blank-link (branch-image branch)
			   (intern (get-param :node-id) "KEYWORD")
			   (get-param :object-meta))
	   (set-branch-meta branch :change (list :link-added t :node-id (get-param :node-id)))
	   (branch-image branch))
	  ((get-param :connect-link)
	   (connect-link (branch-image branch)
			 (intern (get-param :node-id) "KEYWORD")
			 (intern (get-param :link-id) "KEYWORD")
			 (intern (get-param :destination-node-id) "KEYWORD")
			 (get-param :object-meta))
	   (set-branch-meta branch :change (list :link-connected t :node-id (string-upcase (get-param :node-id))
						 :link-id (string-upcase (get-param :link-id))))
	   (branch-image branch))
	  ((get-param :remove-object)
	   (setf (branch-image branch)
		 (remove-graph-element (branch-image branch)
				       (intern (get-param :node-id) "KEYWORD")
				       (if (get-param :link-id)
					   (intern (get-param :link-id) "KEYWORD"))))
	   (set-branch-meta branch :change (list :object-removed t :node-id (get-param :node-id)
						 :link-id (if (get-param :link-id)
							      (get-param :link-id)
							      "")))
	   (branch-image branch))
	  (t (set-branch-meta branch :change nil)
	     (branch-image branch))))
  `((let ((to-return nil))
      (loop for item in ,reagent while (not to-return)
	 do (if (string= (string-upcase ,graph-id)
			 (string-upcase (second item)))
		(setq to-return (cddr item))))
      to-return)))

 (graph-garden-path-display
  (follows reagent)
  `((if (not (of-branch-meta branch :point))
	(set-branch-meta branch :point (getf (first (branch-image branch))
					     :id)))
    (preprocess-nodes ,(if reagent reagent `(branch-image branch)))))

 (graph-garden-path-node-content
  (follows reagent point)
  `((let ((to-return nil))
      ;; (print (list :reg reagent ,point))
      (loop for item in ,reagent while (not to-return)
	 do (if (string= (string-upcase ,point)
			 (string-upcase (getf item :id)))
		(setq to-return item)))
      `((:node ,@(getf to-return :meta)
	       ,@(if (getf to-return :do)
		     (list :action (getf to-return :do))))))))
 )
