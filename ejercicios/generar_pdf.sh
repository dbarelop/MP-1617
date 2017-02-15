#!/bin/sh

pandoc -f markdown -V papersize=A4 -V geometry:"top=2cm, bottom=1.5cm, left=2cm, right=2cm" $1 --latex-engine=pdflatex -o ${1/md/pdf}
