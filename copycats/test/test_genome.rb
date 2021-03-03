# encoding: utf-8

###
#  to run use
#     ruby -I ./lib -I ./test test/test_genome.rb


require 'helper'


class TestGenome < MiniTest::Test


def test_kitty_100000
  ## see https://cryptokittydex.com/kitties/100000
  ##     https://www.cryptokitties.co/kitty/100000

  kai = "dadc 557j 4aaa gb9g 1161 383k 7dbe 774b 6667 8438 dd9a cbbd"

  genome = Genome.new( kai )
  pp genome

  puts "body:      #{genome.body}"
  puts "coloreyes: #{genome.coloreyes}"
  puts "eyes:      #{genome.eyes}"
  puts "pattern:   #{genome.pattern}"
  puts "mouth:     #{genome.mouth}"
  puts "color1:    #{genome.color1}"
  puts "color2:    #{genome.color2}"
  puts "color3:    #{genome.color3}"

  assert_equal "munchkin",    genome.body
  assert_equal "strawberry",  genome.coloreyes
  assert_equal "crazy",       genome.eyes
  assert_equal "luckystripe", genome.pattern
  assert_equal "soserious",   genome.mouth
  assert_equal "greymatter",  genome.color1
  assert_equal "lemonade",    genome.color2
  assert_equal "bloodred",    genome.color3


  puts genome.genes[:color1].p
  puts genome.genes[:color1].h1
  puts genome.genes[:color1].h2
  puts genome.genes[:color1].h3

  assert_equal genome.genes[:color1].p,  genome.genes[:color1].d
  assert_equal genome.genes[:color1].h1, genome.genes[:color1].r1
  assert_equal genome.genes[:color1].h2, genome.genes[:color1].r2
  assert_equal genome.genes[:color1].h3, genome.genes[:color1].r3


  puts genome.genes[:eyes].p
  puts genome.genes[:eyes].h1
  puts genome.genes[:eyes].h2
  puts genome.genes[:eyes].h3

  puts TRAITS[:eyes][ genome.genes[:eyes].p ]
  puts TRAITS[:eyes][ genome.genes[:eyes].h1 ]
  puts TRAITS[:eyes][ genome.genes[:eyes].h2 ]
  puts TRAITS[:eyes][ genome.genes[:eyes].h3 ]
end


def test_kitty_99895
  ## see https://cryptokittydex.com/kitties/99895
  ##     https://www.cryptokitties.co/kitty/99895

  kai = "cdad 55r6 7f2f g9bg 1111 3757 d99d 272h 8k78 k884 9da9 fdee"

  genome = Genome.new( kai )
  pp genome

  puts "body:      #{genome.body}"
  puts "coloreyes: #{genome.coloreyes}"
  puts "eyes:      #{genome.eyes}"
  puts "pattern:   #{genome.pattern}"
  puts "mouth:     #{genome.mouth}"
  puts "color1:    #{genome.color1}"
  puts "color2:    #{genome.color2}"
  puts "color3:    #{genome.color3}"

  assert_equal "sphynx",      genome.body
  assert_equal "mintgreen",   genome.coloreyes
  assert_equal "thicccbrowz", genome.eyes
  assert_equal "calicool",    genome.pattern
  assert_equal "soserious",   genome.mouth
  assert_equal "cloudwhite",  genome.color1
  assert_equal "coffee",      genome.color2
  assert_equal "kittencream", genome.color3
end

end  # class TestGenome
