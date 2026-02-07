      ******************************************************************
      * Author: ANDRE COSTA
      * Date: 04 FEV 2026
      * Purpose: ATUALIZAR CLIENTES - INDEXADO
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PGMCLII3.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
           SPECIAL-NAMES. DECIMAL-POINT IS COMMA.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT CLIENTES ASSIGN TO
           'C:\COBOL\Aulas\Fontes\Arquivo\ARQCLII.DAT'
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
       77 WS-FS              PIC 9(02)  VALUE ZEROS.
       01 WS-REG-CLI.
          03 WS-ID-CLI      PIC 9(04).
          03 WS-NM-CLI      PIC X(20).


       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

            INITIALIZE  WS-REG-CLI

            OPEN I-O CLIENTES

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
                NOT INVALID KEY
                    PERFORM P010-ATUALIZA THRU P010-FIM
            END-READ

            CLOSE CLIENTES

            IF WS-FS NOT EQUAL ZEROS THEN
               DISPLAY "ERRO AO FECHAR O ARQUIVO DE CLIENTES: " WS-FS
            END-IF

            GOBACK
            .
       P010-ATUALIZA.

            MOVE SPACES            TO WS-NM-CLI

            DISPLAY "NOME ATUAL DO CLIENTE: " ID-CLI " - " NM-CLI
            DISPLAY "INFORME O NOME ATUAL CLIENTE: "
            ACCEPT WS-NM-CLI

            MOVE   WS-NM-CLI       TO NM-CLI

            REWRITE REG-CLI
                    INVALID KEY
                       DISPLAY "CLIENTE JA EXISTE"
                    NOT INVALID KEY
                       DISPLAY "CLIENTE ATUALIZADO COM SUCESSO!"
            END-REWRITE

            IF WS-FS NOT EQUAL ZEROS THEN
               DISPLAY "ERRO AO GRAVAR O ARQUIVO DE CLIENTES: " WS-FS
            END-IF
            .
       P010-FIM.

       END PROGRAM PGMCLII3.
