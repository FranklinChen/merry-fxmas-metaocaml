(lang dune 3.24)

(name merry-fxmas)

; merry-fxmas.opam is generated from this file by `dune build`; edit the
; package metadata here, never in the .opam file.
(generate_opam_files true)

(source
 (github FranklinChen/merry-fxmas-metaocaml))

(authors "Franklin Chen <franklinchen@franklinchen.com>")

(maintainers "Franklin Chen <franklinchen@franklinchen.com>")

(license BSD-3-Clause)

(package
 (name merry-fxmas)
 (synopsis "Say \"Merry Christmas\" 25 times counting down, using BER MetaOCaml staging")
 (description
  "A tiny demonstration of multi-stage programming: a generator builds, at run time, straight-line code that prints a countdown of greetings, then compiles and runs that code with BER MetaOCaml.")
 (depends
  ; See docs/ARCHITECTURE.md, "The compiler is the dependency".
  (ocaml-variants
   (= 5.3.0+BER))
  ; ocamlfind is needed only so that base-metaocaml-ocamlfind installs the
  ; `metaocaml` META; see docs/ARCHITECTURE.md, "The `metaocaml` findlib
  ; library needs `ocamlfind`".
  base-metaocaml-ocamlfind
  ocamlfind))
