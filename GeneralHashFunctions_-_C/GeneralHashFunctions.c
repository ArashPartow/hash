/*
 **************************************************************************
 *                                                                        *
 *          General Purpose Hash Function Algorithms Library              *
 *                                                                        *
 * Author: Arash Partow - 2002                                            *
 * URL: http://www.partow.net                                             *
 * URL: http://www.partow.net/programming/hashfunctions/index.html        *
 *                                                                        *
 * Copyright notice:                                                      *
 * Free use of the General Purpose Hash Function Algorithms Library is    *
 * permitted under the guidelines and in accordance with the MIT License. *
 * http://www.opensource.org/licenses/MIT                                 *
 *                                                                        *
 **************************************************************************
*/


#include "GeneralHashFunctions.h"


unsigned int RSHash(const char* str, unsigned int len)
{
   unsigned int b    = 378551;
   unsigned int a    = 63689;
   unsigned int hash = 0;
   unsigned int i    = 0;

   for(i = 0; i < len; str++, i++)
   {
      hash = hash * a + (*str);
      a    = a * b;
   }

   return hash;
}
/* End Of RS Hash Function */


unsigned int JSHash(const char* str, unsigned int len)
{
   unsigned int hash = 1315423911;
   unsigned int i    = 0;

   for(i = 0; i < len; str++, i++)
   {
      hash ^= ((hash << 5) + (*str) + (hash >> 2));
   }

   return hash;
}
/* End Of JS Hash Function */


unsigned int PJWHash(const char* str, unsigned int len)
{
   const unsigned int BitsInUnsignedInt = (unsigned int)(sizeof(unsigned int) * 8);
   const unsigned int ThreeQuarters     = (unsigned int)((BitsInUnsignedInt  * 3) / 4);
   const unsigned int OneEighth         = (unsigned int)(BitsInUnsignedInt / 8);
   const unsigned int HighBits          = (unsigned int)(0xFFFFFFFF) << (BitsInUnsignedInt - OneEighth);
   unsigned int hash              = 0;
   unsigned int test              = 0;
   unsigned int i                 = 0;

   for(i = 0; i < len; str++, i++)
   {
      hash = (hash << OneEighth) + (*str);

      if((test = hash & HighBits)  != 0)
      {
         hash = (( hash ^ (test >> ThreeQuarters)) & (~HighBits));
      }
   }

   return hash;
}
/* End Of  P. J. Weinberger Hash Function */


unsigned int ELFHash(const char* str, unsigned int len)
{
   unsigned int hash = 0;
   unsigned int x    = 0;
   unsigned int i    = 0;

   for(i = 0; i < len; str++, i++)
   {
      hash = (hash << 4) + (*str);
      if((x = hash & 0xF0000000L) != 0)
      {
         hash ^= (x >> 24);
      }
      hash &= ~x;
   }

   return hash;
}
/* End Of ELF Hash Function */


unsigned int BKDRHash(const char* str, unsigned int len)
{
   unsigned int seed = 131; /* 31 131 1313 13131 131313 etc.. */
   unsigned int hash = 0;
   unsigned int i    = 0;

   for(i = 0; i < len; str++, i++)
   {
      hash = (hash * seed) + (*str);
   }

   return hash;
}
/* End Of BKDR Hash Function */


unsigned int SDBMHash(const char* str, unsigned int len)
{
   unsigned int hash = 0;
   unsigned int i    = 0;

   for(i = 0; i < len; str++, i++)
   {
      hash = (*str) + (hash << 6) + (hash << 16) - hash;
   }

   return hash;
}
/* End Of SDBM Hash Function */


unsigned int DJBHash(const char* str, unsigned int len)
{
   unsigned int hash = 5381;
   unsigned int i    = 0;

   for(i = 0; i < len; str++, i++)
   {
      hash = ((hash << 5) + hash) + (*str);
   }

   return hash;
}
/* End Of DJB Hash Function */


unsigned int DEKHash(const char* str, unsigned int len)
{
   unsigned int hash = len;
   unsigned int i    = 0;

   for(i = 0; i < len; str++, i++)
   {
      hash = ((hash << 5) ^ (hash >> 27)) ^ (*str);
   }
   return hash;
}
/* End Of DEK Hash Function */


unsigned int BPHash(const char* str, unsigned int len)
{
   unsigned int hash = 0;
   unsigned int i    = 0;
   for(i = 0; i < len; str++, i++)
   {
      hash = hash << 7 ^ (*str);
   }

   return hash;
}
/* End Of BP Hash Function */


unsigned int FNVHash(const char* str, unsigned int len)
{
   const unsigned int fnv_prime = 0x811C9DC5;
   unsigned int hash      = 0;
   unsigned int i         = 0;

   for(i = 0; i < len; str++, i++)
   {
      hash *= fnv_prime;
      hash ^= (*str);
   }

   return hash;
}
/* End Of FNV Hash Function */


unsigned int APHash(const char* str, unsigned int len)
{
   unsigned int hash = 0xAAAAAAAA;
   unsigned int i    = 0;

   for(i = 0; i < len; str++, i++)
   {
      hash ^= ((i & 1) == 0) ? (  (hash <<  7) ^ (*str) * (hash >> 3)) :
                               (~((hash << 11) + ((*str) ^ (hash >> 5))));
   }

   return hash;
}
/* End Of AP Hash Function */
