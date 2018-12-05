# encoding: utf-8


### todo/check:
##    find a better name for Gene (incl.4 genes)
##      e.g. GeneFour, Gene4, GeneGroup, GeneSlice,TraitGenes,... -why? why not?

class Gene

  attr_reader :d, :r1, :r2, :r3
  # d  (dominant gene)    -- todo/check: rename to just d instead of d0 - why? why not?
  # r1 (1st order recessive gene)
  # r2 (2nd order recessive gene)
  # r3 (3rd order recessive gene)

  def initialize( arg )
     ## (always) assume String in base32/kai for now
     kai = arg
     ## puts "Gene.initialize #{kai}"
     kai = kai.reverse
     @d   = kai[0]
     @r1  = kai[1]
     @r2  = kai[2]
     @r3  = kai[3]
  end

  def to_kai()  @r3 + @r2 + @r1 + @d; end   ## return a string in kai/base32 notation

  def swap
    puts "Gene#swap"
    kai = to_kai.reverse      # note: use reverse kai string (kai[0] is first char/digit/letter)

    3.downto(1) do |i|
      if Lottery.rand(100) < 25
        puts " bingo! swap #{i}<>#{i-1}"
        kai[i-1], kai[i] = kai[i], kai[i-1]
      end
    end
    Gene.new( kai.reverse )  ## note: do NOT forget to pass in kai (unreversed)
  end


  def mutate( other )
    puts "Gene#mutate"

    gene1 = Kai::NUMBER[d]          ## dominant gene1
    gene2 = Kai::NUMBER[other.d]    ## dominant gene2
    if gene1 > gene2
      gene1, gene2 = gene2, gene1     ## make sure gene2 is always bigger
    end
    if (gene2 - gene1) == 1 && gene1.even?
      probability = 25
      probability /= 2   if gene1 > 23
      if Lottery.rand(100) < probability
        genex = (gene1 / 2) + 16       ## 16=2^4
        puts " bingo! mutation #{gene2}+#{gene1} => #{genex}"
        puts "                 #{Kai::ALPHABET[gene2]}+#{Kai::ALPHABET[gene1]} => #{Kai::ALPHABET[genex]}"
        return Kai::ALPHABET[genex]
      end
    end
    nil   # no mutation
  end

  def mix_inner( other )
    puts "Gene#mix_inner"

    new_d = mutate( other )
    if new_d.nil?    ## no mutation of gene.d - use "regular" formula
      new_d = Lottery.rand(100) < 50 ? d : other.d
    end

    new_r1 = Lottery.rand(100) < 50 ? r1 : other.r1
    new_r2 = Lottery.rand(100) < 50 ? r2 : other.r2
    new_r3 = Lottery.rand(100) < 50 ? r3 : other.r3

    gene = Gene.new( new_r3 + new_r2 + new_r1 + new_d )
    pp gene
    gene
  end


  def mix( other )
    puts "Gene#mix"
    self_swapped  = swap
    other_swapped = other.swap

    gene = self_swapped.mix_inner( other_swapped )
    pp gene
    gene
  end

end  # class Gene
