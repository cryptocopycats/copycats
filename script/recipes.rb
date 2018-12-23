# encoding: utf-8

####
# use:
#  $ ruby -I ./lib script/recipes.rb


require 'copycats'




pp Catalog.prestiges


buf = ""
buf += <<TXT
# Updates - Trait Recipes / Formulas  - Purrstige Cattributes, Fancy Cats - Timeline

see <https://updates.cryptokitties.co>


TXT


def kitties_search_url( key, h )
  ## note: use (official) chinese name for search param if present
  param =  h[:name_cn] ? h[:name_cn] : key

  if h[:special]
    q = "specialedition:#{param}"    ## todo: urlescape param - why? why not?
  elsif h[:exclusive]   ## just use fancy too - why? why not?
    q = "exclusive:#{param}"
  elsif h[:prestige]
    q = "purrstige:#{param}"
  else  ## assume fancy
    q = "fancy:#{param}"
  end

  "https://www.cryptokitties.co/search?include=sale,sire,other&search=#{q}"
end

def build_fancy( key, h )
  name = ""
  name << h[:name]
  name << " (#{h[:name_cn]})"  if h[:name_cn]   # add chinese name if present

  line = "[**#{name}**]"
  line << "(#{kitties_search_url( key, h )})"

  line << " (#{h[:limit] ? h[:limit] : '?'}"    # add limit if present/known
  line << "+#{h[:overflow]}"    if h[:overflow]
  line << ")"
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


def build_prestige( key, h )
  name = ""
  name << h[:name]

  line = "[**#{name}**]"
  line << "(#{kitties_search_url( key, h )})"

  line << " (#{h[:limit] ? h[:limit] : '?'}"    # add limit if present/known
  line << "+#{h[:overflow]}"    if h[:overflow]
  line << ")"
  line
end


def build_prestiges( fancies )
  buf = ""
  fancies.each do |key,h|
    buf << build_prestige( key, h )
    buf << "\n"
  end
  buf
end




buf << "## Purrstige Cattibutes (#{Catalog.prestiges.size})"
buf << "\n\n"
buf << build_prestiges( Catalog.prestiges )
buf << "\n\n\n"

buf << "## Fancy Cats (#{Catalog.fancies.size})"
buf << "\n\n"
buf << build_fancies( Catalog.fancies )
buf << "\n\n\n"




def build_trait( key )
  if key =~ /[A-Z]{2}[0-9]{2}/   # if code e.g. WE20 - keep as is
     "**#{key}**"
  elsif key =~ /_[0-9a-z]$/  # if base32 code e.g. wild_d - keep as is for now too
     "**#{key}**"
  elsif key == 'totesbasic'   ## quick hack for now - totesbasic has *3* genes
    "**totesbasic** - Pattern (PA14, PA15, PA23 / f, g, p)"
  else
    puts "lookup trait >#{key}<"
    trait = TRAITS_BY_NAME[ key ]
    pp trait
    # rec[:name] = name
    # rec[:kai]  = kai
    # rec[:code] = code
    # rec[:type] = key   ## todo - use trait instead of type  (use string not symbol?) - why? why not?

    line = ""
    line << "**#{trait[:name]}** #{MEWTATION_LEVEL[trait[:kai]]} - "
    line << "#{TRAITS[trait[:type]][:name]} "
    line << "("
    line << trait[:code]
    line << " / "
    line << trait[:kai]
    line << ")"
    line
  end
end

def build_traits( key_or_keys )
  if key_or_keys.is_a? Array
    keys = key_or_keys
    keys.map do |key|
      build_trait( key )
    end.join(', ')
  else
    key = key_or_keys
    build_trait( key )
  end
end



buf << "## Purrstige Cattibutes"
buf << "\n\n"

Catalog.prestiges.each do |key,h|
  date = Date.strptime( h[:date], '%Y-%m-%d' )

  time_start = Date.strptime( h[:time][:start], '%Y-%m-%d' )
  time_end   = Date.strptime( h[:time][:end],   '%Y-%m-%d' )

  time_days  = (time_end.to_date.jd - time_start.to_date.jd) + 1

  name = ""
  name << h[:name]

  buf << "[**#{name}**]"
  buf << "(#{kitties_search_url( key, h )})"
  buf << "   "

  if time_start.year == time_end.year
    buf << time_start.strftime( '%b %-d')
  else   # include year
    buf << time_start.strftime( '%b %-d %Y')
  end
  buf << " - "
  buf << time_end.strftime( '%b %-d %Y')
  buf << " (#{time_days}d),"

  buf << " #{h[:traits].size} traits:"
  buf << "\n"

  ## traits:
  h[:traits].each do |trait_keys|
    buf << "- "
    buf << build_traits( trait_keys )
    buf << "\n"
  end

  buf << "\n\n"
end




buf << "## Fancy Cats"
buf << "\n\n"

Catalog.fancies.each do |key,h|

  name = ""
  name << h[:name]

  buf << "[**#{name}**]"
  buf << "(#{kitties_search_url( key, h )})"
  buf << "   "

  if h[:time]
    if h[:time][:start]
      time_start = Date.strptime( h[:time][:start], '%Y-%m-%d' )
    else  ## "fallback" to discovery date
      time_start = Date.strptime( h[:date], '%Y-%m-%d' )
    end
    time_end   = Date.strptime( h[:time][:end],   '%Y-%m-%d' )

    time_days  = (time_end.to_date.jd - time_start.to_date.jd) + 1


    if time_start.year == time_end.year
      buf << time_start.strftime( '%b %-d')
    else   # include year
      buf << time_start.strftime( '%b %-d %Y')
    end
    buf << " - "
    buf << time_end.strftime( '%b %-d %Y')
    buf << " (#{time_days}d),"
  end

  buf << " #{h[:traits].size} traits:"
  buf << "\n"

  ## traits:
  h[:traits].each do |trait_keys|
    buf << "- "
    buf << build_traits( trait_keys )
    buf << "\n"
  end

  buf << "\n\n"
end



puts buf

File.open( "./updates/RECIPES.md", 'w:utf-8' ) do |f|
  f.write buf
end

puts "Done."
