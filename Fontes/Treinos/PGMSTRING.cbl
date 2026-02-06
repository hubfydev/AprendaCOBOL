      ******************************************************************
      * Author: ANDRE COSTA
      * Date: 30 DE JAN DE 2026
      * Purpose: TRABALHAR COM STRING
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PGMSTRING.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       77 WS-REG-01                   PIC X(48) VALUE
          "0001;JOAO DA SILVA;9999-9999;JOAOSILVA@EMAIL.COM".
      *    123456789012345678901234567890123456789012345678
       77 WS-REG-02                   PIC X(48).
       01 WS-LT-01.
          03 WS-ID                    PIC X(04).
          03 WS-NOME                  PIC X(13).
          03 WS-TEL                   PIC X(09).
          03 WS-EMAIL                 PIC X(19).
       01 WS-INDICES.
          03 WS-CT-1                  PIC 9(02).
          03 WS-CT-2                  PIC 9(02).
          03 WS-CT-3                  PIC 9(02).
          03 WS-CT-4                  PIC 9(02).
          03 WS-POINT                 PIC 9(02).
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

            MOVE ZEROS  TO WS-INDICES
            MOVE 1      TO WS-POINT

            UNSTRING WS-REG-01 DELIMITED BY ALL ";"
               INTO WS-ID      COUNT IN WS-CT-1
                    WS-NOME    COUNT IN WS-CT-2
                    WS-TEL     COUNT IN WS-CT-3
                    WS-EMAIL   COUNT IN WS-CT-4
               WITH POINTER WS-POINT
               ON OVERFLOW
                  DISPLAY "ERRO NA QUEBRA DA STRING."
               NOT OVERFLOW
                  DISPLAY "WS-ID...: " WS-ID    " TAMANHO: " WS-CT-1
                  DISPLAY "WS-NOME.: " WS-NOME  " TAMANHO: " WS-CT-2
                  DISPLAY "WS-TEL..: " WS-TEL   " TAMANHO: " WS-CT-3
                  DISPLAY "WS-EMAIL: " WS-EMAIL " TAMANHO: " WS-CT-4
            END-UNSTRING

            MOVE "0012"         TO WS-ID

            DISPLAY "REG-02: " WS-REG-02

            STRING
                WS-ID
                ";"
                WS-NOME
                ";"
                WS-TEL
                ";"
                WS-EMAIL
            DELIMITED BY SIZE INTO WS-REG-02
            END-STRING

            DISPLAY "REG-02 MONTADO: " WS-REG-02

            GOBACK
            .
       END PROGRAM PGMSTRING.
