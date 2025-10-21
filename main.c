#include <stdio.h>
#include <stdlib.h>

int yyparse(void);

int main(int argc, char** argv) {
  if (argc > 1) {
    FILE* f = fopen(argv[1], "r");
    if (!f) { perror("[erro] abrindo arquivo"); return 1; }
    fclose(f);
    if (!freopen(argv[1], "r", stdin)) { perror("[erro] freopen"); return 1; }
    fprintf(stderr, "[info] lendo: %s\n", argv[1]);
  } else {
    fprintf(stderr, "[info] lendo de stdin (Ctrl-D para encerrar)\n");
  }
  int rc = yyparse();
  puts(rc == 0 ? "OK: análise léxica e sintática concluídas." : "FALHA: erros na análise.");
  return rc;
}
