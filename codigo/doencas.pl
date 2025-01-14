sintoma(ana, febre).  
sintoma(ana, tosse).  
sintoma(ana, coriza).
sintoma(ana, dor_de_cabeca).

doenca(gripe) :- sintoma(_, febre), sintoma(_, tosse), sintoma(_, dor_de_cabeca), sintoma(_, coriza).  
doenca(resfriado) :- sintoma(_, febre), sintoma(_, dor_de_cabeca), sintoma(_, coriza).  
doenca(estresse) :- sintoma(_, dor_de_cabeca).

% Inicialização
:- initialization(main).

main :- 
    (doenca(gripe) ->
        write('Ana tem gripe.'), nl 
    ; 
    (doenca(resfriado) -> 
        write('Ana tem resfriado.'), nl 
    ; 
    (doenca(estresse) -> 
        write('Ana tem estresse.'), nl 
    ; 
        write('Ana não tem nenhuma doença conhecida.'), nl
    ))).