#!/bin/bash

echo "Digine o nome da imagem: "; read name
echo "Digite a imagem base: "; read ImageBase

function image() {
    docker container run --name ${name} -d ${ImageBase} >/dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "Sucesso"
    else
        echo "Falha"
    fi
}
image