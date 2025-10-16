%{
#include <stdio.h>
 int count = 0;
 %}
%%
 ([ \t\n]|^)[Aa][a-zA-Z]*([ \t\n., ;!? ]|$)   { count++; }
.|\n                                          ;
 %%
int main() {
char s[1000];
printf("Enter a sentence: ");
fgets(s, sizeof(s), stdin);
yy_scan_string(s);
printf("Words starting with 'A' or 'a': %d\n", count);
yylex();
}
return e;
int yywrap() { return 1; }
