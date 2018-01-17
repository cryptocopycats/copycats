# encoding: utf-8

###
#  to run use
#     ruby -I ./lib -I ./test test/test_genome.rb


require 'helper'


class TestGenome < MiniTest::Test

def test_genome
   pp TRAITS

   assert true  ## (for now) everything ok if we get here
end


end  # class TestGenome
