      ******************************************************************
      * Author: ANDRE COSTA
      * Date: 30/01/2026
      * Purpose: PROGRAMA DE MENU DE TESTE DA AULA DE HOJE
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PGMMENU02.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77 WS-OPCAO                             PIC 9.

       LINKAGE SECTION.
       01 LK-PARMS.
          03 LK-OPCAO                          PIC 9.

       PROCEDURE DIVISION USING LK-PARMS.

       MAIN-PROCEDURE.

            PERFORM UNTIL WS-OPCAO EQUAL 5
               PERFORM P010-MENU-01            THRU P010-FIM
               PERFORM P020-AVALIA             THRU P020-FIM
            END-PERFORM

            GOBACK
            .
       P010-MENU-01.

               DISPLAY "***********************************************"
               DISPLAY "************ CADASTRO DE CLIENTES *************"
               DISPLAY "******* ESCOLHA UMA DAS OPCOES ABAIXO *********"
               DISPLAY "***********************************************"
               DISPLAY "* 1 - CADSTRAR"
               DISPLAY "* 2 - ATUALIZAR"
               DISPLAY "* 3 - CONSULTAR"
               DISPLAY "* 4 - EXCLUIR"
               DISPLAY "* 5 - SAIR"

               ACCEPT WS-OPCAO
               .
       P010-FIM.
       P020-AVALIA.

            EVALUATE WS-OPCAO
               WHEN 1
                  PERFORM P021-PROCESSA-1      THRU P021-FIM
               WHEN 2
                  PERFORM P022-PROCESSA-2      THRU P022-FIM
               WHEN 3
                  PERFORM P023-PROCESSA-3      THRU P023-FIM
               WHEN 4
                  PERFORM P024-PROCESSA-4      THRU P024-FIM
               WHEN 5
                  PERFORM P025-PROCESSA-5      THRU P025-FIM
               WHEN OTHER
                  PERFORM P026-OTHER           THRU P026-OTHER
            END-EVALUATE
            .
       P020-FIM.
       P021-PROCESSA-1.
            DISPLAY "CADASTRADO. TECLE <ENTER> PARA CONTINUAR."
            ACCEPT WS-OPCAO
            .
       P021-FIM.

       P022-PROCESSA-2.
            DISPLAY "ATUALIZADO. TECLE <ENTER> PARA CONTINUAR."
            ACCEPT WS-OPCAO
            .
       P022-FIM.

       P023-PROCESSA-3.
            DISPLAY "CONSULTADO. TECLE <ENTER> PARA CONTINUAR."
            ACCEPT WS-OPCAO
            .
       P023-FIM.
       P024-PROCESSA-4.
            DISPLAY "EXCLUIDO. TECLE <ENTER> PARA CONTINUAR."
            ACCEPT WS-OPCAO
            .
       P024-FIM.
       P025-PROCESSA-5.
            DISPLAY "TECLE <ENTER> PARA VOLTAR AO MENU PRINCIPAL."
            .
       P025-FIM.
       P026-OTHER.
            DISPLAY "OPCAO INVALIDA. TECLE <ENTER> PARA CONTINUAR."
            ACCEPT WS-OPCAO
            .
       P026-FIM.

       END PROGRAM PGMMENU02.
