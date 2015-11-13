open Batteries
    
let real_main () =
    let argv = Sys.argv in
    print_endline "goblint_pp_codegen";
    if Array.length argv < 3 then 
        print_endline "not enough arguments"
    else begin
    
        let in_filename = Array.get argv 1 in
        let out_filename = Array.get argv 2 in
        
        (*print_endline ("in_filename = " ^ in_filename);*)
        (*print_endline ("out_filename = " ^ out_filename);*)      
        (*print_endline ("cil version = " ^ Cil.cilVersion);*)
        
        let file = Frontc.parse in_filename () in
        
        let oc = Pervasives.open_out out_filename in
        Cil.dumpFile (Cil.defaultCilPrinter) (oc) out_filename file;
        Pervasives.close_out oc;
                
        print_endline "done."
    end
    
let main =
  let main_running = ref false in fun () ->
    if !main_running then () else
      let _ = main_running := true in
      real_main ()

let _ =
  at_exit main
