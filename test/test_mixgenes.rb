# encoding: utf-8

###
#  to run use
#     ruby -I ./lib -I ./test test/test_mixgenes.rb

## note:
##  rand(100) - random number between 0 and 100 inclusively
##    todo/check: use rand(99) - why? why not?  e.g. 0 to 99 inclusive (100 values)


require 'helper'



class TestMixGenes < MiniTest::Test

def setup
  Lottery.random = Random.new( 1234 )   ## seed == 1234
end

def mixgenes( matron, sire )
  matron.mix( sire )
end

def test_random
  assert_equal 47, Lottery.rand(100)
  assert_equal 83, Lottery.rand(100)
  assert_equal 38, Lottery.rand(100)
  assert_equal 53, Lottery.rand(100)
end


def test_baby

  kai1 = "dadc 557j 4aaa gb9g 1161 383k 7dbe 774b 6667 8438 dd9a cbbd"  # kitty 100000
  kai2 = "cdad 55r6 7f2f g9bg 1111 3757 d99d 272h 8k78 k884 9da9 fdee"  # kitty 99895

  matron = Genome.new( kai1 )
  sire   = Genome.new( kai2 )
  baby = mixgenes( matron, sire )
  pp baby

  puts "body:      #{baby.body}"
  puts "coloreyes: #{baby.coloreyes}"
  puts "eyes:      #{baby.eyes}"
  puts "pattern:   #{baby.pattern}"
  puts "mouth:     #{baby.mouth}"
  puts "color1:    #{baby.color1}"
  puts "color2:    #{baby.color2}"
  puts "color3:    #{baby.color3}"

  assert_equal "laperm",     baby.body
  assert_equal "strawberry", baby.coloreyes
  assert_equal "simple",     baby.eyes
  assert_equal "calicool",   baby.pattern
  assert_equal "soserious",  baby.mouth
  assert_equal "salmon",     baby.color1
  assert_equal "coffee",     baby.color2
  assert_equal "bloodred",   baby.color3
end

end  # class TestMixGenes
