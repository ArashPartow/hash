#
# General Hash Function Algorithms MakeFile
# By Arash Partow - 2000
#
# URL: http://www.partow.net/programming/hashfunctions/index.html
#
# Copyright Notice:
# Free use of this library is permitted under the
# guidelines and in accordance with the MIT License.
# http://www.opensource.org/licenses/MIT
#


COMPILER = javac

all: GeneralHashFunctionLibrary GeneralHashTest

GeneralHashFunctionLibrary: GeneralHashFunctionLibrary.java
	$(COMPILER) GeneralHashFunctionLibrary.java

GeneralHashTest: GeneralHashTest.java GeneralHashFunctionLibrary
	$(COMPILER) GeneralHashTest.java

clean:
	rm -f core *.o *.bak *stackdump *#

#
# The End !
#
