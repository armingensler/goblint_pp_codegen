all:
	ocamlfind ocamlopt -c -package batteries -linkpkg -I ../modified_cil/cil/lib/cil/ main.ml
	ocamlfind ocamlopt -package batteries -linkpkg -I ../modified_cil/cil/lib/cil/ -ccopt -L../modified_cil/cil/cil-develop/lib/cil/ -o goblint_pp_codegen ../modified_cil/cil/lib/cil/cil.cmxa main.cmx
