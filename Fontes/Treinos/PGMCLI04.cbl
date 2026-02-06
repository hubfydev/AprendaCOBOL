      ******************************************************************
      * Author: ANDRE COSTA
      * Date: 04 FEV 2026
      * Purpose: EXCLUI CLIENTES
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PGMCLI04.
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
       77 WS-EOF             PIC A      VALUE SPACES.
       77 WS-FS              PIC 9(02)  VALUE ZEROS.
       01 WS-REG-CLI.
          03 WS-ID-CLI      PIC 9(04).
          03 WS-NM-CLI      PIC X(20).


       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

            OPEN I-O CLIENTES

            IF WS-FS NOT EQUAL ZEROS THEN
              DISPLAY
              "ERRO NA ABERTURA DO ARQUIVO DE CLIENTES: " WS-FS
              GOBACK
            END-IF

            DISPLAY "INFORME O ID DO CLIENTE: "
            ACCEPT WS-ID-CLI

            PERFORM UNTIL WS-EOF EQUAL "F"
              READ CLIENTES
                AT END
                   DISPLAY "CLIENTE NAO ENCONTRADO."
                   CLOSE CLIENTES
                   IF WS-FS NOT EQUAL ZEROS THEN
                      DISPLAY "ERRO AO FECHAR O ARQUIVO DE CLIENTES: "
                      WS-FS
                   END-IF
                   MOVE 'F'   TO WS-EOF
                NOT AT END
                   IF ID-CLI EQUAL WS-ID-CLI THEN
                      DISPLAY "EXCLUIR O CLIENTE: " ID-CLI " - " NM-CLI
                      DISPLAY "CONFIRMA? <S/N>"
                      ACCEPT WS-NM-CLI
                      IF WS-NM-CLI EQUAL "S" OR
                         WS-NM-CLI EQUAL "s" THEN
                         PERFORM P010-EXCLUI THRU P010-FIM
                      ELSE
                         DISPLAY "REGISTRO NAO EXCLUIDO!"
                         CLOSE CLIENTES
                         IF WS-FS NOT EQUAL ZEROS THEN
                            DISPLAY
                            "ERRO AO FECHAR O ARQUIVO DE CLIENTES: "
                             WS-FS
                         END-IF
                         MOVE 'F'   TO WS-EOF
                      END-IF
                   END-IF
              END-READ
            END-PERFORM

            GOBACK
            .
       P010-EXCLUI.

            MOVE   ZEROS                        TO ID-CLI
            MOVE   "********************"       TO NM-CLI

            REWRITE REG-CLI

            IF WS-FS EQUAL ZEROS THEN
               DISPLAY "CLIENTE EXCLUIDO COM SUCESSO!"
            ELSE
               DISPLAY "ERRO AO EXCLUIR O CLIENTE: " WS-FS
            END-IF

            CLOSE CLIENTES

            IF WS-FS NOT EQUAL ZEROS THEN
               DISPLAY "ERRO AO FECHAR O ARQUIVO DE CLIENTES: " WS-FS
            END-IF

            MOVE 'F'   TO WS-EOF
            .
       P010-FIM.

       END PROGRAM PGMCLI04.
