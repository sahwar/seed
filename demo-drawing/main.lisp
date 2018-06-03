(IN-PACKAGE #:DEMO-DRAWING)
(GEN-SVG
 (:G :ID "group1"
  (:RECT :X 228 :Y 82 :HEIGHT 100 :WIDTH 40 :FILL
   (META "#9ae99a" :IF (:OUTPUT :HTML-RGB-STRING :TYPE :COLOR-PICKER)))
  (:ELLIPSE :CX 245 :FILL
   (META "#C80000" :IF
    (:OPTIONS
     ((:TITLE "Faded Red" :VALUE "#CC4B4B")
      (:TITLE "Dark Red" :VALUE "#C80000"))
     :TYPE :SELECT))
   :CY 320 :RX 100 :RY 100))
 (META
  (SPIRAL-POINTS 450 300
   (META
    ((META ((:CIRCLE :R 3 :STROKE-WIDTH 2 :STROKE "#E3DBDB" :FILL "#88AA00"))
      :IF (:TYPE :ITEM :TITLE "Small Green Circle" :REMOVABLE T))
     (META ((:CIRCLE :R 3 :STROKE-WIDTH 2 :STROKE "#E3DBDB" :FILL "#88AA00"))
      :IF (:REMOVABLE T :TITLE "Small Green Circle" :TYPE :ITEM))
     (META ((:CIRCLE :R 3 :STROKE-WIDTH 2 :STROKE "#E3DBDB" :FILL "#88AA00"))
      :IF (:TYPE :ITEM :TITLE "Small Green Circle" :REMOVABLE T))
     (META ((:CIRCLE :R 3 :STROKE-WIDTH 2 :STROKE "#E3DBDB" :FILL "#88AA00"))
      :IF (:TYPE :ITEM :TITLE "Small Green Circle" :REMOVABLE T))
     (META ((:CIRCLE :R 3 :STROKE-WIDTH 2 :STROKE "#E3DBDB" :FILL "#88AA00"))
      :IF (:REMOVABLE T :TITLE "Small Green Circle" :TYPE :ITEM))
     (META ((:CIRCLE :R 3 :STROKE-WIDTH 2 :STROKE "#E3DBDB" :FILL "#88AA00"))
      :IF (:TYPE :ITEM :TITLE "Small Green Circle" :REMOVABLE T))
     (META ((:CIRCLE :R 5 :STROKE-WIDTH 2 :STROKE "#E3DBDB" :FILL "#87AADE"))
      :IF (:REMOVABLE T :TITLE "Big Blue Circle" :TYPE :ITEM))
     (META ((:CIRCLE :R 3 :STROKE-WIDTH 2 :STROKE "#E3DBDB" :FILL "#88AA00"))
      :IF (:TYPE :ITEM :TITLE "Small Green Circle" :REMOVABLE T))
     (META ((:CIRCLE :R 5 :STROKE-WIDTH 2 :STROKE "#E3DBDB" :FILL "#87AADE"))
      :IF (:REMOVABLE T :TITLE "Big Blue Circle" :TYPE :ITEM))
     (META ((:CIRCLE :R 3 :STROKE-WIDTH 2 :STROKE "#E3DBDB" :FILL "#88AA00"))
      :IF (:TYPE :ITEM :TITLE "Small Green Circle" :REMOVABLE T))
     (META ((:CIRCLE :R 5 :STROKE-WIDTH 2 :STROKE "#E3DBDB" :FILL "#87AADE"))
      :IF (:REMOVABLE T :TITLE "Big Blue Circle" :TYPE :ITEM)))
    :IF
    (:TYPE :LIST :FILL-BY :SELECT :REMOVABLE NIL :OPTIONS
     ((:TITLE "Small Green Circle" :VALUE
       (META ((:CIRCLE :R 3 :STROKE-WIDTH 2 :STROKE "#E3DBDB" :FILL "#88AA00"))
        :IF (:TYPE :ITEM :TITLE "Small Green Circle" :REMOVABLE T)))
      (:TITLE "Big Blue Circle" :VALUE
       (META ((:CIRCLE :R 5 :STROKE-WIDTH 2 :STROKE "#E3DBDB" :FILL "#87AADE"))
        :IF (:TYPE :ITEM :TITLE "Big Blue Circle" :REMOVABLE T)))))))
  :FORMAT SPIRAL-POINTS-EXPAND))
(LET ((A 1) (B 2))
  (+ (* A 3) (+ B 1)))
(LIST #\a T NIL (CAR (CDR (LIST 1 2))))
