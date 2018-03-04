# encoding: utf-8


class Gene

  attr_reader :d0, :r1, :r2, :r3
  # d0 (dominant gene)    -- todo/check: rename to just d instead of d0 - why? why not?
  # r1 (1st order recessive gene)
  # r2 (2nd order recessive gene)
  # r3 (3rd order recessive gene)

  def initialize( arg )
     ## (always) assume String in base32/kai for now
     kai = arg
     puts "Gene.initialize #{kai}"
     kai = kai.reverse
     @d0  = kai[0]
     @r1  = kai[1]
     @r2  = kai[2]
     @r3  = kai[3]
  end
end  # class Gene


class Genome

  attr_reader :kai,    ## genome in base32/kai notation (string)
              :genes   ## hash of genes (key is gene type)

  def initialize( arg )
    if arg.is_a? Integer   ## use Integer (Fixnum+Bignum??) - why? why not?
      num = arg
      @kai = Kai.encode( num )
    else              # else assume string in kai/base32 format
      @kai = arg.dup  # just in case; make a clean (fresh) copy
      @kai = @kai.gsub( ' ', '' )   ## allow spaces (strip/remove)
    end
    puts "Genome.initialize #{@kai}"

    @genes = {}   ## hash of genes (key is gene type)
    ## note: use insert order from "official" api
    @genes[:body]      = Gene.new( @kai.reverse[0,4].reverse )
    @genes[:coloreyes] = Gene.new( @kai.reverse[8,4].reverse )
    @genes[:eyes]      = Gene.new( @kai.reverse[12,4].reverse )
    @genes[:pattern]   = Gene.new( @kai.reverse[4,4].reverse )
    @genes[:mouth]     = Gene.new( @kai.reverse[32,4].reverse )
    @genes[:color1]    = Gene.new( @kai.reverse[16,4].reverse )  ## colorprimary / body color / base color
    @genes[:color2]    = Gene.new( @kai.reverse[20,4].reverse )  ## colorsecondary / sec color / pattern color /  hi(light) color
    @genes[:color3]    = Gene.new( @kai.reverse[24,4].reverse )  ## colortertiary / acc(ent) color
    @genes[:wild]      = Gene.new( @kai.reverse[28,4].reverse )
  end

  def body()      TRAITS[:body][ @genes[:body].d0 ]; end
  def coloreyes() TRAITS[:coloreyes][ @genes[:coloreyes].d0 ]; end
  def eyes()      TRAITS[:eyes][ @genes[:eyes].d0 ]; end
  def pattern()   TRAITS[:pattern][ @genes[:pattern].d0 ]; end
  def mouth()     TRAITS[:mouth][ @genes[:mouth].d0 ]; end
  def color1()    TRAITS[:color1][ @genes[:color1].d0 ]; end
  def color2()    TRAITS[:color2][ @genes[:color2].d0 ]; end
  def color3()    TRAITS[:color3][ @genes[:color3].d0 ]; end



  def genes_color1() @genes[:color1]; end   ## rename to color1_genes instead - why? why not?
  def genes_eyes()   @genes[:eyes];   end
  ## ....

  ## add cattributes  ?? why? why not?

  def build_tables()   GenomeTables.new( self ).build;  end

end # class Genome


class GenomeTables
  def initialize( genome )
    @genome = genome
  end

  def build
    pos = 0
    buf = ""

    genes = @genome.genes

    TRAIT_KEYS.each do |key|
      trait      = TRAITS[key]
      trait_meta = TRAITS_META[key]
      gene       = genes[key]
      buf << "#{trait_meta[:name]} (Genes #{trait_meta[:genes]})\n\n"

      buf << "|Gene  |Binary   |Kai  |Trait    |   |\n"
      buf << "|------|---------|-----|---------|---|\n"
      buf << "| #{pos} | #{KAI_TO_BINARY[gene.d0]} | #{gene.d0} | **#{fmt_trait(trait[gene.d0])}** | d |\n"; pos+=1
      buf << "| #{pos} | #{KAI_TO_BINARY[gene.r1]} | #{gene.r1} | #{fmt_trait(trait[gene.r1])} | r1 |\n"; pos+=1
      buf << "| #{pos} | #{KAI_TO_BINARY[gene.r2]} | #{gene.r2} | #{fmt_trait(trait[gene.r2])} | r2 |\n"; pos+=1
      buf << "| #{pos} | #{KAI_TO_BINARY[gene.r3]} | #{gene.r3} | #{fmt_trait(trait[gene.r3])} | r3 |\n"; pos+=1
      buf << "\n"

      if key == :body    ## add legend for first entry
        buf << "d = dominant, r1 = 1st order recessive, r2 = 2nd order recessive, r3 = 3rd order recessive\n\n"
      end
    end

    buf
  end

## helpers

  def fmt_trait( trait )
    (trait.nil? || trait.empty?) ? '??' : trait
  end
end  # class GenomeTables
