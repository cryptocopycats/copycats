# encoding: utf-8

####
# use:
#  $ ruby -I ./lib script/fancies.rb


require 'copycats'


pp FANCIES


buf = ""
buf += <<TXT
# Updates - Fancies / Exclusives / Special Editions - Timeline

see <https://updates.cryptokitties.co>


TXT


FANCIES.each do |key,h|

  name = h[:name]
  name << " (#{h[:name_cn]})"  if h[:name_cn]   # add chinese name if present

  exclusive = h[:exclusive]
  special   = h[:special]


  line = "[**#{name}**]"

  base = "https://www.cryptokitties.co/search?include=sale,sire,other&search="

  if h[:special]
    query = "specialedition:#{key}"    ## todo: urlescape key - why? why not?
  elsif h[:exclusive]   ## just use fancy too - why? why not?
    query = "exclusive:#{key}"
  else  ## assume fancy
    query = "fancy:#{key}"
  end

  line << "(#{base}#{query})"

  line << " (#{h[:limit]})"   if h[:limit]   # add limit if present/known

  # [**Puss For Progress**](https://www.cryptokitties.co/marketplace/all?search=fancy%3Apussforprogress) (1 920)
  # [**Fortune Cat (红包喵)**](https://www.cryptokitties.co/marketplace/

  buf << line
  buf << "\n"
end

puts buf


File.open( "./updates/FANCIES.v2.md", 'w:utf-8' ) do |f|
  f.write buf
end

puts "Done."
