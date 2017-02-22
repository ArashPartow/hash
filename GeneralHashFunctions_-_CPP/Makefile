#
# General Hash Function Algorithms
# By Arash Partow - 2000
#
# URL: http://www.partow.net/programming/hashfunctions/index.html
#
# Copyright Notice:
# Free use of this library is permitted under the
# guidelines and in accordance with the MIT License.
# http://www.opensource.org/licenses/MIT
#


COMPILER      = -c++
OPTIONS       = -ansi -pedantic -Wall -o
OPTIONS_LIBS  = -ansi -pedantic -Wall -c
LINKER_OPT    = -L/usr/lib -lstdc++

all: GeneralHashFunctions.o HashTest

GeneralHashFunctions.o: GeneralHashFunctions.cpp GeneralHashFunctions.h
	$(COMPILER) $(OPTIONS_LIBS) GeneralHashFunctions.cpp

HashTest: GeneralHashFunctions.cpp HashTest.cpp
	$(COMPILER) $(OPTIONS) HashTest HashTest.cpp GeneralHashFunctions.o $(LINKER_OPT)


clean:
	rm -f core *.o *.bak *stackdump *#
  
#
# The End !
#

