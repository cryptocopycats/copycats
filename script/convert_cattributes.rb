# encoding: utf-8


require 'json'
require 'pp'

txt = File.read( "./dl/cattributes-2018-12-04.json" )

data = JSON.parse( txt )
pp data
puts "size: #{data.size}"


data = data.reverse  ## note: list most rare first / most popular last


TYPE_MAPPINGS =
{
  'colorprimary'   => 'color1',
  'colorsecondary' => 'color2',
  'colortertiary'  => 'color3'
}


recs = []
data.each do |row|
  rec = []

  rec << row['total']

  rec << row['description']

  # note: for prestige / purrstige - gene is nil (not applicable)
  #
  #  {
  # description: "duckduckcat",
  # type: "prestige",
  # gene: null,
  # total: "1249"
  # },
  # {
  # description: "thatsawrap",
  # type: "prestige",
  # gene: null,
  # total: "615"
  # },

  type = row['type']
  if type == 'prestige'    ## note: skip prestige for now (add to fancy types)
    puts "skipping row with type prestige:"
    pp row
    next
  end

  type = TYPE_MAPPINGS[ type ]    if TYPE_MAPPINGS[ type ]
  rec << type


  num = row['gene']
  if num
    rec << ('%02d' % num)
  else   # assume num is nil
    rec << '-n/a-'    # note: for prestige / purrstige - gene is nil (not applicable)
  end

  recs << rec
end

pp recs


csv = ""

csv << ("%-6s, %-15s, %-14s, %-4s" % ['Total', 'Name', 'Type', 'Code'])
csv << "\n"
recs.each_with_index do |rec,i|
  csv << ("%6s, %-15s, %-14s, %4s" % rec)
  csv << "\n"
  ## break if i > 5
end


File.open( "./datasets/cattributes.csv", "w:utf-8" ) do |f|
  f.write csv
end
