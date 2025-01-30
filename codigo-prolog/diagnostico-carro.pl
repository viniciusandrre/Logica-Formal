% Fatos para cada caso de teste
% Caso 1: Problema na bateria ou alternador
fato(carro1, carro_liga, nao).
fato(carro1, barulho_no_motor, nao).
fato(carro1, carro_superaquecendo, nao).
fato(carro1, luz_do_painel_acesa, sim).
fato(carro1, freios_ruins, nao).

% Caso 2: Risco de dano ao motor
fato(carro2, carro_liga, sim).
fato(carro2, barulho_no_motor, sim).
fato(carro2, carro_superaquecendo, sim).
fato(carro2, luz_do_painel_acesa, nao).
fato(carro2, freios_ruins, nao).

% Caso 3: Desgaste nas pastilhas de freio
fato(carro3, carro_liga, sim).
fato(carro3, barulho_no_motor, nao).
fato(carro3, carro_superaquecendo, nao).
fato(carro3, luz_do_painel_acesa, nao).
fato(carro3, freios_ruins, sim).

% Regras de diagnostico
problema_bateria_ou_alternador(Carro) :-
    fato(Carro, carro_liga, nao),
    fato(Carro, luz_do_painel_acesa, sim).

problema_ignicao_ou_motor_de_partida(Carro) :-
    fato(Carro, carro_liga, nao),
    fato(Carro, luz_do_painel_acesa, nao).

risco_dano_motor(Carro) :-
    fato(Carro, barulho_no_motor, sim),
    fato(Carro, carro_superaquecendo, sim).

problema_falta_lubrificacao(Carro) :-
    fato(Carro, barulho_no_motor, sim),
    fato(Carro, carro_superaquecendo, nao).

problema_sistema_arrefecimento(Carro) :-
    fato(Carro, carro_superaquecendo, sim).

problema_diagnostico_eletronico(Carro) :-
    fato(Carro, luz_do_painel_acesa, sim).

desgaste_pastilhas_freio(Carro) :-
    fato(Carro, freios_ruins, sim).

sem_diagnostico(Carro) :-
    \+ problema_bateria_ou_alternador(Carro),
    \+ problema_ignicao_ou_motor_de_partida(Carro),
    \+ risco_dano_motor(Carro),
    \+ problema_falta_lubrificacao(Carro),
    \+ problema_sistema_arrefecimento(Carro),
    \+ problema_diagnostico_eletronico(Carro),
    \+ desgaste_pastilhas_freio(Carro).

% Diagnostico para um carro especifico
diagnostico(Carro) :-
    write('Diagnostico para '), write(Carro), write(':'), nl, nl,
    (problema_bateria_ou_alternador(Carro) ->
        write('  O carro pode estar apresentando problemas na bateria ou no alternador. Verifique os cabos e a carga da bateria.'), nl
    ; problema_ignicao_ou_motor_de_partida(Carro) ->
        write('  Verifique o sistema de ignicao do carro ou o motor de partida.'), nl
    ; true),
    (risco_dano_motor(Carro) ->
        write('  Pode haver risco de dano ao motor. Por favor, verifique o nivel de oleo e o sistema de arrefecimento imediatamente.'), nl
    ; problema_falta_lubrificacao(Carro) ->
        write('  E possivel que haja pecas soltas ou falta de lubrificacao. Verifique o oleo e o estado do motor.'), nl
    ; true),
    (problema_sistema_arrefecimento(Carro) ->
        write('  O sistema de arrefecimento pode estar com problema. Verifique o radiador, ventoinha e liquido de arrefecimento.'), nl
    ; true),
    (problema_diagnostico_eletronico(Carro) ->
        write('  Consulte o manual do veiculo ou leve o carro para um diagnostico eletronico.'), nl
    ; true),
    (desgaste_pastilhas_freio(Carro) ->
        write('  Pode haver desgaste nas pastilhas ou nos discos de freio. Faca uma revisao no sistema de freios.'), nl
    ; true),
    (sem_diagnostico(Carro) ->
        write('  Nao foi possivel identificar o problema. Consulte um mecanico especializado.'), nl
    ; true).

% Ponto de entrada do programa
:- initialization(main).

% Funcao principal para executar os diagnosticos
main :-
    diagnostico(carro1), nl,
    diagnostico(carro2), nl,
    diagnostico(carro3).