# encoding: utf-8

####
# use:
#  $ ruby -I ./lib script/cattributes.rb


require 'copycats'



recs = CsvHash.read( "./datasets/cattributes.csv" )
pp recs


## group by type

types = {}

recs.each do |h|
  key = h['Type'].to_sym
  rec = types[ key ] ||= [0,[]]

  rec[ 0 ] += h['Total'].to_i   ## up totals
  rec[ 1 ] << [h['Name'],h['Code'],h['Total'].to_i]
end


pp types



buf = ""
buf += <<TXT
# Cattributes Statistics / Rarity

(Source: [`api.cryptokitties.co/cattributes` (JSON)](https://api.cryptokitties.co/cattributes), [(CSV)](../datasets/cattributes.csv))


TXT




def kitties_search( q )
 "https://www.cryptokitties.co/search?include=sale,sire,other&search=#{q}"
end



TRAITS.each do |key,h|
  next if [:secret, :prestige].include?( key )    ## skip secret and prestige traits for now

  rec = types[ key ]
  total = rec[0]
  items = rec[1]

  buf << "## #{h[:name]} (Genes #{h[:genes]})\n\n"

  buf << "_#{total} Cats with #{items.size} Cattributes_\n\n"

  buf << "| #|Total (%)|Cattribute|Code|Kai|\n"
  buf << "|-:|--------:|----------|----|---|\n"


  items.each_with_index do |item,i|

    name  = item[0]
    code  = item[1]
    count = item[2]

    kai   = Kai::ALPHABET[code.to_i]

    rank  = "#{i+1}/#{items.size}"


    percent = Float(100*count)/Float(total)

    buf << "| #{rank} | #{count} (#{('%2.2f' % percent)}) | "
    buf << "[**#{name}**](#{kitties_search(name)}) "
    buf << "#{MEWTATION_LEVEL[kai]} | #{h[:code]}#{code} | #{kai} |"

    buf << "\n"
  end

  buf << "\n\n"
end

puts buf

File.open( "./updates/CATTRIBUTES.md", "w:utf-8" ) do |f|
  f.write buf
end
