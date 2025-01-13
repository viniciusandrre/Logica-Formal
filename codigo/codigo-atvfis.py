def diagnostico_atividade_fisica():
    '''
    Diagnóstico formal de aptidão para atividade física e a necessidade de descanso baseado em múltiplos fatores lógicos.
    Utilizando lógica formal para a análise de condições.
    '''
    print("Bem-vindo ao Sistema de Diagnóstico de Aptidão para Atividade Física\n")
    print("Responda as perguntas com 'sim' ou 'nao'\n")

    # Funções lógicas representando as proposições
    def cansaco():
        return input("Você está cansada? ") == "sim"

    def dor_de_cabeca():
        return input("Você tem dor de cabeça? ") == "sim"

    def febre():
        return input("Você está com febre? ") == "sim"

    def tempo_livre():
        return input("Você tem tempo livre? ") == "sim"

    def fez_atividade_fisica():
        return input("Você já fez atividade física hoje? ") == "sim"

    def estresse():
        return input("Você está estressada? ") == "sim"

    def comeu_bem():
        return input("Você comeu bem recentemente? ") == "sim"

    # Atribuindo proposições
    P1 = cansaco()
    P2 = dor_de_cabeca()
    P3 = febre()
    P4 = tempo_livre()
    P5 = fez_atividade_fisica()
    P6 = estresse()
    P7 = comeu_bem()

    # Lógica Formal:
    # P1 = Está com cansaço
    # P2 = Tem dor de cabeça
    # P3 = Está com febre
    # P4 = Tem tempo livre
    # P5 = Já fez atividade física
    # P6 = Está com estresse
    # P7 = Comeu bem recentemente

    # 1. Pessoa apta para atividade física (P1 = não e P2 = não e P3 = não e P4 = sim e P7 = sim)
    apta_atividade_fisica = not P1 and not P2 and not P3 and P4 and P7

    # 2. Pessoa precisa descansar (P1 = sim e P5 = não)
    precisa_descansar = P1 and not P5

    # 3. Pessoa com sintomas de febre ou dor de cabeça (P2 = sim ou P3 = sim)
    sintomas_febre_ou_dor = P2 or P3

    # 4. Pessoa estressada, mas com tempo livre (P6 = sim e P4 = sim)
    estressada_com_tempo = P6 and P4

    # 5. Pessoa com baixa energia e sem tempo livre (não P4 e não P7)
    baixa_energia_sem_tempo = not P4 and not P7

    # Diagnóstico baseado nas regras lógicas
    print("\n Diagnóstico:")
    
    if apta_atividade_fisica:
        print("- Você está apta para realizar atividades físicas. Aproveite seu tempo livre para se exercitar!")
    elif precisa_descansar:
        print("- Você está cansada e não fez atividade física. É recomendável que você descanse.")
    elif sintomas_febre_ou_dor:
        print("- Você está com dor de cabeça ou febre. Considere descansar e se cuidar.")
    elif estressada_com_tempo:
        print("- Você está estressada, mas tem tempo livre. Talvez seja uma boa ideia relaxar ou fazer algo que te distraia.")
    elif baixa_energia_sem_tempo:
        print("- Você está sem tempo livre e não se alimentou bem recentemente. Tente descansar e comer algo saudável quando possível.")
    else:
        print("- Não foi possível determinar seu estado de saúde. Considere procurar orientação médica ou descansar.")

# Executar o programa
diagnostico_atividade_fisica()

