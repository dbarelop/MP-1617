# Makefile para compilar los distintos fuentes de la práctuca.
# To compile the program, just type make in the sample directory.
# 

CC=gcc
FLAGS=-std=c11 -g -O3 -march=native -Wall -Wextra -Wshadow
#FLAGS=-std=c99
REPORT_FLAGS=-fopt-info-vec-optimized
#REPORT_FLAGS=-fopt-info-vec-all -fopt-info-loop-optimized
#REPORT_FLAGS=-fopt-info-vec-optimized

#
# The -ljpeg flag is used to tell the compiler to use the libjpeg library to compile and link
# your program against. If omitted, you will get a few "unresolved symbol" errors.
#
# 

# $<: name of the first prerequisite
# $@: file name of the target of the rule
# http://www.gnu.org/software/make/manual/make.html#Automatic-Variables

all: test_convert_YCbCr

jpeg_handler.o: jpeg_handler.c
	$(CC) $(FLAGS)  -c $<  -o $@ 

dummy.o: dummy.c
	$(CC) $(FLAGS)  -c $< -o $@ 

convertRGB2YCbCr.o: convertRGB2YCbCr.c
	$(CC)  $(FLAGS)  $(REPORT_FLAGS)  -c $<  -o $@ \
      -Wa,-adghln=assembler/convertRGB2YCbCr.$(CC).s \
	  > reports/convertRGB2YCbCr.$(CC).report.txt  2>&1

misc.o: misc.c
	$(CC)  $(FLAGS)  $(REPORT_FLAGS)  -c $<  -o $@ \
      -Wa,-adghln=assembler/misc.$(CC).s \
	  > reports/misc.$(CC).report.txt  2>&1

# $^: names of all the prerequisites
# http://www.gnu.org/software/make/manual/make.html#Automatic-Variables
test_convert_YCbCr: convertRGB2YCbCr.o misc.o  jpeg_handler.o dummy.o test_convert_YCbCr.c
	$(CC) $(FLAGS)  $^  -Llib -ljpeg -lm -o $@


clean:
	rm -rf *.o test_convertRGB2YCbCr
