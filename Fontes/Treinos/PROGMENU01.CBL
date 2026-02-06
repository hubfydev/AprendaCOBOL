           IDENTIFICATION DIVISION.
           PROGRAM-ID. PROGMENU01.

           ENVIRONMENT DIVISION.
           CONFIGURATION SECTION.
           SPECIAL-NAMES.
               DECIMAL-POINT IS COMMA.

           DATA DIVISION.
           WORKING-STORAGE SECTION.
           01  WS-OPCAO              PIC 9     VALUE 0.
           01  WS-SAIR               PIC X     VALUE "N".

           PROCEDURE DIVISION.
           MAIN-PROGRAM.
               PERFORM UNTIL WS-SAIR = "S"
                   PERFORM EXIBIR-MENU
                   PERFORM LER-OPCAO
                   PERFORM PROCESSAR-OPCAO
               END-PERFORM

               DISPLAY "Encerrando o programa. Ate mais!"
               STOP RUN.

           EXIBIR-MENU.
               DISPLAY " "
               DISPLAY "========================================"
               DISPLAY "   MENU - CRUD DE ALUNOS (SIMULACAO)     "
               DISPLAY "========================================"
               DISPLAY " 1) Incluir aluno"
               DISPLAY " 2) Alterar aluno"
               DISPLAY " 3) Excluir aluno"
               DISPLAY " 4) Listar alunos"
               DISPLAY " 0) Sair"
               DISPLAY "----------------------------------------"
               DISPLAY "Escolha uma opcao (0-4): "
               .

           LER-OPCAO.
               ACCEPT WS-OPCAO
               .

           PROCESSAR-OPCAO.
               EVALUATE WS-OPCAO
                   WHEN 1
                       DISPLAY
                   ">> INCLUIR: aqui voce cadastraria um novo aluno."
                       PERFORM PAUSA
                   WHEN 2
                       DISPLAY
                   ">> ALTERAR: aqui voce alteraria os dados."
                       PERFORM PAUSA
               WHEN 3
                       DISPLAY
                   ">> EXCLUIR: aqui voce removeria um aluno."
                       PERFORM PAUSA
               WHEN 4
                       DISPLAY
                   ">> LISTAR: aqui voce exibiria a lista de alunos."
                       PERFORM PAUSA
               WHEN 0
                       MOVE "S" TO WS-SAIR
               WHEN OTHER
                       DISPLAY "!! Opcao invalida. Tente novamente."
                       PERFORM PAUSA
               END-EVALUATE

               .

           PAUSA.
               DISPLAY "Pressione ENTER para voltar ao menu..."
               ACCEPT WS-SAIR FROM CONSOLE
               MOVE "N" TO WS-SAIR
               .
