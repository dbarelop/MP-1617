#!/bin/bash

# valores por defecto
comp=gcc
flag="-march=native"

while getopts "c:f:h" opt; do
  case $opt in
    c) 
      # echo "especificado compilador -> $OPTARG"
      comp=$OPTARG
      ;;
    f) 
      # echo "especificado flag -> $OPTARG"
      flag=$OPTARG
      ;;
    h)
      echo "uso:"
      echo "$0 -c compilador"
      echo "ejemplo:"
      echo "$0 -c gcc"
      exit
      ;;
    \?)
      echo "opción inválida: -$OPTARG"
      ;;
    :)
      echo "la opción -$OPTARG requiere un parámetro"
      exit 1
      ;;
  esac
done

# returns gcc flags activated by the provided flag
echo "Flag ${flag}"
${comp} ${flag} -E -v - </dev/null 2>&1 | grep cc1
${comp} -v 2>&1 | grep "gcc version"
