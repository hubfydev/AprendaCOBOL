      ******************************************************************
      * Author: ANDRE COSTA
      * Date: 04 FEV 2026
      * Purpose: LISTAR CLIENTES
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PGMCLI05.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
           SPECIAL-NAMES. DECIMAL-POINT IS COMMA.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT CLIENTES ASSIGN TO
           'C:\COBOL\Aulas\Fontes\Arquivo\ARQCLI.DAT'
           ORGANIZATION IS SEQUENTIAL
           ACCESS MODE  IS SEQUENTIAL
           FILE STATUS  IS WS-FS.
       DATA DIVISION.
       FILE SECTION.
       FD CLIENTES.
       01 REG-CLI.
          03 ID-CLI          PIC 9(04).
          03 NM-CLI          PIC X(20).

       WORKING-STORAGE SECTION.
       77 WS-EOF             PIC A      VALUE SPACES.
       77 WS-FS              PIC 9(02)  VALUE ZEROS.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

           OPEN INPUT CLIENTES

           IF WS-FS NOT EQUAL ZEROS THEN
              DISPLAY
              "ERRO NA ABERTURA DO ARQUIVO DE CLIENTES: " WS-FS
              GOBACK
           END-IF

           PERFORM UNTIL WS-EOF EQUAL "F"
              READ CLIENTES
                AT END
                   CLOSE CLIENTES
                   IF WS-FS NOT EQUAL ZEROS THEN
                      DISPLAY "ERRO AO FECHAR O ARQUIVO DE CLIENTES: "
                      WS-FS
                   END-IF
                   MOVE 'F'   TO WS-EOF
                NOT AT END
                   IF ID-CLI NOT EQUAL ZEROS THEN
                      DISPLAY ID-CLI " - " NM-CLI
                   END-IF
              END-READ
           END-PERFORM

           GOBACK
           .
       END PROGRAM PGMCLI05.
