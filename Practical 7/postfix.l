%{
#include <stdio.h>
#include <stdlib.h>
int stack[100], top = 0;
void push(int v) { stack[top++] = v; }
int pop() { return stack[--top]; }
int yylex(void);
void yyerror(const char *s) { fprintf(stderr, "%s\n", s); }
%}
%token NUMBER EOL
%%
input:
        /* empty */
        | input line
        ;
line:
        EOL {
                if (top==1) printf("Result = %d\n", pop());
                else if (top!=0) printf("Error: stack not empty\n"); top=0;
            }
        | expr EOL {
                if (top==1) printf("Result = %d\n", pop());
                else if (top!=0) printf("Error: stack not empty\n"); top=0;
            }
        ;
expr:
        NUMBER { push($1); }
        | expr expr '+' { int b=pop(); int a=pop(); push(a+b); }
        | expr expr '-' { int b=pop(); int a=pop(); push(a-b); }
        | expr expr '*' { int b=pop(); int a=pop(); push(a*b); }
        | expr expr '/' { int b=pop(); int a=pop(); push(a/b); }
        ;
%%
int main() {
    printf("Enter postfix expression (e.g. 3 4 + 2 *): \n");
    yyparse();
    return 0;
}
