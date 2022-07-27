#!/bin/bash

ping -c1 wikipedia.org
[ $? -ne 0 ] && echo "O comando ping emitiu algum erro."