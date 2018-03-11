# encoding: utf-8

class MixReport

  def initialize( matron, sire )
    @matron_id   = matron.id
    @sire_id     = sire.id
    @matron_kai  = fmt_kai( matron.genes_kai )    ## pretty print in groups of four (4)
    @sire_kai    = fmt_kai( sire.genes_kai )
  end


  def build
    buf = "# Kitty \##{@matron_id} + \##{@sire_id}\n\n"
    buf << "genes (kai) 1: #{@matron_kai}\n"
    buf << "genes (kai) 2: #{@sire_kai}\n\n"

    buf << Genome.new( @matron_kai ).build_mix_tables( Genome.new( @sire_kai ))

    ## puts buf
    buf
  end


## fix/todo: use "generic" report class (inherits save)!!!!!
  def save( path )
    File.open( path, "w" ) do |f|
      f.write build
    end
  end



#####
#  helpers
#    todo: move to helpers module for (re)use
  def fmt_kai( kai )
    ## format in groups of four (4) separated by space
    ##  e.g.  ccac7787fa7fafaa16467755f9ee444467667366cccceede
    ##     :  ccac 7787 fa7f afaa 1646 7755 f9ee 4444 6766 7366 cccc eede
    kai.reverse.gsub( /(.{4})/, '\1 ').reverse.strip
  end


end  # class KittyReport
