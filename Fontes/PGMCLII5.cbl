      ******************************************************************
      * Author: ANDRE COSTA
      * Date: 04 FEV 2026
      * Purpose: LISTAR CLIENTES - INDEXADO
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PGMCLII5.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
           SPECIAL-NAMES. DECIMAL-POINT IS COMMA.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT CLIENTES ASSIGN TO
           'C:\COBOL\Aulas\Fontes\Arquivo\ARQCLII.DAT'
           ORGANIZATION IS INDEXED
           ACCESS MODE  IS SEQUENTIAL
           RECORD KEY   IS ID-CLI
           FILE STATUS  IS WS-FS.
       DATA DIVISION.
       FILE SECTION.
       FD CLIENTES.
       01 REG-CLI.
          03 ID-CLI          PIC 9(04).
          03 NM-CLI          PIC X(20).

       WORKING-STORAGE SECTION.
       77 WS-EOF             PIC 9.
          88 WS-EOF-OK       VALUE 0 FALSE 1.
       77 WS-FS              PIC 9(02)  VALUE ZEROS.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

           OPEN INPUT CLIENTES

           IF WS-FS EQUAL ZEROS THEN
              SET WS-EOF-OK          TO FALSE
              PERFORM UNTIL WS-EOF-OK
                READ CLIENTES
                    AT END
                       SET WS-EOF-OK     TO TRUE
                NOT AT END
                    DISPLAY ID-CLI " - " NM-CLI
                END-READ
              END-PERFORM
           ELSE
              DISPLAY
              "ERRO NA ABERTURA DO ARQUIVO DE CLIENTES: " WS-FS
           END-IF

            CLOSE CLIENTES

            IF WS-FS NOT EQUAL ZEROS THEN
               DISPLAY "ERRO AO FECHAR O ARQUIVO DE CLIENTES: " WS-FS
            END-IF

            GOBACK
            .
       END PROGRAM PGMCLII5.
