# merry-fxmas

Say "Merry Christmas" 25 times counting down, using [BER MetaOCaml](http://okmij.org/ftp/ML/MetaOCaml) to do staging.

## Usage

First, install [BER MetaOCaml](http://okmij.org/ftp/ML/MetaOCaml.html). Here is how I install it according to the instructions using Git and downloading `metaocaml.bundle`:

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

Then edit `Makefile` to point to the location of the installed MetaOCaml executables; for me the binaries are in `~/ocaml/ometa4/bin`.

Then you can compile and run the program:

```
$ make run
```
