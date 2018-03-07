# encoding: utf-8

####
# use:
#  $ ruby -I ./lib script/kitty.rb


require 'copycats'


KittyReport.new( id:  100_000,
                 genes: "dadc 557j 4aaa gb9g 1161 383k 7dbe 774b 6667 8438 dd9a cbbd"
               ).save( "./KITTY-100000.md" )

KittyReport.new( id:    99_895,
                 genes: "cdad 55r6 7f2f g9bg 1111 3757 d99d 272h 8k78 k884 9da9 fdee"
               ).save( "./KITTY-99895.md" )
