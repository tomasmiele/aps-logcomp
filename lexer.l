%option noyywrap yylineno nodefault
%{
  #include "parser.tab.h"
  #include <stdlib.h>
%}

%%
[ \t\r]+                              { /* skip */ }
"//"[^\n]*                            { /* skip */ }

"let"                                 { return LET; }
"const"                               { return CONST; }
"int"                                 { return KW_INT; }
"bool"                                { return KW_BOOL; }
"true"                                { return TRUE_LIT; }
"false"                               { return FALSE_LIT; }

"if"                                  { return IF; }
"else"                                { return ELSE; }
"while"                               { return WHILE; }
"for"                                 { return FOR; }
"break"                               { return BREAK; }
"continue"                            { return CONTINUE; }

"print"                               { return PRINT; }
"out"                                 { return OUT; }
"read"                                { return READ; }

"every"                               { return EVERY; }
"when"                                { return WHEN; }
"ms"                                  { return MS; }

"temp"                                { return TEMP; }
"doorOpen"                            { return DOOROPEN; }
"clock_ms"                            { return CLOCK_MS; }

"=="                                  { return EQ; }
"!="                                  { return NEQ; }
"<="                                  { return LE; }
">="                                  { return GE; }
"&&"                                  { return AND; }
"||"                                  { return OR; }

"="                                   { return ASSIGN; }
"<"                                   { return LT; }
">"                                   { return GT; }
"+"                                   { return PLUS; }
"-"                                   { return MINUS; }
"*"                                   { return STAR; }
"/"                                   { return SLASH; }
"%"                                   { return MOD; }
"!"                                   { return NOT; }

"("                                   { return LPAREN; }
")"                                   { return RPAREN; }
"{"                                   { return LBRACE; }
"}"                                   { return RBRACE; }
","                                   { return COMMA; }
";"                                   { return SEMI; }
":"                                   { return COLON; }

[0-9]+                                { yylval = atoi(yytext); return INT_LIT; }
[a-zA-Z_][a-zA-Z0-9_]*                { return IDENT; }

\n                                    { /* keep line count */ }
.                                     { return *yytext; }
%%
