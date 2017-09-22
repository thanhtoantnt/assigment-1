        (* File calc.ml *)
        let _ =
          try
            let chan_in = open_in Sys.argv.(1) in
  let n = in_channel_length chan_in in
  let input_str = really_input_string chan_in n in
  (* let () = print_string input_str in *)
  let lexbuf = Lexing.from_string  (input_str) in
            (* let lexbuf = Lexing.from_channel stdin in *)
            let result = Parser.main Lexer.token lexbuf in
              print_string(Ast.string_of_jlite_stmt result); print_newline(); flush stdout
          with Lexer.Eof ->
            exit 0
