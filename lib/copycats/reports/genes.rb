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
      code  = '%02d' % Kai::NUMBER[kai]   ## e.g. 00, 01, 02, etc.
      value = '?'  if value.nil? || value.empty?
      items << [kai, code, value]
    end

    items.each do |item|
      puts "#{item[0]} #{item[1]} #{item[2]}"
    end

    buf << "## #{trait[:name]} (#{trait[:code]}) - Genes #{trait[:genes]}\n\n"
    buf << make_table( items )
    buf << "\n\n"
  end

  puts buf

  buf
end ## method build


##
## todo/fix: use "shared" link helpers!!!!!
def kitties_search( q )
 "https://www.cryptokitties.co/search?include=sale,sire,other&search=#{q}"
end


def make_table( items )
  rows = make_rows( items, columns: 4 )
  pp rows

  buf = ""
  buf << "|Kai|Code|Cattribute   |Kai|Code|Cattribute  |Kai|Code|Cattribute  |Kai|Code|Cattribute  |\n"
  buf << "|---|----|-------------|---|----|------------|---|----|------------|---|----|------------|\n"

  rows.each do |row|
    buf << "| "

    parts = row.map do |item|
      kai  = item[0]
      name = item[2]

      if name == '?'
        cattribute = "?"
      else
        cattribute = "**#{kitties_search(name)}** #{MEWTATION_LEVEL[kai]}"
      end

      "#{item[0]} | #{item[1]} | #{cattribute}"
    end

    buf << parts.join( " | " )
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
