# encoding: utf-8

####
# use:
#  $ ruby -I ./lib script/fancies.rb


require 'copycats'


pp FANCIES


buf = ""
buf += <<TXT
# Updates - "Normal" / Exclusive / Special Edition Fancy Cats - Timeline

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

specials   = {}  # special edition fancies
exclusives = {}  # exclusive fancies
fancies    = {}  # "normal" fancies

FANCIES.each do |key,h|
  if h[:special]
    specials[key] = h
  elsif h[:exclusive]
    exclusives[key] = h
  else
    fancies[key] = h
  end
end



def build_fancy( key, h )
  name = ""
  name << h[:name]
  name << " (#{h[:name_cn]})"  if h[:name_cn]   # add chinese name if present

  line = "[**#{name}**]"
  line << "(#{kitties_search_url( key, h )})"

  limit = h[:limit] ? h[:limit] : '?'  # add limit if present/known
  line << " (#{limit})"
  line
end


def build_fancies( fancies )
  buf = ""
  fancies.each do |key,h|
    buf << build_fancy( key, h )
    buf << "\n"
  end
  buf
end


buf << "## Special Edition Fancy Cats (#{specials.size})"
buf << "\n\n"
buf << build_fancies( specials )
buf << "\n\n\n"

buf << "## Exclusive Fancy Cats (#{exclusives.size})"
buf << "\n\n"
buf << build_fancies( exclusives )
buf << "\n\n\n"

buf << %Q{## "Normal" Fancy Cats (#{fancies.size})}
buf << "\n\n"
buf << build_fancies( fancies )
buf << "\n\n\n"


##################
## step 2 - add fancy cat details / chronic


month = nil
year  = nil
last_date = nil

FANCIES.each do |key,h|
  date = Date.strptime( h[:date], '%Y-%m-%d' )

  if year != date.year
    buf << "\n"
    buf << "\n"
    buf << "## #{date.year}"
    buf << "\n"
  end

  if month != date.month
    buf << "\n"
    buf << "### #{date.strftime( '%B')}"
    buf << "\n"
  end

  year  = date.year
  month = date.month


  buf << "\n"

  if last_date != date
    buf << date.strftime( '%b %-d, %Y')
    buf << "\n"
  end
  last_date = date


  name = ""
  name << h[:name]
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


File.open( "./updates/FANCIES.md", 'w:utf-8' ) do |f|
  f.write buf
end

puts "Done."
