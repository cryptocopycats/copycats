# encoding: utf-8

module Copycats

class Tool

def run( args )
  opts = {}

  parser = OptionParser.new do |cmd|
    cmd.banner = "Usage: kitty [options]"

    cmd.separator ""
    cmd.separator "  Data options:"

    cmd.on("-i", "--include=DIR", "Data directory (default: ./data)") do |name|
      opts[:data_dir] = name
    end

    cmd.separator ""
    cmd.separator "  General options:"

    cmd.on("-h", "--help", "Prints this help") do
      puts cmd
      exit
    end
  end

  parser.parse!( args )
  pp opts


  data_dir = opts[:data_dir] || './data'

  setup( data_dir: data_dir )

  pp args

  if args.size == 1
    id = args[0].to_i
    kitty = Copycats::Model::Kitty.find( id )
    ## pp k

    buf = KittyReport.new( kitty ).build

    puts buf
  elsif args.size == 2
    matron_id = args[0].to_i
    sire_id   = args[1].to_i

    matron = Copycats::Model::Kitty.find( matron_id )
    sire   = Copycats::Model::Kitty.find( sire_id )
    ## pp matron

    buf = MixReport.new( matron, sire ).build

    puts buf
  else
    puts "error: too many arguments (expected one or two kitty ids / names / genes)"
  end
end  ## method run


end   ## class Tool

end   ## module Copycats
