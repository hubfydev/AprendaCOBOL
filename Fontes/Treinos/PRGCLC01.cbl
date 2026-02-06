       *> ==========================================================
       *> SOMA001.cbl (Subprograma)
       *> - Recebe N1, N2 e devolve RESULT (N1 + N2)
       *> ==========================================================
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PRGCLC01.

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

       DATA DIVISION.
       LINKAGE SECTION.
       01  LK-PARAMS.
           05  LK-N1             PIC S9(9).
           05  LK-N2             PIC S9(9).
           05  LK-RESULT         PIC S9(10).

       PROCEDURE DIVISION USING LK-PARAMS.

       SOMA-PROC.
           COMPUTE LK-RESULT = LK-N1 + LK-N2
           GOBACK.
