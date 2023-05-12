/*Tyler Spring
2/6/23
Project 2
The parser file. I never want to make one again and I will comment through this file why.
Here the grammar is modified in order to meet the requirments of the new language and have it analyzied correctly
given the new rules.  */

%{

#include <string>

using namespace std;

#include "listing.h"

int yylex();
void yyerror(const char* message);

%}

%define parse.error verbose
/*added tokens added for real and bool literals*/
%token IDENTIFIER
%token INT_LITERAL
%token REAL_LITERAL
%token BOOL_LITERAL
/*Added operator tokens, which I thought were my error for reduction was.*/
%token ADDOP MULOP RELOP OROP ANDOP EXPOP REMOP
/*added rules*/
%token BEGIN_ BOOLEAN END ENDREDUCE FUNCTION INTEGER IS REDUCE RETURNS CASE ELSE ARROW

%token ENDCASE ENDIF IF OTHERS REAL THEN WHEN NOT

%%

function:	
	function_header optional_variable body ;
	/*added parameter or varaible added to header*/
function_header:	
	FUNCTION IDENTIFIER optional_parameter RETURNS type ';' ;

optional_variable:
	optional_variable variable |
	;

variable:
	IDENTIFIER ':' type IS statement_ ;
	/*parameter headers added. commona added. colon added to identifier.
	Named optional parameter because looking for parameter then parameters hurts my eyes.*/
optional_parameter:
	optional_parameter RETURNS type ',' |
	parameter ;

parameter:
 IDENTIFIER ':' type |
 ;
/*real added*/
type: INTEGER | REAL | BOOLEAN ;

body:
    BEGIN_ statement_ END ';' ;
    
statement_:
	statement ';' |
	error ';' ;
/*if else line added for end if as well as case and is statement.*/	
statement:
	 expression |
	 REDUCE operator reductions ENDREDUCE |
	IF expression THEN statement_ ELSE statement_ ENDIF |
	CASE expression IS optional_cases OTHERS ARROW statement_ ENDCASE ;

reductions:
	reductions statement_ |
	;
	
optional_cases:
	optional_cases case |
	;
/*modified case statement*/	
case:
 WHEN INT_LITERAL ARROW statement_ ;
	

operator:
	ADDOP | MULOP ;

		    
expression:
	expression ANDOP relation |
	 expressionSecond;

expressionSecond:
	expression OROP relation |
	relation;

relation:
	relation RELOP term |
	term;

term:
	term ADDOP factor |
	factor ;
      
factor:
	factor MULOP primary |
      factor REMOP |
	exponent;

exponent:
	factor EXPOP notion |
	notion;

notion:
	notion NOT primary |
	primary;
	
primary:
	'(' expression ')' |
	expression binary_operator expression |
	NOT expression |
	INT_LITERAL | REAL_LITERAL | BOOL_LITERAL |
	IDENTIFIER ;
	
/*I spent so much time trying to fix reduction errors. To realize the answer, this line, was right there.
I now hate bison and feel dumb. But it works.*/
binary_operator:
	ADDOP | MULOP | REMOP | EXPOP | RELOP ;
%%

void yyerror(const char* message)
{
	appendError(SYNTAX, message);
}
/*Main method that runs the program*/
int main(int argc, char *argv[])    
{
	firstLine();
	yyparse();
	lastLine();
	
	return 0;
} 
