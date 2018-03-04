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


## simple hash map (helper) for conversion to binary string
KAI_TO_BINARY = {
  '1' => '00000',    # 0
  '2' => '00001',    # 1
  '3' => '00010',    # 2
  '4' => '00011',    # 3
  '5' => '00100',    # 4
  '6' => '00101',    # 5
  '7' => '00110',    # 6
  '8' => '00111',    # 7
  '9' => '01000',    # 8
  'a' => '01001',    # 9
  'b' => '01010',    # 10
  'c' => '01011',    # 11
  'd' => '01100',    # 12
  'e' => '01101',    # 13
  'f' => '01110',    # 14
  'g' => '01111',    # 15
  'h' => '10000',    # 16
  'i' => '10001',    # 17
  'j' => '10010',    # 18
  'k' => '10011',    # 19
  'm' => '10100',    # 20
  'n' => '10101',    # 21
  'o' => '10110',    # 22
  'p' => '10111',    # 23
  'q' => '11000',    # 24
  'r' => '11001',    # 25
  's' => '11010',    # 26
  't' => '11011',    # 27
  'u' => '11100',    # 28
  'v' => '11101',    # 29
  'w' => '11110',    # 30
  'x' => '11111'     # 31
}
