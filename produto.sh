#!/bin/bash
source ./colors.sh

echo -e "${GREEN}==================================================${NC}"
echo -e "${GREEN}Sistema para calcular o produto entre dois números inteiros${NC}"
echo -e "${GREEN}==================================================${NC}"

# Rntrada de dados
echo "Digite o primeiro número: "
read N1;
echo "Digite o segundo número: "
read N2;

# Cálculo
PROD=$[ $N2 * $N1 ]

# Saída de dados
echo "=================================================="
echo "Produto = $PROD"
echo "=================================================="
