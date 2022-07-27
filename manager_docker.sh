#!/bin/bash

# -eq >> Equal
# -ne >> Not equal
# -lt >>> Less than
# -le >>> Less than or equal
# -gt >>> Greater than
# -ge >> Greater than or equal

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'
IYELLOW='\033[1;33m'
BWhite='\033[1;37m'
x="False"

# set -eu -o pipefail

# Forçar o script ser utilizado com user rootDiferença de EUID para UID?
if [[ ${EUID} -ne 0 ]]; then
    echo "Esse script deve ser executado como root." > /dev/stderr
    exit 1
fi

# Logs
function log() {
  echo -e "${IYELLOW}$(date +'%Y-%m-%dT%H:%M:%S')" "==> Manager Docker: $1${NC}"
}

menu(){

while true $x != "False"
do
log " 🟢 SISTEMA INICIALIZANDO ..."
# sleep 5
echo -e "${GREEN}==================================================${NC}"
echo -e "${GREEN}               Docker Manager                     ${NC}"
echo -e "${GREEN}            -  Leonardo Viana  -                  ${NC}"
echo -e "${GREEN}==================================================${NC}"
echo -e "${IYELLOW}1 - Verificar versão do docker ${NC}"
echo -e "${IYELLOW}2 - Listar containers em execução ${NC}"
echo -e "${IYELLOW}3 - Listar imagens ${NC}"
echo -e "${IYELLOW}4 - Listar volumes ${NC}"
echo -e "${IYELLOW}5 - Listar networks ${NC}"
echo -e "${IYELLOW}6 - Remover todos os containers ${NC}"
echo -e "${IYELLOW}7 - Remover todas as imagens ${NC}"
echo -e "${IYELLOW}8 - Remover todas os volumes ${NC}"
echo -e "${IYELLOW}9 - Remover todas os networks ${NC}"
echo -e "${IYELLOW}10 - Criar containers para exemplo ${NC}"
echo -e "${IYELLOW}0 - Sair ${NC}"
echo -e "${GREEN}==================================================${NC}"
echo -e "${BWhite}Escolha uma das opções acima:  ${NC}"
read x
echo -e "${BWhite}Opção informada ($x)${NC}"
echo "=================================================="



case "$x" in
    1)
        echo -e "${RED}Verificar versão do docker ${NC}"
        log "Verificar versão do docker "
        docker --version
        sleep 5

echo "=================================================="
;;
    2)
        echo -e "${RED}Listando os containers em execução ${NC}"
        log "Listando os containers em execução"
        docker container ls
        sleep 5

echo "=================================================="
;;
    3)
        echo -e "${RED}Listando as imagens ${NC}"
        log "Listando as imagens"
        docker images ls
        sleep 5

echo "=================================================="
;;
    4)
        echo -e "${RED}Listando os volumes ${NC}"
        log "Listando os volumes"
        docker volume ls
        sleep 5

echo "=================================================="
;;
    5)
        echo -e "${RED}Listando os networks ${NC}"
        log "Listando os networks"
        docker network ls
        sleep 5

echo "=================================================="
;;
    6)
        echo -e "${RED}Limpando todos os containers ${NC}"
        log "Limpando todos os containers"
        docker container rm -f $(docker ps -aq)
        sleep 5

echo "=================================================="
;;
    7)
        echo -e "${RED}Limpand todas as imagens... ${NC}"
        log "Limpand todas as imagens..."
        docker image rmi -f $(docker images -aq)
        sleep 5

echo "=================================================="
;;
    8)
        echo -e "${RED}Limpand todos os volumes... ${NC}"
        log "Limpand todos os volumes..."
        docker volume rm $(docker volume ls -q)
        sleep 5

echo "=================================================="
;;
    9)
        echo -e "${RED}Limpand todos os networks... ${NC}"
        log "Limpand todos os networks..."
        docker network rm $(docker network ls -q)
        sleep 5

