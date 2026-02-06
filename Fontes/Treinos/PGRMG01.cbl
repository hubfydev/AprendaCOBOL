      ******************************************************************
      * Author: ANDRE COSTA
      * Date: 15/01/2025
      * Purpose: EXEMPLO DE CAPTURA DE VARIAVEIS DE AMBIENTE
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PGRMG01.
       DATA DIVISION.
       FILE SECTION.
      ******************************************************************
      *               VARIAVEIS DO PROGRAMA                            *
      ******************************************************************
       WORKING-STORAGE SECTION.
       01  WS-DATA    PIC X(06).
       01  REDEFINES WS-DATA.
           03 WS-ANO   PIC 99.
           03 WS-MES   PIC 99.
           03 WS-DIA   PIC 99.

       PROCEDURE DIVISION.
      ******************************************************************
      *               PROCEDIMENTOS INICIAIS                           *
      ******************************************************************
       P001-PROC-INICIAIS.

            ACCEPT WS-DATA FROM DATE
            .
       P001-PROC-FIM.
      ******************************************************************
      *               PROCEDIMENTOS PRINCIPAIS                         *
      ******************************************************************
       P010-PROC-PRINCIPAIS.

            PERFORM P020-PROC-RESULT     THRU P020-PROC-FIM
            PERFORM P099-PROC-FINAIS     THRU P099-PROC-FIM
            GOBACK
            .
       P010-PROC-FIM.
      ******************************************************************
      *               EXIBICAO DO RESULTADO                            *
      ******************************************************************
       P020-PROC-RESULT.

            DISPLAY "Hello world, DATA: "
                    WS-DIA
                     '/'
                    WS-MES
                    '/20'
                    WS-ANO
            .

       P020-PROC-FIM.
      ******************************************************************
      *               PROCEDIMENTOS FINAIS                           *
      ******************************************************************
       P099-PROC-FINAIS.

            DISPLAY 'FIM DO PROGRAMA'
            .
       P099-PROC-FIM.
       END PROGRAM PGRMG01.
