# encoding: utf-8

####
# use:
#  $ ruby -I ./lib script/kitty.rb


require 'copycats'


class KittyReport

  def initialize( id, kai )
    @id  = id
    @kai = kai
  end

  def build
    buf = "# Kitty \##{@id}\n\n"
    buf << "genes (kai): #{@kai}\n\n"
    buf << Genome.new( @kai ).build_tables

    puts buf

    buf
  end

  def save( path )
    File.open( path, "w" ) do |f|
      f.write build
    end
  end
end  # class KittyReport


KittyReport.new( 100_000,
                 "dadc 557j 4aaa gb9g 1161 383k 7dbe 774b 6667 8438 dd9a cbbd"
               ).save( "./KITTY-100000.md" )

KittyReport.new( 99_895,
                 "cdad 55r6 7f2f g9bg 1111 3757 d99d 272h 8k78 k884 9da9 fdee"
               ).save( "./KITTY-99895.md" )
