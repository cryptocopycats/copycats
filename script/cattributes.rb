# encoding: utf-8

require 'csvreader'
require 'pp'


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


###
## todo/fix: use TRAITS from copycats lib!!!


TRAITS =
{
  body:        {  genes: '0-3',   name: 'Fur',             code: 'FU' },
  pattern:     {  genes: '4-7',   name: 'Pattern',         code: 'PA' },
  coloreyes:   {  genes: '8-11',  name: 'Eye Color',       code: 'EC' },
  eyes:        {  genes: '12-15', name: 'Eye Shape',       code: 'ES' },
  color1:      {  genes: '16-19', name: 'Base Color',      code: 'BC' },      ##  colorprimary / body color
  color2:      {  genes: '20-23', name: 'Highlight Color', code: 'HC' }, ## colorsecondary / sec color / pattern color
  color3:      {  genes: '24-27', name: 'Accent Color',    code: 'AC' }, ## colortertiary
  wild:        {  genes: '28-31', name: 'Wild',               code: 'WE' },
  mouth:       {  genes: '32-35', name: 'Mouth',              code: 'MO' },
  environment: {  genes: '36-39', name: 'Environment',        code: 'EN' }, ## todo/fix: change to environment
##  secret:      {  genes: '40-43', name: 'Secret', code: 'SE' },      ## todo: change to Y Gene or Y (see https://guide.cryptokitties.co/guide/cat-features/genes)
##  prestige:    {  genes: '44-47', name: 'Purrstige',          code: 'PU' }    ## todo/fix: change to purrstige
}


## (quick 'n' dirty) kai to mewtation level (I,II,III,IIII)
MEWTATION_LEVEL = {
  '1' => '',
  '2' => '',
  '3' => '',
  '4' => '',
  '5' => '',
  '6' => '',
  '7' => '',
  '8' => '',
  '9' => '',
  'a' => '',
  'b' => '',
  'c' => '',
  'd' => '',
  'e' => '',
  'f' => '',
  'g' => '',
  'h' => 'I',
  'i' => 'I',
  'j' => 'I',
  'k' => 'I',
  'm' => 'I',
  'n' => 'I',
  'o' => 'I',
  'p' => 'I',
  'q' => 'II',
  'r' => 'II',
  's' => 'II',
  't' => 'II',
  'u' => 'III',
  'v' => 'III',
  'w' => 'IIII',
  'x' => ''
}

KAI_ALPHABET = '123456789abcdefghijkmnopqrstuvwx'




buf = ""
buf += <<TXT
# Cattributes Statistics / Rarity

(Source: [`api.cryptokitties.co/cattributes` (JSON)](https://api.cryptokitties.co/cattributes), [(CSV)](../datasets/cattributes.csv))


TXT




def kitties_search( q )
 "https://www.cryptokitties.co/search?include=sale,sire,other&search=#{q}"
end



TRAITS.each do |key,h|
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

    kai   = KAI_ALPHABET[code.to_i]

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
