 (* File lexer.mll *)
        {
        open Parser        (* The type token is defined in parser.mli *)
        exception Eof
        }
        rule token = parse
            [' ' '\t']     { token lexbuf }     (* skip blanks *)
          | ['\n' ]        { EOL }
          | ['a'-'z'] as lxm     { LETTER (Char.escaped lxm)}
          | "return"       { RETURN}
          | "null"       { NULL}
          | eof            { EOF }
