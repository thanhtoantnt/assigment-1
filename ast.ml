type jlite_exp =
  | NullWord

and jlite_stmt = 
	| ReturnStmt of jlite_exp


let indent = ref 0

(* display a a number of indentation tabs *)
let rec print_tab(): string = 
	let rec recursive_function n: string = 
		if (n <= 0) then "" else "  "^ (recursive_function (n -1))
	in recursive_function (abs !indent)


let string_of_jlite_expr (e:jlite_exp):string =
  let rec helper_func e =
  match e with
    | NullWord -> "null"
  in helper_func e

(* display a Jlite statement *)
let string_of_jlite_stmt (s:jlite_stmt):string =
  let rec helper_func s =
  match s with
	| ReturnStmt e ->  
		print_tab() ^ "Return " ^ (string_of_jlite_expr e)^";"
  in helper_func s
