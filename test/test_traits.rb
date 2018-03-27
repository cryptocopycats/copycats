# encoding: utf-8

###
#  to run use
#     ruby -I ./lib -I ./test test/test_traits.rb


require 'helper'


class TestTraits < MiniTest::Test

def test_traits
    pp TRAITS
    assert true  ## (for now) everything ok if we get here

    ## todo: assert number of traits  use traits.keys.size !!!
end

def test_fancies
    pp FANCIES
    assert true  ## (for now) everything ok if we get here

    ## todo: assert number of fancies  use fancies.keys.size !!!
end


def test_kai

  ## Kitty #1001
  ##  see https://cryptokittydex.com/kitties/1001

   kai    = "aaaa 7885 22f2 agff 1661 7755 e979 2441 6667 7664 a9aa cfff".gsub( ' ', '' )

   puts "kai.length: #{kai.length}"  ## 48
   puts "  first: #{kai[0]}"
   puts "  last:  #{kai[-1]}"
   puts "  last:  #{kai[47]}"

   puts kai.reverse
   puts kai.reverse[0,4]
   puts kai.reverse[4,4]
   puts kai.reverse[8,4]
   eyes = kai.reverse[12,4]
   puts "eyes:"
   puts eyes

   puts  TRAITS[:eyes]
   pp    eyes[0]
   puts  TRAITS[:eyes][eyes[0]]
   puts  TRAITS[:eyes][eyes[1]]
   puts  TRAITS[:eyes][eyes[2]]
   puts  TRAITS[:eyes][eyes[3]]

   color1 = kai.reverse[16,4]
   puts "color1:"
   puts color1
   pp    color1[0]
   puts  TRAITS[:color1][color1[0]]
   puts  TRAITS[:color1][color1[1]]
   puts  TRAITS[:color1][color1[2]]
   puts  TRAITS[:color1][color1[3]]

   assert true
end

end  # class TestTraits
