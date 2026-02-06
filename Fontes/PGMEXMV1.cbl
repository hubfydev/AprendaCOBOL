      ******************************************************************
      * Author: ANDRE COSTA
      * Date: 28/01/2026
      * Purpose: EXEMPLOS DO COMANDO MOVE
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PGMEXMV1.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 WS-LAYOUT-1.
          03 WS-OPCAO        PIC 9.
          03 WS-RESULTADO    PIC 9(04).
          03 WS-VLR-1        PIC 9(02).
          03 WS-VLR-2        PIC 9(02).
          03 WS-VLR-3        PIC 9(02).
       01 WS-LAYOUT-2.
          03 WS-OPCAO        PIC 9.
          03 WS-RESULTADO    PIC 9(04).
          03 WS-VLR-1        PIC 9(02).
          03 WS-VLR-2        PIC 9(02).
          03 WS-VLR-33       PIC 9(02).
       77 WS-NOME            PIC X(30).
       77 WS-NOME-DISP       PIC X(10).
       77 WS-SAIDA           PIC X(01).

       PROCEDURE DIVISION.
      ******************************************************************
      *          INICIALIZA AS VARIAVEIS DO PROGRAMA
      ******************************************************************
       P010-PROC-INICIAIS.

            MOVE ZEROS       TO WS-LAYOUT-1
                                WS-LAYOUT-2

            MOVE SPACES      TO WS-NOME
                                WS-NOME-DISP
                                WS-SAIDA



            MOVE "N"           TO WS-SAIDA

            PERFORM UNTIL WS-SAIDA EQUAL "S"
               PERFORM P022-TESTA-OPCAO-2 THRU P022-FIM
               PERFORM P020-MOVIMENTO     THRU P020-FIM
            END-PERFORM

            PERFORM P090-PROC-FINAIS      THRU P090-FIM
            .
       P010-FIM.
      ******************************************************************
      *          PROCEDIMENTOS DE MOVIMENTACAO DE VARIAVEIS
      ******************************************************************
       P020-MOVIMENTO.

            DISPLAY "A OPCAO ESCOLHIDA FOI: " WS-OPCAO OF WS-LAYOUT-2
            DISPLAY "DIGITE <S> PARA SAIR OU <ENTER> PARA CONTINUAR"

            ACCEPT WS-SAIDA

            IF WS-SAIDA EQUAL "s" OR WS-SAIDA EQUAL "S" THEN
               MOVE "S"    TO WS-SAIDA
            END-IF

            .
       P020-FIM.
      ******************************************************************
      *          TESTA AS OPCOES
      ******************************************************************
       P021-TESTA-OPCAO.

            IF WS-OPCAO OF WS-LAYOUT-1 EQUAL 1 THEN
               MOVE 1           TO WS-VLR-1 OF WS-LAYOUT-1
            ELSE
               IF WS-OPCAO  OF WS-LAYOUT-1 EQUAL 2 THEN
                  MOVE 2        TO WS-VLR-1 OF WS-LAYOUT-1
               ELSE
                  IF WS-OPCAO  OF WS-LAYOUT-1 EQUAL 3 THEN
                     MOVE 3     TO WS-VLR-1 OF WS-LAYOUT-1
                  ELSE
                     DISPLAY "OPCAO INVALIDA"
                  END-IF
               END-IF
            END-IF
            .
       P021-FIM.
      ******************************************************************
      *          TESTA AS OPCOES
      ******************************************************************
       P022-TESTA-OPCAO-2.

            DISPLAY "DIGITE UMA OPÇÃO: "
            DISPLAY "1 - CADASTRO"
            DISPLAY "2 - CONSULTA"
            DISPLAY "3 - ENVIO"

            ACCEPT WS-OPCAO OF WS-LAYOUT-1

            EVALUATE WS-OPCAO OF WS-LAYOUT-1
               WHEN 1
                  MOVE 1 TO WS-VLR-1  OF WS-LAYOUT-1
               WHEN 2
                  MOVE 2 TO WS-VLR-1  OF WS-LAYOUT-1
               WHEN 3
                  MOVE 3 TO WS-VLR-1  OF WS-LAYOUT-1
               WHEN OTHER
                  DISPLAY "OPCAO INVALIDA"
            END-EVALUATE

            MOVE WS-OPCAO OF WS-LAYOUT-1  TO
                 WS-OPCAO OF WS-LAYOUT-2
            .
       P022-FIM.
      ******************************************************************
      *          PROCEDIMENTOS PRINCIPAIS DO PROGRAMA
      ******************************************************************
       P030-PROCESSAMENTO.

            DISPLAY "WS-OPCAO....: " WS-OPCAO      OF WS-LAYOUT-2
            DISPLAY "WS-RESULTADO: " WS-RESULTADO  OF WS-LAYOUT-2
            DISPLAY "WS-VLR-1....: " WS-VLR-1      OF WS-LAYOUT-2
            DISPLAY "WS-VLR-2....: " WS-VLR-2      OF WS-LAYOUT-2
            DISPLAY "WS-VLR-33...: " WS-VLR-33     OF WS-LAYOUT-2
            DISPLAY "WS-NOME-DISP: " WS-NOME-DISP
            .
       P030-FIM.
      ******************************************************************
      *          PROCEDIMENTOS FINAIS DO PROGRAMA
      ******************************************************************
       P090-PROC-FINAIS.

            GOBACK
            .
       P090-FIM.
       END PROGRAM PGMEXMV1.
