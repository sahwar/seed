(META
 ((META :PORTAL.DEMO1 :ATOM (:IF (:TYPE :PORTAL-NAME)) :IF
   (:ENCLOSE :ENCLOSE-OVERVIEW :FILL :FILL-OVERVIEW :NAME :PORTAL-SPECS :LAYOUT
    :COLUMN :BREADTH :SHORT :TYPE :VISTA))
  (META "demo-sheet" :IF
   (:TYPE :SELECT :OPTIONS
    ((:VALUE "demo-sheet" :TITLE "demoSheet")
     (:VALUE "demo-drawing" :TITLE "demoDrawing"))))
  (META
   ((META :MAIN :ATOM (:IF (:TARGET :MAIN :TYPE :BRANCH-SELECTOR)) :EACH
     (:IF (:INTERACTION :SELECT-BRANCH)) :IF
     (:SETS (2) :INDEX 0 :TYPE :SYSTEM-BRANCH-LIST))
    (META :DRAWING :IF (:TARGET :DRAWING :TYPE :BRANCH-SELECTOR)))
   :ATOM (:IF (:TARGET :MAIN :TYPE :BRANCH-SELECTOR)) :EACH
   (:IF (:INTERACTION :SELECT-BRANCH)) :IF
   (:SETS (2) :INDEX 0 :TYPE :SYSTEM-BRANCH-LIST)))
 :ATOM (:IF (:TYPE :PORTAL-NAME)) :IF
 (:ENCLOSE :ENCLOSE-OVERVIEW :FILL :FILL-OVERVIEW :NAME :PORTAL-SPECS :LAYOUT
  :COLUMN :BREADTH :SHORT :TYPE :VISTA))
