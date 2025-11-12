%{
#include <stdio.h>
int count = 0;
%}

%%
[a-zA-Z]+ {
    if (yytext[0] == 'A' || yytext[0] == 'a')
        count++;
}
[ \t\n]+   { /* skip */ }
.          { /* ignore */ }
%%

int main() {
    printf("Enter a sentence:\n");
    yylex();
    printf("\nNumber of words starting with 'A' or 'a': %d\n", count);
    return 0;
}