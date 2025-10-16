%{
#include <stdio.h>
#include <string.h>
%}
%%
.* {
        int len = strlen(yytext);
        if (len >= 3 && strcmp(yytext + len - 3, "com") == 0)
                printf("Line ends with 'com'\n");
        else
                printf("Line not ends with 'com'\n");
}
%%
int main() {
        yylex();
        return 0;
}
