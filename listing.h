/* 
Tyler Spring
2/6/23
Project 2
This is the listing header file. Like project 1, nothing needed to be changed, so I did not mess with it.
*/
enum ErrorCategories {LEXICAL, SYNTAX, GENERAL_SEMANTIC, DUPLICATE_IDENTIFIER,
	UNDECLARED};

void firstLine();
void nextLine();
int lastLine();
void appendError(ErrorCategories errorCategory, string message);

