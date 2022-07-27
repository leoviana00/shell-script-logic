#!/bin/bash

PARAM1=$1

# 1 NOT (NÃO)
# -e Verifica se existe

if [ ! -e $PARAM1 ]; then
    echo "Arquivo não existe"

# -f Verifica se é arquivo
# -a Logica AND (E)
# -s Verifica se o arquivo é maior que zero
elif [ -f $PARAM1 -a -s $PARAM1 ]; then
    echo "Você informou um arquivo e ele não está vazio"
elif [ ! -f $PARAM1 ]; then
    echo "O que você informou não é um arquivo"
else
    echo "Você informou um arquivo e ele está vazio"
fi