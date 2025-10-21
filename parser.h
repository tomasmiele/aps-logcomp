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
     SENSOR = 271,
     IDENT = 272,
     INT_LIT = 273,
     EQ = 274,
     NEQ = 275,
     LE = 276,
     GE = 277,
     LT = 278,
     GT = 279,
     AND = 280,
     OR = 281,
     NOT = 282,
     ASSIGN = 283,
     PLUS = 284,
     MINUS = 285,
     STAR = 286,
     SLASH = 287,
     MOD = 288,
     LPAREN = 289,
     RPAREN = 290,
     LBRACE = 291,
     RBRACE = 292,
     COMMA = 293,
     SEMI = 294,
     COLON = 295,
     COLON_EQ = 296,
     DOT = 297,
     NO_ELSE = 298,
     UMINUS = 299
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
#define SENSOR 271
#define IDENT 272
#define INT_LIT 273
#define EQ 274
#define NEQ 275
#define LE 276
#define GE 277
#define LT 278
#define GT 279
#define AND 280
#define OR 281
#define NOT 282
#define ASSIGN 283
#define PLUS 284
#define MINUS 285
#define STAR 286
#define SLASH 287
#define MOD 288
#define LPAREN 289
#define RPAREN 290
#define LBRACE 291
#define RBRACE 292
#define COMMA 293
#define SEMI 294
#define COLON 295
#define COLON_EQ 296
#define DOT 297
#define NO_ELSE 298
#define UMINUS 299




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

