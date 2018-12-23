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




buf << "## Purrstige Cattributes (#{Catalog.prestiges.size})"
buf << "\n\n"
buf << "_Special traits for a limited time only bred through a recipe._"
buf << "\n\n"
buf << build_prestiges( Catalog.prestiges )
buf << "\n\n\n"


buf << "## Fancy Cats (#{Catalog.fancies.size})"
buf << "\n\n"
buf << "_Cool-looking cats (with special art work) in limited quantities or for a limited time only bred through a recipe._"
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



buf << "## Purrstige Cattributes"
buf << "\n\n"

Catalog.prestiges.each do |key,h|
  date = Date.strptime( h[:date], '%Y-%m-%d' )

  time_start = Date.strptime( h[:time][:start], '%Y-%m-%d' )
  time_end   = Date.strptime( h[:time][:end],   '%Y-%m-%d' )

  time_days  = (time_end.to_date.jd - time_start.to_date.jd) + 1

  name = ""
  name << h[:name]

  buf << "[**#{name}**]"
  buf << "(#{kitties_search_url( key, h )}) "

  buf << " (#{h[:limit] ? h[:limit] : '?'}"     # add limit if present/known
  buf << "+#{h[:overflow]}"   if h[:overflow]
  buf << "), "


  if time_start.year == time_end.year
    buf << time_start.strftime( '%b %-d')
  else   # include year
    buf << time_start.strftime( '%b %-d %Y')
  end
  buf << " - "
  buf << time_end.strftime( '%b %-d %Y')
  buf << " (#{time_days}d)"
  buf << " - **OPEN**" if h[:open]    # available for breeding now? NOT locked?
  buf << ", "


  buf << " **#{h[:traits].size}** traits:"
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
  buf << "(#{kitties_search_url( key, h )}) "

  buf << " (#{h[:limit] ? h[:limit] : '?'}"     # add limit if present/known
  buf << "+#{h[:overflow]}"   if h[:overflow]
  buf << "), "

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
    buf << " (#{time_days}d)"

    buf << " - **OPEN**" if h[:open]    # available for breeding now? NOT locked?
    buf << ", "
  end

  buf << " **#{h[:traits].size}** traits"
  buf << " + #{h[:variants].size} variants"  if h[:variants]
  buf << ":"
  buf << "\n"

  ## traits:
  h[:traits].each do |trait_keys|
    buf << "- "
    buf << build_traits( trait_keys )
    buf << "\n"
  end

  if h[:variants]
    h[:variants].each do |variant_key,variant_h|
      buf << "  - **#{variant_h[:name]}** (#{variant_h[:limit]}), **#{variant_h[:traits].size}** trait:\n"
      variant_h[:traits].each do |trait_keys|
        buf << "     - "
        buf << build_traits( trait_keys )
        buf << "\n"
      end
    end
  end


  ## add pics too (why? why not?)
  buf << "\n"

  if h[:variants]
    h[:variants].each do |variant_key,variant_h|
      buf << "![](#{media_fancy_pic_url( key, variant_key )})"
      buf << "\n"
    end
  else
    buf << "![](#{media_fancy_pic_url( key )})"
    buf << "\n"
  end

  buf << "\n\n"
end



puts buf

File.open( "./updates/RECIPES.md", 'w:utf-8' ) do |f|
  f.write buf
end

puts "Done."
