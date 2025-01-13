def diagnostico_carro():
    '''
    Sistema especializado em analisar e dar o diagnóstico de um carro.
    Utilizando lógica formal e funções separadas.
    '''
    print("Bem-vindo ao Sistema de Diagnóstico de Carro\n")
    print("Responda as perguntas com 'sim' ou 'nao'\n")

    # Perguntas e Respostas
    carro_liga = input("O carro liga? ") == "nao"
    barulho_no_motor = input("Notou barulhos estranhos no motor? ") == "sim"
    carro_superaquecendo = input("O carro está superaquecendo? ") == "sim"
    luz_do_painel_acesa = input("Alguma luz de advertência aparece no painel? ") == "sim"
    freios_ruins = input("Os freios estão com péssimo funcionamento ou com barulho? ") == "sim"

    # Funções de proposições (lógica formal)
    def problema_bateria_ou_alternador():
        return carro_liga and luz_do_painel_acesa

    def problema_ignicao_ou_motor_de_partida():
        return carro_liga and not luz_do_painel_acesa

    def risco_dano_motor():
        return barulho_no_motor and carro_superaquecendo

    def problema_falta_lubrificacao():
        return barulho_no_motor and not carro_superaquecendo

    def problema_sistema_arrefecimento():
        return carro_superaquecendo

    def problema_diagnostico_eletronico():
        return luz_do_painel_acesa

    def desgaste_pastilhas_freio():
        return freios_ruins

    def sem_diagnostico():
        return not (problema_bateria_ou_alternador() or problema_ignicao_ou_motor_de_partida() or
                    risco_dano_motor() or problema_falta_lubrificacao() or problema_sistema_arrefecimento() or
                    problema_diagnostico_eletronico() or desgaste_pastilhas_freio())

    # Diagnóstico baseado nas regras lógicas
    print("\n Diagnóstico:\n")

    if problema_bateria_ou_alternador():
        print("- O carro pode estar apresentando problemas na bateria ou no alternador. Verifique os cabos e a carga da bateria.\n")
    elif problema_ignicao_ou_motor_de_partida():
        print("- Verifique o sistema de ignição do carro ou o motor de partida.\n")
    
    if risco_dano_motor():
        print("- Pode haver risco de dano ao motor. Por favor, verifique o nível de óleo e o sistema de arrefecimento imediatamente.\n")
    elif problema_falta_lubrificacao():
        print("- É possível que haja peças soltas ou falta de lubrificação. Verifique o óleo e o estado do motor.\n")
    
    if problema_sistema_arrefecimento():
        print("- O sistema de arrefecimento pode estar com problema. Verifique o radiador, ventoinha e líquido de arrefecimento.\n")
    
    if problema_diagnostico_eletronico():
        print("- Consulte o manual do veículo ou leve o carro para um diagnóstico eletrônico.\n")
    
    if desgaste_pastilhas_freio():
        print("- Pode haver desgaste nas pastilhas ou nos discos de freio. Faça uma revisão no sistema de freios.\n")
    
    if sem_diagnostico():
        print("- Não foi possível identificar o problema. Consulte um mecânico especializado.\n")

# Executar o programa
diagnostico_carro()





