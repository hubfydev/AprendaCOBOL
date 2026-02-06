      ******************************************************************
      * Author: ANDRE COSTA
      * Date: 13/01/2026
      * Purpose: EXEMPLO DE COMANDOS COBOL
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROGEX01.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01  WS-DADOS.
           03 WS-NOME.
              05 WS-PRIMO-NOME   PIC X(10) VALUE SPACES.
              05 WS-SOBRE-NOME   PIC X(10) VALUE SPACES.
           03 WS-PARMS.
              05 WS-RESULT       PIC 9(04) VALUE ZEROS.
              05 WS-N1           PIC 9(03) VALUE ZEROS.
              05 WS-N2           PIC 9(03) VALUE ZEROS.
       PROCEDURE DIVISION.
       P001-INICIO.
            DISPLAY "INFORME O PRIMEIRO NOME: "
            ACCEPT WS-PRIMO-NOME
            DISPLAY "INFORME O SOBRE NOME: "
            ACCEPT WS-SOBRE-NOME
            DISPLAY "INFORME O PRIMEIRO NUMERO: "
            ACCEPT WS-N1
            DISPLAY "INFORME O SEGUNDO NUMERO: "
            ACCEPT WS-N2

            CALL "PRGEX02" USING WS-PARMS

            DISPLAY "O RESULTADO DA SOMA EH: " WS-RESULT
            DISPLAY WS-PRIMO-NOME " " WS-SOBRE-NOME
            GOBACK.
