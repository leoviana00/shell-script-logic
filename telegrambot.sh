#!/bin/bash

TOKEN=
CHAT_ID=
MESSAGE="Alô Mundo!"
URL="https://api.telegram.org/bot$TOKEN/sendMessage"
# curl -s -X POST https://api.telegram.org/bot${TOKEN}/sendMessage -d chat_id=${CHAT_ID} -d parse_mode="HTML" -d text="
# <b> Status </b>:  🔴 teste"

echo -e "*** Vamos usar o bot para conversar no Telegram ***"
sleep 2
echo ""

read -p "Digite uma mensagem : " MSG

echo "Você digitou : $MSG"

echo ""

curl -s -X POST $URL -d chat_id=$CHAT_ID -d text="$MSG"

echo ""

echo "Feito!"