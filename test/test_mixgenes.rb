# encoding: utf-8

###
#  to run use
#     ruby -I ./lib -I ./test test/test_mixgenes.rb

## note:
##  rand(100) - random number between 0 and 100 inclusively
##    todo/check: use rand(99) - why? why not?  e.g. 0 to 99 inclusive (100 values)


require 'helper'



class TestMixGenes < MiniTest::Test

def mixgenes( matron, sire )
  matron.mix( sire )
end

def test_baby

  kai1 = "dadc 557j 4aaa gb9g 1161 383k 7dbe 774b 6667 8438 dd9a cbbd"  # kitty 100000
  kai2 = "cdad 55r6 7f2f g9bg 1111 3757 d99d 272h 8k78 k884 9da9 fdee"  # kitty 99895

  matron = Genome.new( kai1 )
  sire   = Genome.new( kai2 )
  baby = mixgenes( matron, sire )
  pp baby

  assert true  ## (for now) everything ok if we get here
end


end  # class TestMixGenes
