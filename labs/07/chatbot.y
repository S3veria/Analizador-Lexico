%{
#include <stdio.h>
#include <time.h>

void yyerror(const char *s);
int yylex(void);
%}

%token HELLO GOODBYE TIME GREETING FEELING WEATHER

%%

chatbot : greeting
        | farewell
        | query
        | introduction
        | feel
        | tellweather
        ;

greeting : HELLO { printf("Chatbot: Hello! How can I help you today?\n"); }
         ;

farewell : GOODBYE { printf("Chatbot: Goodbye! Have a great day!\n"); }
         ;

introduction : GREETING { printf("Chatbot: My Name is Watson! Nice to meet you!\n"); }
         ;

feel : FEELING { printf("Chatbot: I am unable to feel, but if I were, I'm sure I'd be happy :)\n"); }
         ;

tellweather : WEATHER { printf("The weather here in Guadalajara is terrible, the city is on fire!\n"); }
         ;

query : TIME { 
            time_t now = time(NULL);
            struct tm *local = localtime(&now);
            printf("Chatbot: The current time is %02d:%02d.\n", local->tm_hour, local->tm_min);
         }
       ;

%%

int main() {
    printf("Chatbot: Hi! You can greet me, ask for the time, or say goodbye.\n");
    while (yyparse() == 0) {
        // Loop until end of input
    }
    return 0;
}

void yyerror(const char *s) {
    fprintf(stderr, "Chatbot: I didn't understand that.\n");
}