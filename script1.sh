#!/bin/bash 

# RESULTADO=$(curl -i 'http://www.google.com' | grep HTTP)
# echo $RESULTADO
# [[ $RESULTADO == "HTTP/1.1 200 OK" ]] && echo ok || echo erro



HTTP_CODE=$(curl -o relatorios.txt  -L -s -w "%{http_code}" http://www.google.com)

function check_status_code() {

    if [ "$HTTP_CODE" == "200" ]; then
        echo "=================================================="
        echo "operando servico web"
        echo "Serviço Online"
        echo "=================================================="
    else
        echo "=================================================="
        echo "Serviço Offline"
        echo "=================================================="
    fi
}

function available_internete(){
    if : >/dev/tcp/8.8.8.8/53; then
        echo "=================================================="
        echo 'Internet available.'
        echo "=================================================="
    else
        echo "=================================================="
        echo 'Offline.'
        echo "=================================================="
    fi

}

check_status_code
available_internete