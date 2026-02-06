      ******************************************************************
      * Author: ANDRE COSTA
      * Date: 04 FEV 2026
      * Purpose: EXCLUI CLIENTES - INDEXADO
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PGMCLII4.
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
       77 WS-FS              PIC 9(02)  VALUE ZEROS.
       01 WS-REG-CLI.
          03 WS-ID-CLI      PIC 9(04).
          03 WS-NM-CLI      PIC X(20).


       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

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
                   CLOSE CLIENTES
                   IF WS-FS NOT EQUAL ZEROS THEN
                      DISPLAY "ERRO AO FECHAR O ARQUIVO DE CLIENTES: "
                      WS-FS
                   END-IF
                NOT INVALID KEY
                    DISPLAY "EXCLUIR O CLIENTE: " ID-CLI " - " NM-CLI
                    DISPLAY "CONFIRMA? <S/N>"
                    ACCEPT WS-NM-CLI
                    IF WS-NM-CLI EQUAL "S" OR
                       WS-NM-CLI EQUAL "s" THEN
                       PERFORM P010-EXCLUI THRU P010-FIM
                    ELSE
                       DISPLAY "REGISTRO NAO EXCLUIDO!"
                   END-IF
            END-READ

            CLOSE CLIENTES
            IF WS-FS NOT EQUAL ZEROS THEN
               DISPLAY "ERRO AO FECHAR O ARQUIVO DE CLIENTES: " WS-FS
            END-IF

            GOBACK
            .
       P010-EXCLUI.

            DELETE CLIENTES RECORD

            IF WS-FS EQUAL ZEROS THEN
               DISPLAY "CLIENTE EXCLUIDO COM SUCESSO!"
            ELSE
               DISPLAY "ERRO AO EXCLUIR O CLIENTE: " WS-FS
            END-IF
            .
       P010-FIM.

       END PROGRAM PGMCLII4.
