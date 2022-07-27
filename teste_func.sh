#!/bin/bash

# Função
function msg(){
    echo "Olá Leonardo Viana $count-x"
}

# Chamando a função
count=1
while [ $count -le 10 ]
do
    msg
    count=$[count + 1]
done
echo "Função realizada com sucesso!"
