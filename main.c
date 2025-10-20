#include <stdio.h>
int yyparse(void);
int yylex_destroy(void);

int main(void) {
    int rc = yyparse();
    if (rc == 0) {
        puts("✅ Parse OK");
    } else {
        puts("❌ Parse com erros");
    }
    yylex_destroy();
    return rc;
}
