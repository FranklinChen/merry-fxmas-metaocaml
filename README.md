# merry-fxmas in MetaOCaml

![CI](https://github.com/FranklinChen/merry-fxmas-metaocaml/workflows/CI/badge.svg)

Say "Merry Christmas" 25 times counting down, using [BER MetaOCaml](http://okmij.org/ftp/ML/MetaOCaml) to do staging.

## OPAM

Install [OPAM](http://opam.ocamlpro.com/) if you don't already have it installed.

## BER MetaOCaml

Switch to, or install, [BER MetaOCaml](http://okmij.org/ftp/ML/MetaOCaml.html):

If first time:

```console
$ opam switch create 4.11.1+BER
```

Else:

```console
$ opam switch 4.11.1+BER
```

Then
```
$ eval `opam config env`
```

## Build the program

If you don't already have `ocamlbuild` installed:

```console
$ opam install ocamlbuild
```

```console
$ ocamlbuild -ocamlc metaocamlc src/main.byte
```

## Run the program

```console
$ ./main.byte
```

## TODO

Add a test.

