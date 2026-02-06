      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PRGEX02.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       LINKAGE SECTION.
       01 LK-PARMS.
          03 WS-RESULT       PIC 9(04) VALUE ZEROS.
          03 WS-N1           PIC 9(03) VALUE ZEROS.
          03 WS-N2           PIC 9(03) VALUE ZEROS.
       PROCEDURE DIVISION USING LK-PARMS.
       PROC-CALCULA.
            DISPLAY "VAI CALCULAR NO PROGRAMA CHAMADO (PROGEX02)..."
            COMPUTE WS-RESULT = WS-N1 + WS-N2
            DISPLAY "CALCULO REALIZADO COM SUCESSO!"
            GOBACK.
      *      STOP RUN.
