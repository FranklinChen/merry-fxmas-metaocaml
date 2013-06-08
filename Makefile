# Where the BER MetaOCaml was installed
#METAOCAMLC = $(HOME)/ocaml/ometa4/bin/metaocamlc
METAOCAMLC = metaocamlc

RESULT = main

all:	$(RESULT)

run:	$(RESULT)
	./$(RESULT)

$(RESULT):	main.ml
	$(METAOCAMLC) $< -o $@

clean:
	-rm -f $(RESULT) *.cm*

.PHONY:	all run clean
