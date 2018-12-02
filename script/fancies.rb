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



def kitties_kitty_url( id )
  "https://www.cryptokitties.co/kitty/#{id}"
end


def kitties_search_url( key, h )
  ## note: use (official) chinese name for search param if present
  param =  h[:name_cn] ? h[:name_cn] : key

  if h[:special]
    q = "specialedition:#{param}"    ## todo: urlescape param - why? why not?
  elsif h[:exclusive]   ## just use fancy too - why? why not?
    q = "exclusive:#{param}"
  else  ## assume fancy
    q = "fancy:#{param}"
  end

  "https://www.cryptokitties.co/search?include=sale,sire,other&search=#{q}"
end



FANCIES.each do |key,h|

  name = h[:name]
  name << " (#{h[:name_cn]})"  if h[:name_cn]   # add chinese name if present


  line = "[**#{name}**]"
  line << "(#{kitties_search_url( key, h )})"

  limit = h[:limit] ? h[:limit] : '?'  # add limit if present/known
  line << " (#{limit})"

  buf << line
  buf << "\n"
end


buf << "\n\n\n"


##################
## step 2 - add fancy cat details / chronic

=begin
Nov 26, 2018
- [**Draco Junior**](https://www.cryptokitties.co/search/all?search=fancy:DracoJunior) Fancy Cat is discovered. #Fancy Cat

Nov 21, 2018
- [**Dreggo Fancy**](https://www.cryptokitties.co/search/all?search=fancy:Dreggo) Cat is discovered. #Fancy Cat
=end


FANCIES.each do |key,h|
  date = Date.strptime( h[:date], '%Y-%m-%d' )

  buf << "\n"
  buf << date.strftime( '%b %-d, %Y')
  buf << "\n"


  name = h[:name]
  name << " (#{h[:name_cn]})"  if h[:name_cn]   # add chinese name if present

  line = "- [**#{name}**]"
  line << "(#{kitties_search_url( key, h )})"

  limit = h[:limit] ? h[:limit] : '?'  # add limit if present/known

  if h[:ids]
    id_links = h[:ids].map { |id| "[##{id}](#{kitties_kitty_url(id)})" }
    line << " (#{limit} - #{id_links.join(', ')})"
  else
    line << " (#{limit})"
  end


  if h[:special]
    line << " Fancy Cat released"
    line << " -- #{h[:desc]}"    if h[:desc]
    line << "."
    line << " #Fancy Cat #Special Edition"
  elsif h[:exclusive]
    line << " Fancy Cat released"
    line << " -- #{h[:desc]}"    if h[:desc]
    line << "."
    line << " #Fancy Cat #Exclusive"
  else
    line << " Fancy Cat discovered"
    line << " -- #{h[:desc]}"    if h[:desc]
    line << "."
    line << " #Fancy Cat"
  end

  buf << line
  buf << "\n"

  buf << "\n"
  buf << "![](../i/200x200/fancy-#{key}.png)"
  buf << "\n"
end




puts buf


File.open( "./updates/FANCIES.v2.md", 'w:utf-8' ) do |f|
  f.write buf
end

puts "Done."
