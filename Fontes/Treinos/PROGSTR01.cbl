      ******************************************************************
      * Author: ANDRE COSTA
      * Date: 30 DE JAN 2026
      * Purpose: DEMOSNTRACAO DE TRABALHOS COM STRINGS
      *          STRING, UNSTRING E INSPECT
      ******************************************************************
       IDENTIFICATION DIVISION.

       PROGRAM-ID. PROGSTR01.

       DATA DIVISION.

       FILE SECTION.

       WORKING-STORAGE SECTION.

       77 WS-STRING-01         PIC X(20)  VALUE "ANDRE    COSTA      ".
       77 WS-STRING-02         PIC X(20)  VALUE "ANDRE;RICHEST;COSTA;".
       77 WS-NOME-COMPLETO     PIC X(20).

       01 WS-INDICES.
          03 WS-POINT          PIC 99.
          03 WS-CNT-1          PIC 99.
          03 WS-CNT-2          PIC 99.

       01 WS-CLIENTE.
          03 WS-NOME           PIC X(10).
          03 WS-SOBRE-NOME     PIC X(10).

       PROCEDURE DIVISION.

       MAIN-PROCEDURE.

             MOVE ZEROS  TO WS-INDICES
             MOVE 1      TO WS-POINT

             UNSTRING WS-STRING-01 DELIMITED BY ALL SPACES
                 INTO WS-NOME        COUNT IN WS-CNT-1
                      WS-SOBRE-NOME  COUNT IN WS-CNT-2
                 WITH POINTER WS-POINT
                 ON OVERFLOW
                    DISPLAY "ERRO DE CAMPOS."
                 NOT OVERFLOW
                    DISPLAY "NOME DO CLIENTE: " WS-CLIENTE
             END-UNSTRING

             MOVE SPACES TO WS-NOME-COMPLETO

             STRING
                  WS-NOME(1:WS-CNT-1)
                  WS-SOBRE-NOME(1:WS-CNT-2 + 1)
                  DELIMITED BY SIZE INTO WS-NOME-COMPLETO
             END-STRING

             DISPLAY "VERSAO 01: " WS-NOME-COMPLETO

             STRING
                  WS-NOME(01:05)
                  " "
                  WS-SOBRE-NOME(01:05)
                  DELIMITED BY SIZE INTO WS-NOME-COMPLETO
             END-STRING

             DISPLAY "VERSAO 02: " WS-NOME-COMPLETO


             MOVE SPACES TO WS-NOME-COMPLETO

             STRING
                  WS-NOME
                  WS-SOBRE-NOME
                  DELIMITED BY SIZE INTO WS-NOME-COMPLETO
             END-STRING

             DISPLAY "VERSAO 03: " WS-NOME-COMPLETO

             MOVE ZEROS   TO WS-INDICES

      ******** O LOOP "FOR" DO COBOL
             PERFORM VARYING WS-CNT-1 FROM 1 BY 1
                UNTIL WS-CNT-1 > LENGTH OF WS-NOME-COMPLETO
                      IF WS-NOME-COMPLETO(WS-CNT-1:1) EQUAL SPACES
                         PERFORM VARYING WS-CNT-2 FROM 1 BY 1
                            UNTIL WS-CNT-2 > (LENGTH OF
                                              WS-NOME-COMPLETO -
                                              WS-CNT-1)
                            IF WS-NOME-COMPLETO(WS-CNT-2:1) NOT EQUAL
                                SPACES
                                  STRING
                                    WS-NOME-COMPLETO(1:WS-CNT-1)
                                    WS-NOME-COMPLETO(WS-CNT-1:
                                                     LENGTH OF
                                                     WS-NOME-COMPLETO -
                                                     WS-CNT-1)
                                 DELIMITED BY SIZE INTO
                                 WS-NOME-COMPLETO
                                 END-STRING
                                 MOVE LENGTH OF WS-NOME-COMPLETO TO
                                                WS-CNT-1
                                                WS-CNT-2
                           END-IF
                         END-PERFORM
                      END-IF
             END-PERFORM

             DISPLAY "VERSAO 04: " WS-NOME-COMPLETO

             MOVE ZEROS   TO WS-INDICES

      ******* CONTANDO QUANTOS CARACTERES ";" TEM NA WS-STRING-02:
             INSPECT WS-STRING-02
                TALLYING WS-POINT FOR ALL ";"

             DISPLAY "A WS-STRING-02 TEM " WS-POINT " CARACTERES ';'"

      ******* TROCANDO O DELIMITADOR ";" POR ESPAÇOS

             DISPLAY "COMO ESTAVA A WS-STRING-02: " WS-STRING-02

             INSPECT WS-STRING-02
                REPLACING ALL ";" BY SPACE

             DISPLAY "COMO FICOU A WS-STRING-02: " WS-STRING-02

            GOBACK
            .
       END PROGRAM PROGSTR01.