echo "=================================================="
;;
    10)
        echo -e "${RED}Criando containers para teste... ${NC}"
        log "Criando containers ..."
        echo " Infome o nome para o container: "; read Name
        echo " Informe o nome da imagem base a ser utilizada: "; read ImageBase
        echo -e "${GREEN}==================================================${NC}"
        echo -e "${BWhite}Será necessário acessar o serviço via web?  ${NC}"
        echo -e "${GREEN}==================================================${NC}"
        echo -e "${IYELLOW}1 - Não ${NC}"
        echo -e "${IYELLOW}2 - Sim ${NC}"
        echo -e "${GREEN}==================================================${NC}"
        echo -e "${BWhite}Escolha uma das opções acima:  ${NC}"; read ACESSO

        # Estrutura condicional para validar se a opção digitada é número ou letra
        # Utilização de regex para validar se a opção digitada é um número
        if [[ ${ACESSO} =~ ([0-9]+)$ ]]; then
            echo -e "${BWhite}Opção informada: ${ACESSO}${NC}"
            # Verificando se o número digitado está dentro das opções
            if [[ ${ACESSO} -gt 2 ]]; then
                echo -e "${RED} Número ${ACESSO} fora do escopo definido, tente novamente.${NC}"
                log "Número ${ACESSO} fora do escopo definido, tente novamente. ..."
                sleep 5
            # Verificando se o número digitado está dentro das opções
            elif [[ ${ACESSO} -lt 1 ]]; then
                echo -e "${RED} Número ${ACESSO} fora do escopo definido, tente novamente.${NC}"
                log "Número ${ACESSO} fora do escopo definido, tente novamente. ..."
                sleep 5
            else
                echo -e "${BWhite} Número dentro do escopo definido.${NC}"  
                # Utilizando estrutura case para executar a ação de cada opção
                case "$ACESSO" in
                    1)
                        echo -e "${RED}Crinado container ${Name} baseado na imagem ${ImageBase} ... ${NC}"
                        # Criando o container
                        docker container run --name ${Name} -d ${ImageBase} >/dev/null 2>&1
                        # Pegando o nome do container e porta
                        docker container ls --format "{{.Names}}:  {{.Ports}}" | grep ${Name} | awk -F  ":::" '{print $1}' | awk -F ":" '{OFS="\t";print $1,$3}'
                        sleep 5
                echo "=================================================="
                ;;
                    2)
                        echo -e "${RED}Crinado container ${Name} baseado na imagem ${ImageBase} com acesso web ... ${NC}"
                        # Criando o container
                        docker container run -P --name ${Name} -d ${ImageBase} >/dev/null 2>&1
                        # Pegando o nome do container e porta
                        docker container ls --format "{{.Names}}:  {{.Ports}}" | grep ${Name} | awk -F  ":::" '{print $1}' | awk -F ":" '{OFS="\t";print $1,$3}'
                        # Pegando a porta para acesso externo do container e atribuindo em uma variável
                        PORT=`docker container ls --format "{{.Names}}:  {{.Ports}}" | grep ${Name} | awk -F  ":" '{print $3}' | awk -F "-" '{print $1}' `
                        # Passando a url para acesso via web ao serviço
                        echo -e "${BWhite}http://localhost:${PORT}${NC}"
                        sleep 5
                echo "=================================================="
                ;;
                esac
            fi

        # Utilização de regex para validar se a opção digitada é um alphanumérico
        elif [[ ${ACESSO} =~ ^([[:alpha:]]+)$ ]];then
            echo -e "${RED}Você digitou a letra ${ACESSO}, deve-se digitar algum dos números das opções: 1 ou 2. ${NC}"
            log "Você digitou a letra ${ACESSO}, deve-se digita algum dos números das opções ..."
            sleep 5
        else
            echo -e "${RED}Opção ${ACESSO} não definida.${NC}"
            log "Opção ${ACESSO} não definida, tente novamente ..."
            sleep 5
        fi

echo "=================================================="
;;
    0)
        echo -e "${RED}Saindo ...${NC}"
        log "🔴 SISTEMA SENDO FINALIZADO..."
        sleep 5
        clear;
        exit;

echo "================================================"
;;

*)
esac
done

}
menu