cilpath = ../modified_cil/cil/lib/cil/

all:
	ocamlfind ocamlopt -c -package batteries -linkpkg -I $(cilpath) main.ml
	ocamlfind ocamlopt -package batteries -linkpkg -I $(cilpath) -ccopt -L$(cilpath) -o goblint_pp_codegen $(cilpath)cil.cmxa main.cmx
