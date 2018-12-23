# encoding: utf-8


###############################
#  cryptokitties.co links

def kitties_kitty_url( id )
  "https://www.cryptokitties.co/kitty/#{id}"
end

def kitties_search_url( key, h )
  ## todo/fix: add h[:name] to hash (no need for key)

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




################################
#  /media - image links

def media_fancy_pic_url( key, variant_key=nil )    ### todo: find a better name - why? why not?
  if variant_key
    "https://cryptocopycats.github.io/media/kitties/100x100/fancy-#{key}-#{variant_key}.png"
  else
    "https://cryptocopycats.github.io/media/kitties/100x100/fancy-#{key}.png"
  end
end
