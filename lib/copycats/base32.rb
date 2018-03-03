# encoding: utf-8


class Base32   ## Base32  (2^5 - 5bits)

  # See https://en.wikipedia.org/wiki/Base58
  ALPHABET = "123456789abcdefghijkmnopqrstuvwx"
  BASE     = ALPHABET.length   ## 32 chars/letters/digits


  # Converts a base10 integer to a base32 string.
  def self.encode( num )
    buf = String.new
    while num >= BASE
      puts "num=#{num}"
      mod = num % BASE
      puts "  mod=#{mod} == #{ALPHABET[mod]}"
      buf = ALPHABET[mod] + buf
      puts "buf=#{buf}"
      num = (num - mod)/BASE
    end
    ALPHABET[num] + buf
  end


  # Converts a base58 string to a base10 integer.
  def self.decode( str )
    num = 0
    str.reverse.each_char.with_index do |char,index|
      char_index = ALPHABET.index(char)
      raise ArgumentError, 'Value passed not a valid Base32 String.'  if char_index.nil?
      num += (char_index)*(BASE**(index))
    end
    num
  end

end # class Base32

## add a shortcut (convenience) alias
Kai = Base32
