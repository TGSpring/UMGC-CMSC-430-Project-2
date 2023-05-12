/*Tyler Spring
2/6/23
Project 2
This is the tokens header file. It has been modified to include the new operator and literal tokens added in the scanner and parser.
It reloads its self even when I removed it, I do not fully understand why, but it works so here it stays. */

#ifndef YY_YY_PARSER_TAB_H_INCLUDED
# define YY_YY_PARSER_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    IDENTIFIER = 258,              /* IDENTIFIER  */
    INT_LITERAL = 259,             /* INT_LITERAL  */
    REAL_LITERAL = 260,            /* REAL_LITERAL  */
    BOOL_LITERAL = 261,            /* BOOL_LITERAL  */
    ADDOP = 262,                   /* ADDOP  */
    MULOP = 263,                   /* MULOP  */
    RELOP = 264,                   /* RELOP  */
    OROP = 265,                    /* OROP  */
    ANDOP = 266,                   /* ANDOP  */
    EXPOP = 267,                   /* EXPOP  */
    REMOP = 268,                   /* REMOP  */
    BEGIN_ = 269,                  /* BEGIN_  */
    BOOLEAN = 270,                 /* BOOLEAN  */
    END = 271,                     /* END  */
    ENDREDUCE = 272,               /* ENDREDUCE  */
    FUNCTION = 273,                /* FUNCTION  */
    INTEGER = 274,                 /* INTEGER  */
    IS = 275,                      /* IS  */
    REDUCE = 276,                  /* REDUCE  */
    RETURNS = 277,                 /* RETURNS  */
    CASE = 278,                    /* CASE  */
    ELSE = 279,                    /* ELSE  */
    ARROW = 280,                   /* ARROW  */
    ENDCASE = 281,                 /* ENDCASE  */
    ENDIF = 282,                   /* ENDIF  */
    IF = 283,                      /* IF  */
    OTHERS = 284,                  /* OTHERS  */
    REAL = 285,                    /* REAL  */
    THEN = 286,                    /* THEN  */
    WHEN = 287,                    /* WHEN  */
    NOT = 288                      /* NOT  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_PARSER_TAB_H_INCLUDED  */
