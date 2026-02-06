      *--------------------------------------------------------------*
       IDENTIFICATION DIVISION.
      *--------------------------------------------------------------*
       PROGRAM-ID. P390TCA2.
       AUTHOR. ANDRE COSTA.
      *--------------------------------------------------------------*
      * SISTEMA    : CFP - CURSO DE FORMAÇÃO DE PROGRAMADORES.
      * INSTRUTOR  : ANDRE COSTA.
      * ALUNO      :
      * REFERENCIA : JUNHO/2009.
      * OBJETIVO   : GERAR ARQUIVO DE CLIENTE DA TABELA
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
           SELECT CFP001S1 ASSIGN TO UT-S-CFP001S1.
      *--------------------------------------------------------------*
       DATA DIVISION.
      *--------------------------------------------------------------*
       FILE SECTION.
      *--------------------------------------------------------------*
       FD  CFP001S1
           BLOCK        0
           RECORD     132
           RECORDING   F.
       01  CFP001S1-REG       PIC  X(132).
      *--------------------------------------------------------------*
       WORKING-STORAGE SECTION.
      *--------------------------------------------------------------*
       77  IN-EOF                 PIC  9(001) VALUE ZEROS.
           88 EOF                             VALUE 1.
       77  CNT-LIDOS-CFPTB001     PIC  9(006) VALUE ZEROS.
       77  CNT-GRAVADOS           PIC  9(006) VALUE ZEROS.
       77  CNT-ATUALIZADOS        PIC  9(006) VALUE ZEROS.
       77  DSP-LIDOS-CFPTB001     PIC ZZZ.ZZ9 VALUE ZEROS.
       77  DSP-GRAVADOS           PIC ZZZ.ZZ9 VALUE ZEROS.
       77  WS-PARAGRAFO           PIC  X(050) VALUE SPACES.
      ***** AREA DE TRABALHO DO ARQUIVO CFP001S1.
       COPY CFPK0001.
      ***** AREA DE DEFINICAO DO BANCO DE DADOS
           EXEC SQL INCLUDE SQLCA     END-EXEC.
           EXEC SQL INCLUDE CFPK001D  END-EXEC.
      ***** AREA DE DECLARACAO DE CURSOR
           EXEC SQL
                DECLARE C001 CURSOR FOR
                SELECT
                    NO_CLIENTE
                   ,DT_NASCIMENTO
                   ,VALUE(NO_ENDERECO, ' ')
                   ,VALUE(NO_BAIRRO, ' ')
                   ,SG_UF_007
                FROM CFPTB001_CLIENTE
                ORDER BY NO_CLIENTE
           END-EXEC.
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
           INITIALIZE  CNT-LIDOS-CFPTB001
                       CNT-GRAVADOS
           .
      *------------------------------------------------------*
       P1000-PRINCIPAIS.
      *------------------------------------------------------*
           PERFORM 1010-ABRIR-ARQUIVOS
           PERFORM P1020-LER-CFPTB001
           PERFORM UNTIL EOF
               PERFORM P2000-PROCESSAR-CFPTB001
               PERFORM P1020-LER-CFPTB001
           END-PERFORM
           PERFORM P1030-FECHAR-ARQUIVOS
           .
      *------------------------------------------------------*
       1010-ABRIR-ARQUIVOS.
      *------------------------------------------------------*
           OPEN OUTPUT CFP001S1
           EXEC SQL    OPEN C001         END-EXEC
           .
      *------------------------------------------------------*
       P1020-LER-CFPTB001.
      *------------------------------------------------------*
           INITIALIZE            CFPK001D

           EXEC SQL
               FETCH C001
                   INTO :CFPK001D.DT-NASCIMENTO
                       ,:CFPK001D.NO-ENDERECO
                       ,:CFPK001D.NO-BAIRRO
                       ,:CFPK001D.SG-UF-007
           END-EXEC
           .
      *------------------------------------------------------*
       P1030-FECHAR-ARQUIVOS.
      *------------------------------------------------------*
           CLOSE CFP001S1
           EXEC SQL   CLOSE C001         END-EXEC
           .
      *------------------------------------------------------*
       P2000-PROCESSAR-CFPTB001.
      *------------------------------------------------------*
           MOVE 'P2000-PROCESSAR-CFPTB001'
                                 TO WS-PARAGRAFO

           EVALUATE SQLCODE
                WHEN ZEROS
                     PERFORM P2010-CARREGA-ARQCLI
                WHEN 100
                     PERFORM P2030-TESTA-FIM
                WHEN OTHER
                     PERFORM P8000-TRATA-ERRO-SQL
           END-EVALUATE
           .
      *------------------------------------------------------*
       P2010-CARREGA-ARQCLI.
      *------------------------------------------------------*
           MOVE 'P2010-CARREGA-ARQCLI'
                                 TO WS-PARAGRAFO

           INITIALIZE            K0001-REGISTRO

           ADD 1                 TO CNT-LIDOS-CFPTB001

           MOVE NO-CLIENTE       OF CFPK001D
                                 TO K0001-NM-CLIENTE
           MOVE DT-NASCIMENTO    OF CFPK001D
                                 TO K0001-DT-NASC
           MOVE NO-ENDERECO      OF CFPK001D
                                 TO K0001-ENDERECO
           MOVE NO-BAIRRO        OF CFPK001D
                                 TO K0001-BAIRRO
           MOVE SG-UF-007        OF CFPK001D
                                 TO K0001-SG-UF

           WRITE CFP001S1-REG    FROM K0001-REGISTRO END-WRITE

           ADD 1                 TO CNT-GRAVADOS
           .
      *------------------------------------------------------*
       P2030-TESTA-FIM.
      *------------------------------------------------------*
           MOVE 'P2030-TESTA-FIM'
                                 TO WS-PARAGRAFO

           IF  CNT-LIDOS-CFPTB001    EQUAL ZEROS
               PERFORM P7000-TRATA-ERRO-VAZIO
           ELSE
               MOVE  1           TO IN-EOF
           END-IF
           .
      *------------------------------------------------------*
       P7000-TRATA-ERRO-VAZIO.
      *------------------------------------------------------*
           DISPLAY '****************************************'
           DISPLAY '*  TABELA DE CLIENTE NAO POSSUI DADOS  *'
           DISPLAY '****************************************'

           MOVE  1               TO IN-EOF

           GOBACK
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

           MOVE  8               TO RETURN-CODE

           GOBACK
           .
      *------------------------------------------------------*
       P9000-FINAIS.
      *------------------------------------------------------*
           MOVE CNT-LIDOS-CFPTB001      TO DSP-LIDOS-CFPTB001
           MOVE CNT-GRAVADOS            TO DSP-GRAVADOS

           DISPLAY 'NUMERO DE REGISTROS LIDOS NA TABELA CFPTB001....: '
                                           DSP-LIDOS-CFPTB001
           DISPLAY 'NUMERO DE REGISTROS GRAVADOS NO ARQUIVO DE SAIDA: '
                                           DSP-GRAVADOS
           GOBACK
           .
      *------------------------------------------------------*
