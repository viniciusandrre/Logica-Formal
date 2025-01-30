% Definicao de fatos
pai(joao, maria).
pai(joao, jose).
pai(carlos, ana).

mae(maria, ana).
mae(maria, pedro).

% Definicao de regras
filho(X, Y) :- pai(Y, X).
filho(X, Y) :- mae(Y, X).

% Consultas possiveis:
% ?- pai(joao, maria).
% ?- filho(ana, maria).
% ?- mae(maria, X).

% Inicializacao
:- initialization(main).

main :-
    % Realiza a consulta e exibe o resultado
    (pai(joao, maria) ->
        write('Joao e pai de Maria: Sim.')
    ;
        write('Joao e pai de Maria: Nao.')),
    nl,  % Adiciona uma nova linha para melhor formatação

    (mae(maria, pedro) ->
        write('Maria e mae de Pedro: Sim.')
    ;
        write('Maria e mae de Pedro: Nao.')),
    nl.  % Adiciona uma nova linha para melhor formatação
        