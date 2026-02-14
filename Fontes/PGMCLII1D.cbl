      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PGMCLII1.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
           SPECIAL-NAMES. DECIMAL-POINT IS COMMA.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT CLIENTES ASSIGN TO
           'C:\COBOL\Aulas\Fontes\Arquivo\ARQCLIId.DAT'
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
       77 WS-EXIT            PIC X.
          88 WS-EXIT-OK      VALUE 'F' FALSE 'N'.
       77 WS-FS              PIC 9(02).
          88 WS-FS-OK        VALUE ZEROS.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

           PERFORM P010-INCLUI    THRU P010-FIM UNTIL WS-EXIT-OK

           GOBACK
           .
       P010-INCLUI.

            OPEN I-O CLIENTES

            IF WS-FS EQUAL 35 THEN
               OPEN OUTPUT CLIENTES
            END-IF

            IF NOT WS-FS-OK THEN
               DISPLAY "ERRO CRIAR O ARQUIVO: " WS-FS
               GOBACK
            END-IF

            DISPLAY "INFORME O ID DO CLIENTE: "
            ACCEPT ID-CLI
            DISPLAY "INFORME O NOME DO CLIENTE: "
            ACCEPT NM-CLI

            WRITE REG-CLI
                  INVALID KEY
                     DISPLAY "JA EXISTE CLIENTE COM ESTE ID: " ID-CLI
                  NOT INVALID KEY
                     DISPLAY "CLIENTE CADASTRADO COM SUCESSO"
            END-WRITE

            IF NOT WS-FS-OK THEN
               DISPLAY "ERRO A GRAVAR O CLIENTS."
            END-IF

            DISPLAY "<ENTER> CONTINUAR OU <F> PARA FINALIZAR"
            ACCEPT WS-EXIT

            CLOSE CLIENTES

            IF NOT WS-FS-OK
               DISPLAY "ERRO AO FECHAR O ARQUIVO DE CLIENTES."
            END-IF
            .
       P010-FIM.
       END PROGRAM PGMCLII1.
