          *> ==========================================================
          *> MAINCLI.cbl  (Programa principal / interface)
          *> - Lê nome e dois números via ACCEPT
          *> - Chama o programa SOMA001 para calcular a soma
          *> ==========================================================
           IDENTIFICATION DIVISION.
           PROGRAM-ID. PRGPRN01.

           ENVIRONMENT DIVISION.
           CONFIGURATION SECTION.
           SPECIAL-NAMES.
               DECIMAL-POINT IS COMMA.

           DATA DIVISION.
           WORKING-STORAGE SECTION.

           01  WS-NOME              PIC X(40)    VALUE SPACES.

           01  WS-N1                PIC S9(9)    VALUE 0.
           01  WS-N2                PIC S9(9)    VALUE 0.
           01  WS-RESULT            PIC S9(10)   VALUE 0.

           01  WS-PARAMS.
               05  P-N1             PIC S9(9).
               05  P-N2             PIC S9(9).
               05  P-RESULT         PIC S9(10).

           PROCEDURE DIVISION.

           MAIN-START.
               DISPLAY "=============================================="
               DISPLAY "   DEMO - CHAMADA ENTRE PROGRAMAS (COBOL)     "
               DISPLAY "=============================================="
               DISPLAY SPACE

               DISPLAY "Digite seu nome: " WITH NO ADVANCING
               ACCEPT WS-NOME

               DISPLAY SPACE
               DISPLAY "Digite o 1o numero inteiro: " WITH NO ADVANCING
               ACCEPT WS-N1

               DISPLAY "Digite o 2o numero inteiro: " WITH NO ADVANCING
               ACCEPT WS-N2

          *> Monta parâmetros para o programa de soma
              MOVE WS-N1 TO P-N1
              MOVE WS-N2 TO P-N2
              MOVE 0     TO P-RESULT

              CALL "PRGCLC01" USING WS-PARAMS

              MOVE P-RESULT TO WS-RESULT

              DISPLAY SPACE
              DISPLAY "Olá, " FUNCTION TRIM(WS-NOME) "!"
              DISPLAY "A soma de " WS-N1 " + " WS-N2 " = " WS-RESULT

              DISPLAY SPACE
              DISPLAY "Fim. Pressione ENTER para sair..."
              WITH NO ADVANCING
              ACCEPT WS-NOME

           GOBACK.
