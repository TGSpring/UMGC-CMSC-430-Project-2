/* 
Tyler Spring
2/6/23
Project 2
This is the scanner.l file. Here the reserved words, tokens, and a token for the append error method of the listing.cc fileS .
*/

%{
#include <cstdio>
#include <string>


using namespace std;

#include "listing.h"
#include "tokens.h"

%}

%option noyywrap

ws		[ \t\r]+
comment		\-\-.*\n
real		{digit}+\.{digit}*([Ee][+-]?{digit}+)?
bool		(true|false)
line		[\n]
relop		((\/?=|[><]?=<?)|([><]))
comment2 	\\\\.*\n
id		[A-Za-z][A-Za-z_0-9]*
digit		[0-9]
int		{digit}+
punc		[\(\),:;]
%%

{ws}		{ ECHO; }
{comment2}	{ ECHO; nextLine();}
{comment}	{ ECHO; nextLine();}
{line}		{ ECHO; nextLine();}
{bool}		{ECHO; return(BOOL_LITERAL); }
{real}		{ECHO; return(REAL_LITERAL);}
{relop}		{ECHO; return(RELOP);}
"+"		{ ECHO; return(ADDOP); }
"-"		{ ECHO; return(ADDOP); }
"*"		{ ECHO; return(MULOP); }
"/"		{ ECHO; return(MULOP); }
rem		{ ECHO; return(REMOP); }
"**"		{ ECHO; return(EXPOP); }

	/*Arrow. The above relop tokens have been removed and replaced with relop
	given the parser file*/
"=>"		{ ECHO; return(ARROW); }
or		{ ECHO; return(OROP);  }
not 		{ ECHO; return(NOT); }
    /* Here are the reserved words*/
case		{ ECHO; return(CASE);  }
else 		{ ECHO; return(ELSE);  }
endcase		{ ECHO; return(ENDCASE); }
endif		{ ECHO; return(ENDIF);  }
if		{ ECHO; return(IF);  }
others 		{ ECHO; return(OTHERS) ;}
real 		{ ECHO; return(REAL)  ;}
then		{ ECHO; return(THEN) ;}
when 		{ ECHO; return(WHEN) ;}
	/*real literals and bool literals. I am not sure with reduce does not have
	() but it works so it is staying that way.*/
begin		{ ECHO; return(BEGIN_); }
boolean		{ ECHO; return(BOOLEAN); }
end		{ ECHO; return(END); }
endreduce	{ ECHO; return(ENDREDUCE); }
function	{ ECHO; return(FUNCTION); }
integer		{ ECHO; return(INTEGER); }
is		{ ECHO; return(IS); }
reduce		{ ECHO; return REDUCE; }
returns		{ ECHO; return(RETURNS); }
and		{ ECHO; return(ANDOP); }
{id}		{ ECHO; return(IDENTIFIER);}
{int}		{ ECHO; return(INT_LITERAL); }
{punc}		{ ECHO; return(yytext[0]); }
.		{ ECHO; appendError(LEXICAL, yytext); }
%%
