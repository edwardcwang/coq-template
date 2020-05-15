.PHONY: coq clean

COQC=coqc -q -R . MyProject

coq:
	$(COQC) Options.v
	$(COQC) Hello.v
	$(COQC) MyProject.v

clean:
	rm -f *.vo *.glob *.aux .*.aux .lia.cache .nia.cache *.vok *.vos
