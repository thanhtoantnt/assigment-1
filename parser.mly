/* File parser.mly */
%{
  open Ast
%}

%token <string> LETTER
%token <int> INT
%token PLUS MINUS TIMES DIV
%token LPAREN RPAREN
%token EOL EOF RETURN NULL
%left PLUS MINUS        /* lowest precedence */
%left TIMES DIV         /* medium precedence */
%nonassoc UMINUS        /* highest precedence */
%start main             /* the entry point */
%type <Ast.jlite_stmt> main
%%

main:
  stmt EOF                { $1 }
;
  stmt:
    RETURN exp {ReturnStmt $2}
;
  exp:
    NULL {NullWord}
;
