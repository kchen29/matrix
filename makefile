system := "matrix"
asdf := (asdf:initialize-source-registry (quote (:source-registry :ignore-inherited-configuration \
					    (:directory "$(CURDIR)/")))) \
	(asdf:load-system $(system)) \
	(in-package :main)
main := (main-test) (main 500 "output.ppm")

all:
	sbcl --noinform --non-interactive --eval '(require :asdf)' --eval '(progn $(asdf))' --eval '(progn $(main))'

clean:
	rm -f *~ *.fasl *.ppm
