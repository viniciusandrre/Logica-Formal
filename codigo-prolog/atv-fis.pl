% Fatos para cada pessoa
% Pessoa 1: Maria (apta para atividade física)
fato(maria, cansaco, nao).
fato(maria, dor_de_cabeca, nao).
fato(maria, febre, nao).
fato(maria, tempo_livre, sim).
fato(maria, fez_atividade_fisica, nao).
fato(maria, estresse, nao).
fato(maria, comeu_bem, sim).

% Pessoa 2: João (precisa descansar)
fato(joao, cansaco, sim).
fato(joao, dor_de_cabeca, nao).
fato(joao, febre, nao).
fato(joao, tempo_livre, sim).
fato(joao, fez_atividade_fisica, nao).
fato(joao, estresse, nao).
fato(joao, comeu_bem, sim).

% Pessoa 3: Ana (com sintomas de febre ou dor de cabeça)
fato(ana, cansaco, nao).
fato(ana, dor_de_cabeca, sim).
fato(ana, febre, sim).
fato(ana, tempo_livre, nao).
fato(ana, fez_atividade_fisica, nao).
fato(ana, estresse, nao).
fato(ana, comeu_bem, nao).

% Regras lógicas
apta_atividade_fisica(Pessoa) :-
    fato(Pessoa, cansaco, nao),
    fato(Pessoa, dor_de_cabeca, nao),
    fato(Pessoa, febre, nao),
    fato(Pessoa, tempo_livre, sim),
    fato(Pessoa, comeu_bem, sim).

precisa_descansar(Pessoa) :-
    fato(Pessoa, cansaco, sim),
    fato(Pessoa, fez_atividade_fisica, nao).

sintomas_febre_ou_dor(Pessoa) :-
    fato(Pessoa, dor_de_cabeca, sim);
    fato(Pessoa, febre, sim).

estressada_com_tempo(Pessoa) :-
    fato(Pessoa, estresse, sim),
    fato(Pessoa, tempo_livre, sim).

baixa_energia_sem_tempo(Pessoa) :-
    fato(Pessoa, tempo_livre, nao),
    fato(Pessoa, comeu_bem, nao).

% Diagnóstico para uma pessoa específica
diagnostico(Pessoa) :-
    (apta_atividade_fisica(Pessoa) ->
        format("Diagnostico para ~w: Voce esta apta para realizar atividades fisicas. Aproveite seu tempo livre para se exercitar~n", [Pessoa])
    ; precisa_descansar(Pessoa) ->
        format("Diagnostico para ~w: Voce esta cansada e nao fez atividade fisica. E recomendavel que voce descanse.~n", [Pessoa])
    ; sintomas_febre_ou_dor(Pessoa) ->
        format("Diagnostico para ~w: Voce esta com dor de cabeca ou febre. Considere descansar e se cuidar.~n", [Pessoa])
    ; estressada_com_tempo(Pessoa) ->
        format("Diagnostico para ~w: Voce esta estressada, mas tem tempo livre. Talvez seja uma boa ideia relaxar ou fazer algo que te distraia.~n", [Pessoa])
    ; baixa_energia_sem_tempo(Pessoa) ->
        format("Diagnostico para ~w: Voce esta sem tempo livre e nao se alimentou bem recentemente. Tente descansar e comer algo saudavel quando possivel.~n", [Pessoa])
    ; format("Diagnostico para ~w: Nao foi possivel determinar seu estado de saude. Considere procurar orientacao medica ou descansar.~n", [Pessoa])).

% Ponto de entrada do programa
:- initialization(main).

% Função principal para executar os diagnósticos
main :-
    diagnostico(maria), nl,
    diagnostico(joao), nl,
    diagnostico(ana).