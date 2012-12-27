# Where the BER MetaOCaml was installed
METAOCAMLBIN = $(HOME)/ocaml/ocaml-3.11.2/bin

METAOCAMLC = $(METAOCAMLBIN)/metaocamlc
RESULT = main

all:	$(RESULT)

run:	$(RESULT)
	./$(RESULT)

$(RESULT):	main.ml
	$(METAOCAMLC) $< -o $@

clean:
	-rm -f $(RESULT) *.cm*

.PHONY:	all run clean
