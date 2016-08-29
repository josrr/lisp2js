# lisp2js

Simple Common Lisp to JavaScript translator using Parenscript.

## Executable generation

    $ sbcl --load imagen.lisp
    
    his is SBCL 1.3.8, an implementation of ANSI Common Lisp.
    More information about SBCL is available at <http://www.sbcl.org/>.
    
    SBCL is free software, provided as is, with absolutely no warranty.
    It is mostly in the public domain; some portions are provided under
    BSD-style licenses.  See the CREDITS and COPYING files in the
    distribution for more information.
    To load "lisp2js":
      Load 1 ASDF system:
        lisp2js
    ; Loading "lisp2js"
    ..
    [undoing binding stack and other enclosing state... done]
    [saving current Lisp image into lisp2js:
    writing 4800 bytes from the read-only space at 0x20000000
    writing 3216 bytes from the static space at 0x20100000
    writing 54198272 bytes from the dynamic space at 0x1000000000
    done]

## Examples

### The file is not minified

    $ ./lisp2js -i pruebas/funcion-01.lisp -o tmp/

### The file is minified

    $ lisp2js -i pruebas/funcion-02.lisp -o tmp/ -m

