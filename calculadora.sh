#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'
IYELLOW='\033[1;33m'
BWhite='\033[1;37m'

log(){
    echo -e "${IYELLOW}$(date +'%Y-%m-%d %H:%M:%S')" "==> Calculadora: $1${NC}"
}

log_err(){
    echo -e "${RED}$(date +'%Y-%m-%d %H:%M:%S')" "==> Error: $1${NC}"
}

menu(){

    clear
    log "Inicializando Sistema ..."
    sleep 2
    echo -e "${GREEN}==================================================${NC}"
    echo -e "${GREEN}           CALCULADORA EM SHELLSCRIPT             ${NC}"
    echo -e "${GREEN}           😎 Author: Leonardo Viana              ${NC}"
    echo -e "${GREEN}==================================================${NC}"
    echo -e "${IYELLOW}[  1  ] 🔸 Somar ${NC}"
    echo -e "${IYELLOW}[  2  ] 🔸 Subtração ${NC}"
    echo -e "${IYELLOW}[  3  ] 🔸 Multiplicação ${NC}"
    echo -e "${IYELLOW}[  4  ] 🔸 Divisão ${NC}"
    echo -e "${IYELLOW}[  0  ] 🔸 Sair ${NC}"
    echo -e "${GREEN}==================================================${NC}"
    echo -e "${BWhite}Escolha uma das opções acima:  ${NC}"; read OPCAO
    echo -e "${BWhite}Opção informada ($OPCAO)${NC}"
    echo "=================================================="

    case $OPCAO in 
        1) soma;
        echo "==================================================";;
        2) subtracao
        echo "==================================================";;
        3) multiplicacao
        echo "==================================================";;
        4) divisao
        echo "==================================================";;
        0) log "Finalizando Sistema"
           echo "=================================================="
           sleep 5
           exit;;

    esac
}

soma(){
    clear
    echo "Digite o primeiro número: "
    read N1
    echo "Digite o segundo número: "
    read N2
    SOMA=$(($N1 + $N2))
    echo -e "${BWhite}----------------------------------------${NC}"
    echo "Resultado da soma: $SOMA"
    echo -e "${BWhite}----------------------------------------${NC}"
    sleep 5
    
    echo -e "${GREEN}==================================================${NC}"
    echo -e "${GREEN} O que desaja fazer agora?${NC}"
    echo -e "${GREEN}==================================================${NC}"
    echo -e "${IYELLOW}[  1  ] 🔸 Continuar ${NC}"
    echo -e "${IYELLOW}[  2  ] 🔸 Menu principal ${NC}"
    echo -e "${IYELLOW}[  3  ] 🔸 Sair ${NC}"
    echo -e "${GREEN}==================================================${NC}"
    echo -e "${BWhite}Escolha uma das opções acima:  ${NC}"; read OPCAO
    echo -e "${BWhite}Opção informada ($OPCAO)${NC}"
    echo "=================================================="

    if [[ $OPCAO == 1 ]]; then
        soma
    elif [[ $OPCAO == 2 ]]; then
        menu
    elif [[ $OPCAO == 3 ]]; then
        log "Finalizando Sistema"
        sleep 5
        exit
    else 
        log_err "Opção inválida"
        sleep 5
        menu
    fi
}

subtracao(){
    clear
    echo "Digite o primeiro número: "
    read N1
    echo "Digite o segundo número: "
    read N2
    SUBTRACAO=$(($N1 - $N2))
    echo -e "${BWhite}----------------------------------------${NC}"
    echo "Resultado da subtração: $SUBTRACAO"
    echo -e "${BWhite}----------------------------------------${NC}"
    sleep 5

    echo -e "${GREEN}==================================================${NC}"
    echo -e "${GREEN} O que desaja fazer agora?${NC}"
    echo -e "${GREEN}==================================================${NC}"
    echo -e "${IYELLOW}[  1  ] 🔸 Continuar ${NC}"
    echo -e "${IYELLOW}[  2  ] 🔸 Menu principal ${NC}"
    echo -e "${IYELLOW}[  3  ] 🔸 Sair ${NC}"
    echo -e "${GREEN}==================================================${NC}"
    echo -e "${BWhite}Escolha uma das opções acima:  ${NC}"; read OPCAO
    echo -e "${BWhite}Opção informada ($OPCAO)${NC}"
    echo "=================================================="

    if [[ $OPCAO == 1 ]]; then
        subtracao
    elif [[ $OPCAO == 2 ]]; then
        menu
    elif [[ $OPCAO == 3 ]]; then
        log "Finalizando Sistema"
        sleep 5
        exit
    else 
        log_err "Opção inválida"
        sleep 5
        menu
    fi
}

multiplicacao(){
    clear
    echo "Digite o primeiro número: "
    read N1
    echo "Digite o segundo número: "
    read N2
    MULTIPLICACAO=$(($N1 * $N2))
    echo -e "${BWhite}----------------------------------------${NC}"
    echo "Resultado da multiplicação: $MULTIPLICACAO"
    echo -e "${BWhite}----------------------------------------${NC}"
    sleep 5

    echo -e "${GREEN}==================================================${NC}"
    echo -e "${GREEN} O que desaja fazer agora?${NC}"
    echo -e "${GREEN}==================================================${NC}"
    echo -e "${IYELLOW}[  1  ] 🔸 Continuar ${NC}"
    echo -e "${IYELLOW}[  2  ] 🔸 Menu principal ${NC}"
    echo -e "${IYELLOW}[  3  ] 🔸 Sair ${NC}"
    echo -e "${GREEN}==================================================${NC}"
    echo -e "${BWhite}Escolha uma das opções acima:  ${NC}"; read OPCAO
    echo -e "${BWhite}Opção informada ($OPCAO)${NC}"
    echo "=================================================="

    if [[ $OPCAO == 1 ]]; then
        multiplicacao
    elif [[ $OPCAO == 2 ]]; then
        menu
    elif [[ $OPCAO == 3 ]]; then
        log "Finalizando Sistema"
        sleep 5
        exit
    else 
        log_err "Opção inválida"
        sleep 5
        menu
    fi
}

divisao(){
    clear
    echo "Digite o primeiro número: "
    read N1
    echo "Digite o segundo número: "
    read N2
    DIVISAO=$(($N1 / $N2))
    echo -e "${BWhite}----------------------------------------${NC}"
    echo "Resultado da divisão: $DIVISAO"
    echo -e "${BWhite}----------------------------------------${NC}"
    sleep 5

    echo -e "${GREEN}==================================================${NC}"
    echo -e "${GREEN} O que desaja fazer agora?${NC}"
    echo -e "${GREEN}==================================================${NC}"
    echo -e "${IYELLOW}[  1  ] 🔸 Continuar ${NC}"
    echo -e "${IYELLOW}[  2  ] 🔸 Menu principal ${NC}"
    echo -e "${IYELLOW}[  3  ] 🔸 Sair ${NC}"
    echo -e "${GREEN}==================================================${NC}"
    echo -e "${BWhite}Escolha uma das opções acima:  ${NC}"; read OPCAO
    echo -e "${BWhite}Opção informada ($OPCAO)${NC}"
    echo "=================================================="

    if [[ $OPCAO == 1 ]]; then
        divisao
    elif [[ $OPCAO == 2 ]]; then
        menu
    elif [[ $OPCAO == 3 ]]; then
        log "Finalizando Sistema"
        sleep 5
        exit
    else 
        log_err "Opção inválida"
        sleep 5
        menu
    fi
}

menu