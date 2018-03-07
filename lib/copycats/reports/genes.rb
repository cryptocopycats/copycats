# encoding: utf-8


class GenesReport

def build
  buf = ""
  buf << "# Genes (#{TRAITS.keys.size} x 4)\n\n"

  headings = []
  TRAITS.values.each do |trait|
    headings << "#{trait[:name]} (#{trait[:genes]})"
  end

  buf << headings.join( " • " )
  buf << "\n\n"


  ## pp TRAITS
  TRAITS.values.each do |trait|

    puts "Kai	 Cattribute"
    items = []
    Kai::ALPHABET.each_char do |kai|
      value = trait[:kai][kai]
      value = '?'  if value.nil? || value.empty?
      items << [kai, value]
    end

    items.each do |item|
      puts "#{item[0]} #{item[1]}"
    end

    buf << "## #{trait[:name]} (Genes #{trait[:genes]})\n\n"
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

end # class GenesReport
