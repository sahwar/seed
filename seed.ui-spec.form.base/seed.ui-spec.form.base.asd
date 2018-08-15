;;;; seed.ui-spec.form.base.asd
(asdf:defsystem #:seed.ui-spec.form.base
  :description "Standard templates for the display of interactive data forms (i.e. Lisp programs) in the Seed interface."
  :author "Andrew Sengul"
  :license "GPL-3.0"
  :serial t
  :components ((:file "extension")
               (:file "form.base")))
