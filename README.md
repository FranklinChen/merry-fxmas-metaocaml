# merry-fxmas

Say "Merry Christmas" 25 times counting down, using [BER MetaOCaml](http://okmij.org/ftp/ML/MetaOCaml) to do staging.

## Prerequisite: install [BER MetaOCaml](http://okmij.org/ftp/ML/MetaOCaml.html)

### Simple install with [OPAM](http://opam.ocamlpro.com/)

Install [OPAM](http://opam.ocamlpro.com/).

Switch the default compiler to BER MetaOCaml:

Run to list which versions of BER MetaOcaml are available:
```
$ opam switch
```

(As of writing, `4.00.1+BER` is the most recent version available.)

```
$ opam switch 4.00.1+BER
$ eval `opam config env`
```

### (Old annoying way to install)

Follow the original instructions using Git and downloading `metaocaml.bundle`:

```
$ cd ~/ocaml # My directory of OCaml stuff
$ git clone https://github.com/ocaml/ocaml.git -b 4.00 ometa4 
$ cd ometa4
$ git checkout 4.00.1
$ git pull ~/Downloads/metaocaml.bundle metaocaml

$ ./configure -prefix `pwd` -no-pthread -no-tk

$ make core
$ make coreboot
$ make all
$ make -i install

$ cd metalib
$ make all
$ make install
```

## Edit `Makefile`

If you use OPAM and already ran `opam switch 4.00.1+BER`, everything should be set.

Otherwise, edit `Makefile` to point to the location of the installed MetaOCaml executables.

## Run the program

```
$ make run
```
