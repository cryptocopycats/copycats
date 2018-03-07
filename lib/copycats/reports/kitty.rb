# encoding: utf-8

class KittyReport

  def initialize( *args, **kwargs )
    if args.empty? # try keyword args
      @id   = kwargs[:id]
      @kai  = kwargs[:genes]   ## todo/check: also incl. check for kai key - why? why not?
    else
      # try positional args
      ##  for now alsways assume ActiveRecord - Kitty::Model
      kitty = args[0]
      @id   = kitty.id
      @kai  = fmt_kai( kitty.genes )    ## pretty print in groups of four (4)
    end
  end

  def build
    buf = "# Kitty \##{@id}\n\n"
    buf << "genes (kai): #{@kai}\n\n"
    buf << Genome.new( @kai ).build_tables

    ## puts buf

    buf
  end

  def save( path )
    File.open( path, "w" ) do |f|
      f.write build
    end
  end


#####
#  helpers
  def fmt_kai( kai )
    ## format in groups of four (4) separated by space
    ##  e.g.  ccac7787fa7fafaa16467755f9ee444467667366cccceede
    ##     :  ccac 7787 fa7f afaa 1646 7755 f9ee 4444 6766 7366 cccc eede
    kai.reverse.gsub( /(.{4})/, '\1 ').reverse.strip
  end


end  # class KittyReport
