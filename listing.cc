/*
Tyler Spring
2/6/23
Project 2
This is the listing.cc file. Here the computations for errors in each line,
as well as the entire file are done and displayed.
*/

#include <cstdio>
#include <string>


using namespace std;
#include "listing.h"


static int lineNumber;
static string error = "";
static int totalErrors = 0;
//totals for each type of error to be displayed at the end.
static int lexErr = 0;
static int synErr = 0;
static int semErr = 0;


static void displayErrors();
//first line method provided.
void firstLine()
{
	lineNumber = 1;
	printf("\n%4d  ",lineNumber);
}
//next line method provided.
void nextLine()
{
	displayErrors();
	lineNumber++;
	printf("%4d  ",lineNumber);
}
//last line method. Here the total errors are checked, if are none, compiled succesfully is printed
//If their are errors, the totals gathered are printed, as well as the total errors.
int lastLine()
{
	printf("\r");
	displayErrors();
	printf("     \n");
	if (totalErrors == 0){
		return printf("Compiled Successfully\n");
	}else {
		printf("total errors is: %d\n", totalErrors);
		printf("Lexical Errors: %d\n", lexErr);
		printf("Snytactical Errors: %d\n", synErr);
		printf("Semantic Errors: %d\n", semErr);	
		}
		return 0;
		}
 //Append Error method. Here the errors found are ran with the enum types of this classes header
 //header file. If errors are found, they are added to the total errors, then to their
 //specific error once identified.   
void appendError(ErrorCategories errorCategory, string message)
{
	string messages[] = { "Lexical Error, Invalid Character ", "",
		"Semantic Error, ", "Semantic Error, Duplicate Identifier: ",
		"Semantic Error, Undeclared "};

	
	error += messages[errorCategory] + message;
	
	
	if(errorCategory == 0)
	{
		lexErr++;
	}
	else if (errorCategory == 1)
	{
		synErr++;
	}
	/*I got lazy and figured it cant be all 3 values at once, so did this.*/
	else if (errorCategory == 2 || errorCategory == 3 || errorCategory == 4) 
	{
		semErr++;
	}
	totalErrors++;
		
}
/*Changed this method back to the original once I realized I was doing this wrong with a queue.*/
void displayErrors()
{
	if (error != "")
		printf("%s\n", error.c_str());
	error = "";
}
