      ******************************************************************
      * Author: ANDRE COSTA
      * Date: 04 FEV 2026
      * Purpose: CONSULTAR CLIENTES - INDEXADO
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PGMCLII2.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
           SPECIAL-NAMES. DECIMAL-POINT IS COMMA.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT CLIENTES ASSIGN TO
           'C:\COBOL\Aulas\Fontes\Treinos\ARQUIVOS\ARQCLII.DAT'
           ORGANIZATION IS INDEXED
           ACCESS MODE  IS RANDOM
           RECORD KEY   IS ID-CLI
           FILE STATUS  IS WS-FS.
       DATA DIVISION.
       FILE SECTION.
       FD CLIENTES.
       01 REG-CLI.
          03 ID-CLI          PIC 9(04).
          03 NM-CLI          PIC X(20).

       WORKING-STORAGE SECTION.
       77 WS-ID-CLI          PIC 9(04)  VALUE ZEROS.
       77 WS-FS              PIC 9(02)  VALUE ZEROS.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

           OPEN INPUT CLIENTES

           IF WS-FS NOT EQUAL ZEROS THEN
              DISPLAY
              "ERRO NA ABERTURA DO ARQUIVO DE CLIENTES: " WS-FS
              GOBACK
           END-IF

           DISPLAY "INFORME O ID DO CLIENTE: "
           ACCEPT ID-CLI

           READ CLIENTES KEY IS ID-CLI
                INVALID KEY
                   DISPLAY "CLIENTE NAO ENCONTRADO."
                   CLOSE CLIENTES
                   IF WS-FS NOT EQUAL ZEROS THEN
                      DISPLAY "ERRO AO FECHAR O ARQUIVO DE CLIENTES: "
                      WS-FS
                   END-IF
                NOT INVALID KEY
                   DISPLAY ID-CLI " - " NM-CLI
                   CLOSE CLIENTES
                   IF WS-FS NOT EQUAL ZEROS THEN
                      DISPLAY
                      "ERRO AO FECHAR O ARQUIVO DE CLIENTES: "
                      WS-FS
                   END-IF
           END-READ

           GOBACK
           .
       END PROGRAM PGMCLII2.
