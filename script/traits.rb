# encoding: utf-8

####
# use:
#  $ ruby -I ./lib script/traits.rb


require 'copycats'



### todo/fix:
## move meta to traits!!!

TRAITS_META = {
  body:      { genes: '0-3',   name: 'Fur' },
  pattern:   { genes: '4-7',   name: 'Pattern' },
  coloreyes: { genes: '8-11',  name: 'Eye Color' },
  eyes:      { genes: '12-15', name: 'Eye Shape' },
  color1:    { genes: '16-19', name: 'Base Color' },
  color2:    { genes: '20-23', name: 'Highlight Color' },
  color3:    { genes: '24-27', name: 'Accent Color' },
  wild:      { genes: '28-31', name: 'Wild' },
  mouth:     { genes: '32-35', name: 'Mouth' }
}


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

File.open( "./TRAITS.md", "w" ) do |f|
  f.write buf
end
