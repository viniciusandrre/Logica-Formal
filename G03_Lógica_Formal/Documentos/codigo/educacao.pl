% Base de conhecimento

% Verifica se a lista A é um subconjunto da lista B
subset([], _).
subset([H|T], B) :- member(H, B), subset(T, B).

% Educação dos candidatos
educacao(joao, graduacao). %João tem Graduação
educacao(maria, mestrado). %Maria tem Mestrado
educacao(carlos, ensino_medio). %Carlos tem Ensino Médio

% Experiência dos candidatos (em anos)
experiencia(joao, 2). %João tem 2 anos de experiência
experiencia(maria, 5). %Maria tem 5 anos de experiência
experiencia(carlos, 4). %carlos tem 4 anos de experiência

% Habilidades dos candidatos
habilidades(joao, [programacao, comunicacao]). %Joao possui habilidades em programacao e comunicacao
habilidades(maria, [programacao, lideranca, comunicacao]). %Maria possui habilidades em programacao, lideranca e comunicacao
habilidades(carlos, [vendas, comunicacao]). %Carlos possui habilidades em vendas e comunicacao

% Certificações dos candidatos
certificacoes(joao, [cert_prog_avancada]). %Joao possui cert_prog_avancada
certificacoes(maria, [cert_lideranca]). %Maria possui cert_lideranca
certificacoes(carlos, []). % Carlos nao possui certificacoes

% Histórico criminal (desqualificação automática)
historico_criminal(joao, sim). %Joao nao tem historico_criminal
historico_criminal(maria, nao).% Maria nao tem historico_criminal
historico_criminal(carlos, sim). % Carlos tem historico_criminal

% Requisitos para a posição
requisitos(educacao_minima, graduacao). %Escolaridade mínima é graduação
requisitos(anos_experiencia_minima, 3). %Experiência mínima são de 3 anos
requisitos(habilidades_obrigatorias, [programacao, comunicacao]). %As habilidades obrigatórias são programação ou comuicação

% Certificações que compensam falta de experiência
cert_compensa_experiencia(cert_prog_avancada). %Se não tiver experiência, programação avançado compensa
cert_compensa_experiencia(cert_lideranca). %Se não tiver experiência, certificado em liderança compensa

% Regras de inferência

% Regra: Verifica se o candidato possui a educação mínima
possui_educacao_minima(Candidato) :-
    educacao(Candidato, NivelEducacao), % Recupera o nível de educação candidato.
    requisitos(educacao_minima, EducacaoMinima), %Recupera o nível mínimo de educação exigido
    (NivelEducacao = EducacaoMinima; hierarquia_educacao(NivelEducacao, EducacaoMinima)). %Verifica se o candidato atende 
    %ao requisito exato ou tem um nível hierarquicamente superior

% Hierarquia de níveis de educação
hierarquia_educacao(X, X). % Qualquer nível é igual a si mesmo
hierarquia_educacao(doutorado, mestrado). %Doutorado temuma hierarquia maior que mestrado
hierarquia_educacao(mestrado, graduacao). %Mestrado tem uma hierarquia maior que graduação
hierarquia_educacao(graduacao, ensino_medio). %Graduação tem hierarquia maior que ensino médio
hierarquia_educacao(ensino_medio, ensino_fundamental). %Ensino médio tem hierarquia maior que o esnino fundamental

% Regra: Verifica se o candidato tem experiência suficiente ou compensação por certificação
possui_experiencia_suficiente(Candidato) :-
    experiencia(Candidato, Anos),%Recupera os anos de experiência candidato
    requisitos(anos_experiencia_minima, Minimo), %Recupera o mínimo de anos de experiência exigidos
    Anos >= Minimo. %Verifica se o candidato possui pelo menos o número mínimo de anos de experiência
possui_experiencia_suficiente(Candidato) :-
    certificacoes(Candidato, Certs), %Recupera a lista de certificações candidato
    member(Cert, Certs), % Verifica se o candidato possui alguma certificação na lista
    cert_compensa_experiencia(Cert). %Determina se a certificação pode compensar a falta de experiência

% Regra: Verifica se o candidato possui todas as habilidades obrigatórias
possui_habilidades_obrigatorias(Candidato) :-
    habilidades(Candidato, Habs), % Recupera as habilidades candidato
    requisitos(habilidades_obrigatorias, HabsObrigatorias), %Recupera a lista de habilidades obrigatórias exigidas
    subset(HabsObrigatorias, Habs). %Verifica se todas as habilidades obrigatórias estão presentes nas habilidades candidato

% Regra: Verifica se o candidato não possui histórico criminal
sem_historico_criminal(Candidato) :-
    historico_criminal(Candidato, nao).

% Regra principal: Determina se o candidato é elegível
elegivel(Candidato) :-
    possui_educacao_minima(Candidato), %Educacao minima
    possui_experiencia_suficiente(Candidato), %Experiecia suficiente
    possui_habilidades_obrigatorias(Candidato), %Habilidades Obrigatoriaas
    sem_historico_criminal(Candidato). %Sem historico criminal

% Função principal para listar candidatos elegíveis
:- initialization(main).

main :-
    write('Candidatos elegiveis:'), nl,
    setof(Candidato, elegivel(Candidato), Candidatos),
    (   Candidatos \= []
    ->  forall(member(Candidato, Candidatos), (write('- '), write(Candidato), nl))
    ;   write('Nenhum candidato é elegível.'), nl),
    halt.
