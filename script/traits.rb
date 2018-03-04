# encoding: utf-8

####
# use:
#  $ ruby -I ./lib script/traits.rb


require 'copycats'


class TraitsReport

def build
  buf = ""
  buf << "# Traits\n\n"

  headings = []
  TRAITS.keys.each do |key|
    trait_meta = TRAITS_META[key]

    headings << "#{trait_meta[:name]} (#{trait_meta[:genes]})"
  end

  buf << headings.join( " • " )
  buf << "\n\n"


  ## pp TRAITS
  TRAITS.keys.each do |key|

    trait      = TRAITS[key]
    trait_meta = TRAITS_META[key]

    puts "Kai	 Cattribute"
    items = []
    Kai::ALPHABET.each_char do |kai|
      value = trait[kai]
      value = '??'  if value.nil? || value.empty?
      items << [kai, value]
    end

    items.each do |item|
      puts "#{item[0]} #{item[1]}"
    end

    buf << "## #{trait_meta[:name]} (Genes #{trait_meta[:genes]})\n\n"
    buf << make_table( items )
    buf << "\n\n"
  end

  puts buf

  buf
end ## method build

def make_table( items )
  rows = make_rows( items, columns: 4 )
  pp rows

  buf = ""
  buf << "|Kai|Cattribute   |Kai|Cattribute  |Kai|Cattribute  |Kai|Cattribute  |\n"
  buf << "|---|-------------|---|------------|---|------------|---|------------|\n"

  rows.each do |row|
    buf << "| "
    buf <<  row.map {|item| "#{item[0]} | #{item[1]}" }.join( " | " )
    buf << " |\n"
  end

  buf
end


## helpers
def make_rows( items, columns: 4 )
  offset = items.size / columns
  pp offset

  rows = []
  offset.times.with_index do |row|
    ## note: construct [items[row],items[offset+row],items[offset*2+row], ...]
    rows << columns.times.with_index.map { |col| items[offset*col+row] }
  end
  rows
end


  def save( path )
    File.open( path, "w" ) do |f|
      f.write build
    end
  end

end # class TraitsReport


report = TraitsReport.new
report.save( "./TRAITS.md" )
