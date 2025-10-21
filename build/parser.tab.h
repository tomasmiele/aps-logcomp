/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     LET = 258,
     CONST = 259,
     KW_INT = 260,
     KW_BOOL = 261,
     TRUE_LIT = 262,
     FALSE_LIT = 263,
     IF = 264,
     ELSE = 265,
     WHILE = 266,
     FOR = 267,
     BREAK = 268,
     CONTINUE = 269,
     PRINT = 270,
     OUT = 271,
     READ = 272,
     EVERY = 273,
     WHEN = 274,
     MS = 275,
     TEMP = 276,
     DOOROPEN = 277,
     CLOCK_MS = 278,
     IDENT = 279,
     INT_LIT = 280,
     EQ = 281,
     NEQ = 282,
     LE = 283,
     GE = 284,
     LT = 285,
     GT = 286,
     AND = 287,
     OR = 288,
     ASSIGN = 289,
     PLUS = 290,
     MINUS = 291,
     STAR = 292,
     SLASH = 293,
     MOD = 294,
     NOT = 295,
     LPAREN = 296,
     RPAREN = 297,
     LBRACE = 298,
     RBRACE = 299,
     COMMA = 300,
     SEMI = 301,
     COLON = 302,
     UMINUS = 303,
     NO_ELSE = 304
   };
#endif
/* Tokens.  */
#define LET 258
#define CONST 259
#define KW_INT 260
#define KW_BOOL 261
#define TRUE_LIT 262
#define FALSE_LIT 263
#define IF 264
#define ELSE 265
#define WHILE 266
#define FOR 267
#define BREAK 268
#define CONTINUE 269
#define PRINT 270
#define OUT 271
#define READ 272
#define EVERY 273
#define WHEN 274
#define MS 275
#define TEMP 276
#define DOOROPEN 277
#define CLOCK_MS 278
#define IDENT 279
#define INT_LIT 280
#define EQ 281
#define NEQ 282
#define LE 283
#define GE 284
#define LT 285
#define GT 286
#define AND 287
#define OR 288
#define ASSIGN 289
#define PLUS 290
#define MINUS 291
#define STAR 292
#define SLASH 293
#define MOD 294
#define NOT 295
#define LPAREN 296
#define RPAREN 297
#define LBRACE 298
#define RBRACE 299
#define COMMA 300
#define SEMI 301
#define COLON 302
#define UMINUS 303
#define NO_ELSE 304




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

