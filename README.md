# merry-fxmas

Say "Merry Christmas" 25 times counting down, using [BER MetaOCaml](http://okmij.org/ftp/ML/MetaOCaml) to do staging.

## OPAM

Install [OPAM](http://opam.ocamlpro.com/) if you don't already have it installed.

## BER MetaOCaml

Switch to, or install, [BER MetaOCaml](http://okmij.org/ftp/ML/MetaOCaml.html):

```console
$ opam switch 4.01.0+BER
$ eval `opam config env`
```

## Build the program

```console
$ ocamlbuild -ocamlc metaocamlc main.byte
```

## Run the program

```console
$ ./main.byte
```

## TODO

Add a test.

