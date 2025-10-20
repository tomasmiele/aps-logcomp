%option noyywrap nodefault yylineno
%{
  #include "parser.tab.h"
  #include <string.h>
%}

/* Estado para comentários de bloco C */
%x CCOMMENT

/* Padrões léxicos */
ws          [ \t\r]+
id          [A-Za-z_][A-Za-z0-9_]*
num         [0-9]+
str         \"([^\"\\]|\\.)*\"

%%
/* Espaços e comentários */
{ws}                  ;
"//".*                ;                 /* comentário de linha */

/* Comentário de bloco:  '/* ... *\/' */
"/*"                  { BEGIN(CCOMMENT); }
<CCOMMENT>[^*]+       ;                 /* consome tudo exceto '*' */
<CCOMMENT>"*"+[^*/]   ;                 /* sequência de '*' sem fechar */
<CCOMMENT>"*"+"/"     { BEGIN(INITIAL); } /* fecha '*/' */

/* Palavras-chave */
"let"                 return T_LET;
"const"               return T_CONST;
"if"                  return T_IF;
"else"                return T_ELSE;
"while"               return T_WHILE;
"for"                 return T_FOR;
"break"               return T_BREAK;
"continue"            return T_CONTINUE;
"print"               return T_PRINT;
"out"                 return T_OUT;
"read"                return T_READ;
"every"               return T_EVERY;
"when"                return T_WHEN;
"bool"                return T_BOOL;
"int"                 return T_INT;
"true"                return T_TRUE;
"false"               return T_FALSE;

/* Sensores (ajuste conforme desejar) */
"temp"                return T_TEMP;
"doorOpen"            return T_DOOROPEN;
"clock_ms"            return T_CLOCKMS;

/* Unidade de tempo para 'every' */
"ms"                  return T_MS;

/* Operadores e pontuação (tokens compostos primeiro) */
"=="                  return T_EQ;
"!="                  return T_NEQ;
"<="                  return T_LE;
">="                  return T_GE;
"&&"                  return T_AND;
"||"                  return T_OR;

/* Operadores de 1 caractere */
"="                   return T_ASSIGN;
"<"                   return T_LT;
">"                   return T_GT;
"+"                   return T_PLUS;
"-"                   return T_MINUS;
"*"                   return T_MUL;
"/"                   return T_DIV;
"%"                   return T_MOD;
"!"                   return T_NOT;

/* Delimitadores */
"("                   return T_LPAREN;
")"                   return T_RPAREN;
"{"                   return T_LBRACE;
"}"                   return T_RBRACE;
";"                   return T_SEMI;
","                   return T_COMMA;
":"                   return T_COLON;

/* Literais e identificadores */
{num}                 { yylval.ival = atoi(yytext); return T_NUMBER; }
{str}                 { yylval.sval = strdup(yytext); return T_STRING; }
{id}                  { yylval.sval = strdup(yytext); return T_IDENT; }

/* Nova linha — yylineno já é atualizado com %option yylineno */
\n                    ;

.                     { return *yytext; }
%%
