%{
  #include <stdio.h>
  #include <stdlib.h>

  int yylex(void);
  extern int yylineno;
  void yyerror(const char *s) { fprintf(stderr, "Erro sintático (linha %d): %s\n", yylineno, s); }
%}

%start program

/* TOKENS */
%token LET CONST KW_INT KW_BOOL TRUE_LIT FALSE_LIT
%token IF ELSE WHILE FOR BREAK CONTINUE
%token PRINT OUT READ EVERY WHEN MS
%token TEMP DOOROPEN CLOCK_MS
%token IDENT INT_LIT
%token EQ NEQ LE GE LT GT AND OR
%token ASSIGN PLUS MINUS STAR SLASH MOD NOT
%token LPAREN RPAREN LBRACE RBRACE COMMA SEMI COLON

/* Precedência */
%left OR
%left AND
%left EQ NEQ
%left LT LE GT GE
%left PLUS MINUS
%left STAR SLASH MOD
%right NOT UMINUS
%nonassoc NO_ELSE
%nonassoc ELSE

%%

program
  : /* vazio */
  | program item
  ;

item
  : declaration
  | statement
  ;

declaration
  : var_decl
  | const_decl
  ;

var_decl
  : LET IDENT COLON type opt_init SEMI
  ;

const_decl
  : CONST IDENT COLON type ASSIGN expression SEMI
  ;

type
  : KW_INT
  | KW_BOOL
  ;

opt_init
  : /* vazio */
  | ASSIGN expression
  ;

statement
  : block
  | assign SEMI
  | if_stmt
  | while_stmt
  | for_stmt
  | io_stmt
  | event_stmt
  | BREAK SEMI
  | CONTINUE SEMI
  | SEMI
  ;

block
  : LBRACE block_items RBRACE
  ;

block_items
  : /* vazio */
  | block_items declaration
  | block_items statement
  ;

assign
  : lvalue ASSIGN expression
  ;

lvalue
  : IDENT
  ;

if_stmt
  : IF LPAREN expression RPAREN statement %prec NO_ELSE
  | IF LPAREN expression RPAREN statement ELSE statement
  ;

while_stmt
  : WHILE LPAREN expression RPAREN statement
  ;

for_stmt
  : FOR LPAREN for_init SEMI opt_expr SEMI opt_expr RPAREN statement
  ;

for_init
  : /* vazio */
  | LET IDENT COLON type opt_init
  | lvalue ASSIGN expression
  ;

opt_expr
  : /* vazio */
  | expression
  | assign
  ;

io_stmt
  : PRINT LPAREN expression RPAREN SEMI
  | OUT   LPAREN expression RPAREN SEMI
  | READ  LPAREN sensor_ref RPAREN SEMI
  ;

event_stmt
  : EVERY INT_LIT MS block
  | WHEN  LPAREN expression RPAREN block
  ;

sensor_ref
  : TEMP
  | DOOROPEN
  | CLOCK_MS
  ;

expression
  : logical_or
  ;

logical_or
  : logical_and
  | logical_or OR logical_and
  ;

logical_and
  : equality
  | logical_and AND equality
  ;

equality
  : relational
  | equality EQ relational
  | equality NEQ relational
  ;

relational
  : additive
  | relational LT additive
  | relational LE additive
  | relational GT additive
  | relational GE additive
  ;

additive
  : multiplicative
  | additive PLUS  multiplicative
  | additive MINUS multiplicative
  ;

multiplicative
  : unary
  | multiplicative STAR  unary
  | multiplicative SLASH unary
  | multiplicative MOD   unary
  ;

unary
  : primary
  | NOT unary
  | MINUS unary %prec UMINUS
  ;

primary
  : INT_LIT
  | TRUE_LIT
  | FALSE_LIT
  | IDENT
  | sensor_ref
  | LPAREN expression RPAREN
  ;

%%
