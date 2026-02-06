      ******************************************************************
      * Author: ANDRE COSTA
      * Date: 30 DE JAN 2026
      * Purpose: CHAMDAS EM CASCATA
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PGMMENU01.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       77 WS-OPCAO              PIC 9.
       PROCEDURE DIVISION.
      *----------------------------------------------------------------
      *             PROCEDIMENTOS INICIAIS
      *----------------------------------------------------------------
       P001-INICIO.

            PERFORM UNTIL WS-OPCAO EQUAL 4
               PERFORM P010-DISPLAY-MENU      THRU  P010-FIM
               PERFORM P020-VALIDA            THRU  P020-FIM
            END-PERFORM

            GOBACK
            .
       P001-FIM.
      *----------------------------------------------------------------
      *             EXIBE O MENU PRINCIPAL
      *----------------------------------------------------------------
       P010-DISPLAY-MENU.

            DISPLAY "************************************************"
            DISPLAY "*********     SISTEMA DE CLINICA    ************"
            DISPLAY "************************************************"
            DISPLAY "* 1 - CLIENTES"
            DISPLAY "* 2 - FORNECEDORES"
            DISPLAY "* 3 - AGENDA"
            DISPLAY "* 4 - SAIR"
            DISPLAY " "
            DISPLAY "ESCOLHA UMA DAS OPCOES: "

            ACCEPT WS-OPCAO
            .
       P010-FIM.
      *----------------------------------------------------------------
      *             VALIDA AS OPCOES
      *----------------------------------------------------------------
       P020-VALIDA.

            EVALUATE WS-OPCAO
                WHEN 1
                   PERFORM P021-CLIENTES      THRU P021-FIM
               WHEN 2
                   PERFORM P022-FORNECEDORES  THRU P022-FIM
               WHEN 3
                   PERFORM P023-AGENDA        THRU P023-FIM
               WHEN 4
                   PERFORM P024-PROC-FIM      THRU P024-FIM
               WHEN OTHER
                   PERFORM P025-TRATA-ERRO    THRU P025-FIM
            END-EVALUATE
            .
       P020-FIM.
      *----------------------------------------------------------------
      *             FAZ A CHAMADA DO MODULO DE CLIENTES
      *----------------------------------------------------------------
       P021-CLIENTES.

            CALL "PGMCLIENT" USING WS-OPCAO
            ACCEPT WS-OPCAO
            .
       P021-FIM.
      *----------------------------------------------------------------
      *             FAZ A CHAMADA DO MODULO DE FORNECEDORES
      *----------------------------------------------------------------
       P022-FORNECEDORES.

            DISPLAY
            "MODULO FORNECEDORES. TECLE <ENTER> PARA CONTINUAR"
            ACCEPT WS-OPCAO
           .
       P022-FIM.
      *----------------------------------------------------------------
      *             FAZ A CHAMADA DO MODULO DE AGENDA
      *----------------------------------------------------------------
       P023-AGENDA.

            DISPLAY "MODULO AGENDA. TECLE <ENTER> PARA CONTINUAR"
            ACCEPT WS-OPCAO
            .
       P023-FIM.
      *----------------------------------------------------------------
      *             PROCEDIMENTOS FINAIS
      *----------------------------------------------------------------
       P024-PROC-FIM.

            DISPLAY "FIM DO PROCESSAMENTO."
            .
       P024-FIM.
      *----------------------------------------------------------------
      *             FAZ O TRATAMENTO DE ERRO
      *----------------------------------------------------------------
       P025-TRATA-ERRO.

            DISPLAY "OPCAO INVALIDA.  TECLE <ENTER> PARA CONTINUAR"
            ACCEPT WS-OPCAO
            .
       P025-FIM.
       END PROGRAM PGMMENU01.
