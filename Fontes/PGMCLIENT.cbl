      ******************************************************************
      * Author: ANDRE COSTA
      * Date: 30 DE JAN 2026
      * Purpose: CHAMDAS CRUD DE CLIENTES
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PGMCLIENT.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       77 WS-OPCAO              PIC 9.
       LINKAGE SECTION.
       01 LK-PARMS.
          03 LK-OPCAO              PIC 9.
       PROCEDURE DIVISION USING LK-PARMS.

       MAIN-PROCEDURE.

            PERFORM UNTIL WS-OPCAO EQUAL 5
               PERFORM P010-DISPLAY-MENU      THRU  P010-FIM
               PERFORM P020-VALIDA            THRU  P020-FIM
            END-PERFORM

            GOBACK
            .
       P010-DISPLAY-MENU.

            DISPLAY "************************************************"
            DISPLAY "*********     SISTEMA DE CLINICA    ************"
            DISPLAY "************************************************"
            DISPLAY "*********     MODULO DE CLIENTES    ************"
            DISPLAY "************************************************"
            DISPLAY "* 1 - INCLUIR"
            DISPLAY "* 2 - ATUALIZAR"
            DISPLAY "* 3 - CONSULTAR"
            DISPLAY "* 4 - EXCLUIR"
            DISPLAY "* 5 - VOLTAR"
            DISPLAY " "
            DISPLAY "ESCOLHA UMA DAS OPCOES: "

            ACCEPT WS-OPCAO
            .
       P010-FIM.

       P020-VALIDA.

            EVALUATE WS-OPCAO
                WHEN 1
                   PERFORM P021-INCLUSAO      THRU P021-FIM
               WHEN 2
                   PERFORM P022-ALTERACAO     THRU P022-FIM
               WHEN 3
                   PERFORM P023-CONSULTA      THRU P023-FIM
               WHEN 4
                   PERFORM P024-EXCLUSAO      THRU P024-FIM
               WHEN 5
                   PERFORM P025-PROC-FIM      THRU P025-FIM
               WHEN OTHER
                   PERFORM P026-TRATA-ERRO    THRU P026-FIM
            END-EVALUATE
            .
       P020-FIM.
       P021-INCLUSAO.

      *      DISPLAY "CHAMAR INCLUSAO. TECLE <ENTER> PARA CONTINUAR"
      *      ACCEPT WS-OPCAO
             CALL "PGMCLI01"
            .
       P021-FIM.
       P022-ALTERACAO.

            DISPLAY
            "CHAMAR ALTERACAO. TECLE <ENTER> PARA CONTINUAR"
            ACCEPT WS-OPCAO
           .
       P022-FIM.
       P023-CONSULTA.

            DISPLAY "CHAMAR CONSULTA. TECLE <ENTER> PARA CONTINUAR"
            ACCEPT WS-OPCAO
            .
       P023-FIM.
       P024-EXCLUSAO.

            DISPLAY "CHAMAR EXCLUSAO. TECLE <ENTER> PARA CONTINUAR"
            ACCEPT WS-OPCAO
            .
       P024-FIM.
       P025-PROC-FIM.

            DISPLAY "TECLE <ENTER> PARA VOLTAR AO MENU PRINCIPAL."
            .
       P025-FIM.
       P026-TRATA-ERRO.

            DISPLAY "OPCAO INVALIDA.  TECLE <ENTER> PARA CONTINUAR"
            ACCEPT WS-OPCAO
            .
       P026-FIM.
       END PROGRAM PGMCLIENT.
