all: main.fasl
	sbcl --script main.fasl

%.fasl:
	sbcl --non-interactive --eval '(compile-file "$*.lisp")' > /dev/null

main.fasl: main.lisp draw.fasl matrix.fasl display.fasl

draw.fasl: draw.lisp matrix.fasl display.fasl

matrix.fasl: matrix.lisp display.fasl

display.fasl: display.lisp

clean:
	rm -f *~ *.fasl *.ppm
