# encoding: utf-8


class Gene




### todo/check:
##    find a better name for Slice(incl.4 genes)
##      e.g. GeneFour, Gene4, GeneGroup, GeneSlice,TraitGenes,... - why? why not?

class Slice   ## Gene::Slice (nested class)

  attr_reader :p, :h1, :h2, :h3   # p(rimary), h(idden) 1, h(idden) 2, h(idden) 3

  ## compat: add alias for ("old/classic") d, r1, r2, r3
  # d  (dominant gene)    -- todo/check: rename to just d instead of d0 - why? why not?
  # r1 (1st order recessive gene)
  # r2 (2nd order recessive gene)
  # r3 (3rd order recessive gene)
  def d()  p;  end   # todo: use alias - why? why not?
  def r1() h1; end
  def r2() h2; end
  def r3() h3; end


  def initialize( arg )
     ## (always) assume String in base32/kai for now
     kai = arg
     ## puts "Gene.initialize #{kai}"
     kai = kai.reverse
     @p   = kai[0]
     @h1  = kai[1]
     @h2  = kai[2]
     @h3  = kai[3]
  end

  def to_kai()  @h3 + @h2 + @h1 + @p; end   ## return a string in kai/base32 notation


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

    gene1 = Kai::NUMBER[p]          ## primary/dominant gene1
    gene2 = Kai::NUMBER[other.p]    ## primary/dominant gene2
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

    new_p = mutate( other )
    if new_p.nil?    ## no mutation of gene.p - use "regular" formula
      new_p = Lottery.rand(100) < 50 ? p : other.p
    end

    new_h1 = Lottery.rand(100) < 50 ? h1 : other.h1
    new_h2 = Lottery.rand(100) < 50 ? h2 : other.h2
    new_h3 = Lottery.rand(100) < 50 ? h3 : other.h3

    gene = Gene.new( new_h3 + new_h2 + new_h1 + new_p )
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

end  # class Slice
end  # class Gene
