%{
/* Parser somente sintático: não construímos AST, só validamos a forma */
#include <stdio.h>
#include <stdlib.h>

/* Protótipo do scanner gerado pelo Flex */
int yylex(void);
void yyerror(const char *s) { fprintf(stderr, "Erro sintático (linha %d): %s\n", yylineno, s); }
extern int yylineno;
%}

/* ----------------- Tokens ----------------- */
%token LET CONST KW_INT KW_BOOL
%token TRUE_LIT FALSE_LIT
%token IF ELSE WHILE FOR BREAK CONTINUE
%token PRINT SENSOR
%token IDENT INT_LIT

%token EQ NEQ LE GE LT GT
%token AND OR NOT
%token ASSIGN PLUS MINUS STAR SLASH MOD
%token LPAREN RPAREN LBRACE RBRACE COMMA SEMI COLON COLON_EQ
%token DOT

%nonassoc NO_ELSE
%nonassoc ELSE

/* ----------------- Precedência (baixa -> alta) ----------------- */
%left OR
%left AND
%left EQ NEQ
%left LT LE GT GE
%left PLUS MINUS
%left STAR SLASH MOD
%right NOT
%right UMINUS

%start program

%%

program
    : stmt_list
    ;

stmt_list
    : stmt
    | stmt_list stmt
    ;

stmt
    : var_decl SEMI
    | assign    SEMI
    | print_stmt SEMI
    | if_stmt
    | while_stmt
    | for_stmt
    | block
    | BREAK SEMI
    | CONTINUE SEMI
    ;

/* ---------- Bloco ---------- */
block
    : LBRACE stmt_list RBRACE
    | LBRACE RBRACE
    ;

/* ---------- Declarações ---------- */
var_decl
    : LET IDENT COLON type                 /* let x: int; */
    | LET IDENT COLON type ASSIGN expr     /* let x: int = 0; */
    | CONST IDENT COLON type ASSIGN expr   /* const y: bool = true; */
    ;

type
    : KW_INT
    | KW_BOOL
    ;

/* ---------- Atribuição ---------- */
assign
    : IDENT ASSIGN expr                    /* (propositalmente) não permitimos sensor.* à esquerda */
    ;

/* ---------- Comandos ---------- */
print_stmt
    : PRINT LPAREN expr RPAREN
    ;

if_stmt
  : IF LPAREN expr RPAREN stmt %prec NO_ELSE
  | IF LPAREN expr RPAREN stmt ELSE stmt
  ;

while_stmt
    : WHILE LPAREN expr RPAREN stmt
    ;

/* for ( init? ; cond? ; step? ) stmt */
for_stmt
    : FOR LPAREN opt_init SEMI opt_expr SEMI opt_step RPAREN stmt
    ;

opt_init
    : /* vazio */
    | var_decl
    | assign
    ;

opt_expr
    : /* vazio */
    | expr
    ;

opt_step
    : /* vazio */
    | assign
    ;

/* ---------- Expressões ---------- */
expr
    : expr OR  expr
    | expr AND expr
    | expr EQ  expr
    | expr NEQ expr
    | expr LT  expr
    | expr LE  expr
    | expr GT  expr
    | expr GE  expr
    | expr PLUS  expr
    | expr MINUS expr
    | expr STAR  expr
    | expr SLASH expr
    | expr MOD   expr
    | NOT expr
    | MINUS expr %prec UMINUS
    | LPAREN expr RPAREN
    | primary
    ;

primary
    : INT_LIT
    | TRUE_LIT
    | FALSE_LIT
    | IDENT
    | sensor_ref
    ;

sensor_ref
    : SENSOR DOT IDENT                      /* sensor.temp, sensor.time, ... */
    ;

%%

