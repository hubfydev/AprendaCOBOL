      *--------------------------------------------------------------*
       IDENTIFICATION DIVISION.
      *--------------------------------------------------------------*
       PROGRAM-ID. P390TCA1.
       AUTHOR. ANDRE COSTA.
      *--------------------------------------------------------------*
      * SISTEMA    : CFP - CURSO DE FORMAÇÃO DE PROGRAMADORES.
      * INSTRUTOR  : ANDRE COSTA.
      * ALUNO      :
      * REFERENCIA : JUNHO/2009.
      * OBJETIVO   : CARREGAR DADOS NA TABELA DE UF
      *--------------------------------------------------------------*
       ENVIRONMENT DIVISION.
      *--------------------------------------------------------------*
       CONFIGURATION SECTION.
      *--------------------------------------------------------------*
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.
       INPUT-OUTPUT SECTION.
      *--------------------------------------------------------------*
       FILE-CONTROL.
      *--------------------------------------------------------------*
           SELECT CFP005E1 ASSIGN TO UT-S-CFP005E1.
      *--------------------------------------------------------------*
       DATA DIVISION.
      *--------------------------------------------------------------*
       FILE SECTION.
      *--------------------------------------------------------------*
       FD  CFP005E1
           BLOCK        0
           RECORD     042
           RECORDING  F.
       01  CFP005E1-REG       PIC  X(042).
      *--------------------------------------------------------------*
       WORKING-STORAGE SECTION.
      *--------------------------------------------------------------*
       77  IN-FIM-CFP005E1        PIC  9(001) VALUE ZEROS.
           88 FIM-CFP005E1                    VALUE 1.
       77  CNT-LIDOS-CFP005E1     PIC  9(006) VALUE ZEROS.
       77  CNT-GRAVADOS           PIC  9(006) VALUE ZEROS.
       77  CNT-ATUALIZADOS        PIC  9(006) VALUE ZEROS.
       77  DSP-LIDOS-CFP005E1     PIC ZZZ.ZZ9 VALUE ZEROS.
       77  DSP-GRAVADOS           PIC ZZZ.ZZ9 VALUE ZEROS.
       77  DSP-ATUALIZADOS        PIC ZZZ.ZZ9 VALUE ZEROS.
       77  WS-PARAGRAFO           PIC  X(050) VALUE SPACES.
      ***** AREA DE TRABALHO DO ARQUIVO CFP005E1.
       COPY CFPK0005.
      ***** AREA DE DEFINICAO DO BANCO DE DADOS
           EXEC SQL INCLUDE SQLCA     END-EXEC.
           EXEC SQL INCLUDE CFPK007D  END-EXEC.
      *------------------------------------------------------*
       PROCEDURE DIVISION.
      *------------------------------------------------------*
           PERFORM P0001-INICIAIS
           PERFORM P1000-PRINCIPAIS
           PERFORM P9000-FINAIS
           .
      *------------------------------------------------------*
       P0001-INICIAIS.
      *------------------------------------------------------*
           INITIALIZE  CNT-LIDOS-CFP005E1
                       CNT-GRAVADOS
                       CNT-ATUALIZADOS
           .
      *------------------------------------------------------*
       P1000-PRINCIPAIS.
      *------------------------------------------------------*
           PERFORM P1010-ABRIR-ARQUIVOS
           PERFORM P1020-LER-CFP005E1
           PERFORM UNTIL FIM-CFP005E1
               PERFORM P2000-PROCESSAR-CFP005E1
               PERFORM P1020-LER-CFP005E1
           END-PERFORM
           PERFORM P1030-FECHAR-ARQUIVOS
           .
      *------------------------------------------------------*
       P1010-ABRIR-ARQUIVOS.
      *------------------------------------------------------*
           OPEN INPUT  CFP005E1
           .
      *------------------------------------------------------*
       P1020-LER-CFP005E1.
      *------------------------------------------------------*
           READ CFP005E1 INTO FD005-GR-ARQUIVO
               AT END
                   IF CNT-LIDOS-CFP005E1 EQUAL ZEROS
                      DISPLAY '***********************************'
                      DISPLAY ' ARQUIVO CFP005E1 NAO POSSUI DADOS '
                      DISPLAY '***********************************'
                      GOBACK
                   ELSE
                       MOVE  1  TO IN-FIM-CFP005E1
                   END-IF
               NOT AT END
                   ADD 1 TO CNT-LIDOS-CFP005E1
           END-READ
           .
      *------------------------------------------------------*
       P1030-FECHAR-ARQUIVOS.
      *------------------------------------------------------*
           CLOSE CFP005E1
           .
      *------------------------------------------------------*
       P2000-PROCESSAR-CFP005E1.
      *------------------------------------------------------*
           MOVE 'P2000-PROCESSAR-CFP005E1'
                                 TO WS-PARAGRAFO

           MOVE FD005-SG-UF      TO SG-UF OF CFPK007D

           EXEC SQL
                SELECT
                   DE_UF
                   INTO :CFPK007D.DE-UF
                FROM
                   CFPTB007_UF
                WHERE
                   SG_UF = :CFPK007D.SG-UF
           END-EXEC

           EVALUATE SQLCODE
                WHEN ZEROS
                     PERFORM P2010-ATUALIZA-UF
                WHEN 100
                     PERFORM P2030-INCLUI-UF
                WHEN OTHER
                     PERFORM P8000-TRATA-ERRO-SQL
           END-EVALUATE
           .
      *------------------------------------------------------*
       P2010-ATUALIZA-UF.
      *------------------------------------------------------*
           MOVE 'P2010-ATUALIZA-UF'
                                 TO WS-PARAGRAFO

           MOVE FD005-SG-UF      TO SG-UF OF CFPK007D

           EXEC SQL
                UPDATE CFPTB007_UF
                   SET DE_UF = :CFPK007D.DE-UF
                WHERE
                   SG_UF = :CFPK007D.SG-UF
           END-EXEC

           IF SQLCODE NOT EQUAL ZEROS AND
              SQLCODE NOT EQUAL 100
              PERFORM P8000-TRATA-ERRO-SQL
              IF SQLCODE EQUAL ZEROS
                 ADD 1          TO CNT-ATUALIZADOS
              END-IF
           END-IF
           .
      *------------------------------------------------------*
       P2030-INCLUI-UF.
      *------------------------------------------------------*
           MOVE 'P2030-INCLUI-UF'
                                 TO WS-PARAGRAFO

           MOVE FD005-SG-UF      TO SG-UF OF CFPK007D
           MOVE FD005-DE-UF      TO DE-UF OF CFPK007D

           EXEC SQL
                INSERT INTO CFPTB007_UF
                (SG_UF
                ,DE_UF)
                VALUES
                (:CFPK007D.SG-UF
                ,:CFPK007D.DE-UF)
           END-EXEC

           IF SQLCODE NOT EQUAL ZEROS AND
              SQLCODE NOT EQUAL 100
              PERFORM P8000-TRATA-ERRO-SQL
           ELSE
              IF SQLCODE EQUAL ZEROS
                 ADD 1          TO CNT-GRAVADOS
              END-IF
           END-IF
           .
      *------------------------------------------------------*
       P8000-TRATA-ERRO-SQL.
      *------------------------------------------------------*
           DISPLAY '************************************'
           DISPLAY '* ERRO DE ACESSO AO BANCO DE DADOS *'
           DISPLAY '************************************'
           DISPLAY 'SQLCODE .: ' SQLCODE
           DISPLAY 'SQLERRMC : ' SQLERRMC
           DISPLAY 'PROCEDIMENTO: ' WS-PARAGRAFO
           DISPLAY '************************************'

           EXEC SQL ROLLBACK            END-EXEC
           GOBACK
           .
      *------------------------------------------------------*
       P9000-FINAIS.
      *------------------------------------------------------*
           MOVE CNT-LIDOS-CFP005E1      TO DSP-LIDOS-CFP005E1
           MOVE CNT-GRAVADOS            TO DSP-GRAVADOS
           MOVE CNT-ATUALIZADOS         TO DSP-ATUALIZADOS

           DISPLAY 'NUMERO DE REGISTROS LIDOS...: '
                                           DSP-LIDOS-CFP005E1
           DISPLAY 'NUMERO DE REGISTROS GRAVADOS: '
                                           DSP-GRAVADOS
           DISPLAY 'NUMERO DE REGISTROS ATUALIZADOS: '
                                           DSP-ATUALIZADOS
           GOBACK
           .
      *------------------------------------------------------*
