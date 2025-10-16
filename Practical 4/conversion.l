%{
#include <stdio.h>
%}
%%
[a-z]   { printf("%c", yytext[0] - 32); }   // Convert lowercase to uppercase
[A-Z]   { printf("%c", yytext[0] + 32); }   // Convert uppercase to lowercase
.       { printf("%c", yytext[0]); }       // Print other characters as-is
%%
int main() {
    printf("Enter a string: ");
    yylex();
    return 0;
}
int yywrap() {
    return 1;
}
