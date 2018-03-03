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


## pp TRAITS
TRAITS.keys.each do |key|

  trait      = TRAITS[key]
  trait_meta = TRAITS_META[key]

  puts "## #{trait_meta[:name]} (Genes #{trait_meta[:genes]})\n\n"

  puts "Kai	 Cattribute"
  Base32::ALPHABET.each_char do |kai|
    value = trait[kai]
    value = '??'  if value.nil? || value.empty?
    puts "#{kai} #{value}"
  end

  puts "\n\n"
end
