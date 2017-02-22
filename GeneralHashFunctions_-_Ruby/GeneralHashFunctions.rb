#
#**************************************************************************
#*                                                                        *
#*          General Purpose Hash Function Algorithms Library              *
#*                                                                        *
#* Author: Arash Partow - 2002                                            *
#* URL: http://www.partow.net                                             *
#* URL: http://www.partow.net/programming/hashfunctions/index.html        *
#*                                                                        *
#* Copyright notice:                                                      *
#* Free use of the General Purpose Hash Function Algorithms Library is    *
#* permitted under the guidelines and in accordance with the MIT License. *
#* http://www.opensource.org/licenses/MIT                                 *
#*                                                                        *
#**************************************************************************
#


module GeneralHashFunctions

  def self.rshash( str, len=str.length )
    a    = 63689
    b    = 378551
    hash = 0
    len.times{ |i|
      hash = hash * a + str[i]
      a *= b
    }
    return hash
  end


  def self.jshash( str, len=str.length )
    hash = 1315423911
    len.times{ |i|
      hash ^= ( ( hash << 5 ) + str[i] + ( hash >> 2 ) )
    }
    return hash
  end


  def self.elfhash( str, len=str.length )
    hash = 0
    x = 0
    len.times{ |i|
      hash = (hash << 4) + str[i]
      if  (x = hash & 0xF0000000) != 0
        hash ^= (x >> 24)
        hash &= ~x
      end
    }
    return hash
  end


  def self.bkdrhash( str, len=str.length )
    seed = 131    # 31 131 1313 13131 131313 etc..
    hash = 0
    len.times{ |i|
      hash = ( hash * seed ) + str[i]
    }
    return hash
  end


  def self.sdbmhash( str, len=str.length )
    hash = 0
    len.times{ |i|
      hash = str[i] + ( hash << 6 ) + ( hash << 16 ) - hash
    }
    return hash
  end


  def self.djbhash( str, len=str.length )
    hash = 5381
    len.times{ |i|
      hash = ((hash << 5) + hash) + str[i]
    }
    return hash
  end


  def self.dekhash( str, len=str.length )
    hash = len
    len.times{ |i|
      hash = ((hash << 5) ^ (hash >> 27)) ^ str[i]
    }
    return hash
  end


  def self.bphash( str, len=str.length )
    hash = 0
    len.times{ |i|
      hash = hash << 7 ^ str[i]
    }
    return hash
  end


  def self.fnvhash( str, len=str.length )
    fnv_prime = 0x811C9DC5
    hash = 0
    len.times{ |i|
      hash *= fnv_prime
      hash ^= str[i]
    }
    return hash
  end


  def self.ap( str, len=str.length )
    hash = 0xAAAAAAAA
    len.times{ |i|
      if (i & 1) == 0
        hash ^= (hash << 7) ^ str[i] * (hash >> 3)
      else
        hash ^= ~( (hash << 11) + str[i] ^ (hash >> 5) )
      end
    }
    return hash
  end

end
