# encoding: utf-8


class Genome
  attr_reader :genes   ## hash of genes (key is gene type)

  def initialize( arg )
    if arg.is_a? Hash
      hash = arg       ## assumes (pre-built) hash with genes
      @genes = hash
    else
      if arg.is_a? Integer   ## use Integer (Fixnum+Bignum??) - why? why not?
        num = arg
        kai = Kai.encode( num )
      else              # else assume string in kai/base32 format
        kai = arg.dup  # just in case; make a clean (fresh) copy
        kai = kai.gsub( ' ', '' )   ## allow spaces (strip/remove)
      end
      ## puts "Genome.initialize #{kai}"
      build_genes( kai )
    end
  end

  def build_genes( kai )
    kai = kai.reverse    ## note: reserve for easy left-to-right access
    @genes = {}   ## hash of genes (key is gene type)
    ## fix/todo: use as_json for "official" api order
    ## note: use insert order from "official" api
    @genes[:body]      = Gene.new( kai[0,4].reverse )
    @genes[:pattern]   = Gene.new( kai[4,4].reverse )
    @genes[:coloreyes] = Gene.new( kai[8,4].reverse )
    @genes[:eyes]      = Gene.new( kai[12,4].reverse )
    @genes[:color1]    = Gene.new( kai[16,4].reverse )  ## colorprimary / body color / base color
    @genes[:color2]    = Gene.new( kai[20,4].reverse )  ## colorsecondary / sec color / pattern color /  hi(light) color
    @genes[:color3]    = Gene.new( kai[24,4].reverse )  ## colortertiary / acc(ent) color
    @genes[:wild]      = Gene.new( kai[28,4].reverse )
    @genes[:mouth]     = Gene.new( kai[32,4].reverse )
  end

  def body()      TRAITS[:body][:kai][ @genes[:body].d ]; end
  def coloreyes() TRAITS[:coloreyes][:kai][ @genes[:coloreyes].d ]; end
  def eyes()      TRAITS[:eyes][:kai][ @genes[:eyes].d ]; end
  def pattern()   TRAITS[:pattern][:kai][ @genes[:pattern].d ]; end
  def mouth()     TRAITS[:mouth][:kai][ @genes[:mouth].d ]; end
  def color1()    TRAITS[:color1][:kai][ @genes[:color1].d ]; end
  def color2()    TRAITS[:color2][:kai][ @genes[:color2].d ]; end
  def color3()    TRAITS[:color3][:kai][ @genes[:color3].d ]; end



  def genes_color1() @genes[:color1]; end   ## rename to color1_genes instead - why? why not?
  def genes_eyes()   @genes[:eyes];   end
  ## ....

  ## add cattributes  ?? why? why not?


  def mix( other )
    mgenes = genes          ## matron genes
    sgenes = other.genes    ## sire genes
    new_genes  = {}

    ## todo/fix: use insertion order from "official" api - why? why not?
    ##   -- preinitialize with empty hash and than use byte order ??
    TRAIT_KEYS.each do |key|
      mgene = mgenes[key]
      sgene = sgenes[key]

      new_gene = mgene.mix( sgene )
      new_genes[key] = new_gene
    end

    Genome.new( new_genes )   ## return new genome from (pre-built) hash (with genes)
  end


  def build_tables()   GenomeTables.new( self ).build;  end

  def build_mix_tables( other )  GenomeMixTables.new( self, other ).build; end

end # class Genome



class GenomeTables
  def initialize( genome )
    @genome = genome
  end

  def build
    pos = 0
    buf = ""

    genes = @genome.genes

    TRAITS.each do |key, trait|
      gene       = genes[key]
      next  if gene.nil?   ## skip future_1, future_2, etc.

      buf << "#{trait[:name]} (Genes #{trait[:genes]})\n\n"

###
##   fix/todo: add stars for purity?
##     ****   - all traits the same
##     ***    - two same pairs of traits
##     **     - one pair of same traits

      buf << "|Gene  |Binary   |Kai  |Trait    |   |\n"
      buf << "|------|---------|-----|---------|---|\n"
      buf << "| #{pos} | #{Kai::BINARY[gene.d]} | #{gene.d} | **#{fmt_trait(trait[:kai][gene.d])}** | d |\n"; pos+=1
      buf << "| #{pos} | #{Kai::BINARY[gene.r1]} | #{gene.r1} | #{fmt_trait(trait[:kai][gene.r1])} | r1 |\n"; pos+=1
      buf << "| #{pos} | #{Kai::BINARY[gene.r2]} | #{gene.r2} | #{fmt_trait(trait[:kai][gene.r2])} | r2 |\n"; pos+=1
      buf << "| #{pos} | #{Kai::BINARY[gene.r3]} | #{gene.r3} | #{fmt_trait(trait[:kai][gene.r3])} | r3 |\n"; pos+=1
      buf << "\n"

      if key == :body    ## add legend for first entry
        buf << "d = dominant, r1 = 1st order recessive, r2 = 2nd order recessive, r3 = 3rd order recessive\n\n"
      end
    end

    buf
  end

####################
## helpers

  def fmt_trait( trait )
    (trait.nil? || trait.empty?) ? '?' : trait
  end
end  # class GenomeTables




class GenomeMixTables
  def initialize( matron, sire )
    @matron = matron
    @sire   = sire
  end

  def build
    pos = 0
    buf = ""

    mgenes = @matron.genes
    sgenes = @sire.genes

    TRAITS.each do |key, trait|
      mgene  = mgenes[key]
      sgene  = sgenes[key]
      next  if mgene.nil?   ## skip future_1, future_2, etc.

      buf << "#{trait[:name]} (Genes #{trait[:genes]})\n\n"

      buf << "|Gene  |Kai  |Trait (Matron)|Kai|Trait (Sire)|   |\n"
      buf << "|------|-----|---------|-----|---------|---|\n"
      buf << "| #{pos} | #{mgene.d} | **#{fmt_trait(trait[:kai][mgene.d])}** | #{sgene.d} | **#{fmt_trait(trait[:kai][sgene.d])}** | d |\n"; pos+=1
      buf << "| #{pos} | #{mgene.r1} | #{fmt_trait(trait[:kai][mgene.r1])} | #{sgene.r1} | #{fmt_trait(trait[:kai][sgene.r1])} | r1 |\n"; pos+=1
      buf << "| #{pos} | #{mgene.r2} | #{fmt_trait(trait[:kai][mgene.r2])} | #{sgene.r2} | #{fmt_trait(trait[:kai][sgene.r2])} | r2 |\n"; pos+=1
      buf << "| #{pos} | #{mgene.r3} | #{fmt_trait(trait[:kai][mgene.r3])} | #{sgene.r3} | #{fmt_trait(trait[:kai][sgene.r3])} | r3 |\n"; pos+=1
      buf << "\n"

      if key == :body    ## add legend for first entry
        buf << "d = dominant, r1 = 1st order recessive, r2 = 2nd order recessive, r3 = 3rd order recessive\n\n"
      end
    end

    buf
  end

####################
## helpers

  def fmt_trait( trait )
    (trait.nil? || trait.empty?) ? '?' : trait
  end
end  # class GenomeMixTables
