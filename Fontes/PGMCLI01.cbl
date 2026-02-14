      ******************************************************************
      * Author: ANDRE COSTA
      * Date: 04 FEV 2026
      * Purpose: INCLUIR CLIENTES
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PGMCLI01.
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
       77 WS-EXIT            PIC X.
          88 WS-EXIT-OK      VALUE 'F' FALSE 'N'.
       77 WS-FS              PIC 9(02).
          88 WS-FS-OK        VALUE ZEROS.
       LINKAGE SECTION.
       01 LK-PARM.
          03 LK-OPCAO        PIC X.

       PROCEDURE DIVISION USING LK-PARM.
       MAIN-PROCEDURE.

           PERFORM P010-INCLUI    THRU P010-FIM UNTIL WS-EXIT-OK

           GOBACK
           .
       P010-INCLUI.

            OPEN EXTEND CLIENTES

            IF WS-FS EQUAL 35
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

            IF WS-FS-OK
               DISPLAY "CLIENTE CADASTRADO COM SUCESSO"
            ELSE
               DISPLAY "ERRO AO GRAVAR O CLIENTE: " WS-FS
            END-IF

            DISPLAY "<ENTER> CONTINUAR OU <F> PARA FINALIZAR"
            ACCEPT WS-EXIT

            CLOSE CLIENTES

            IF NOT WS-FS-OK
               DISPLAY "ERRO AO FECHAR O ARQUIVO DE CLIENTES."
            END-IF
            .
       P010-FIM.
       END PROGRAM PGMCLI01.
