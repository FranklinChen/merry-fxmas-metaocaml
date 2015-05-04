# merry-fxmas in MetaOCaml

[![Build Status](https://travis-ci.org/FranklinChen/merry-fxmas-metaocaml.png)](https://travis-ci.org/FranklinChen/merry-fxmas-metaocaml)

Say "Merry Christmas" 25 times counting down, using [BER MetaOCaml](http://okmij.org/ftp/ML/MetaOCaml) to do staging.

## OPAM

Install [OPAM](http://opam.ocamlpro.com/) if you don't already have it installed.

## BER MetaOCaml

Switch to, or install, [BER MetaOCaml](http://okmij.org/ftp/ML/MetaOCaml.html):

```console
$ opam switch 4.02.1+BER
$ eval `opam config env`
```

## Build the program

```console
$ ocamlbuild -ocamlc metaocamlc src/main.byte
```

## Run the program

```console
$ ./main.byte
```

## TODO

Add a test.

