#!/bin/bash

DATA=$(date +%H)

function saudacao(){

    if [ $DATA -ge 13 -a $DATA -lt 18 ]; then
        echo "Boa tarde!"
    elif [ $DATA -lt 13 ]; then
        echo "Bom dia!"
    else
        echo "Boa noite"
    fi

}
saudacao