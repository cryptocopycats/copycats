# encoding: utf-8

module Copycats

class Tool

def run( args )
  opts = {}

  parser = OptionParser.new do |cmd|
    cmd.banner = "Usage: kitty [options]"

    cmd.separator ""
    cmd.separator "  Database options:"

    cmd.on("-n", "--dbname=NAME", "Database name (default: kitties.db)") do |name|
      opts[:db_name] = name
    end

    cmd.on("-d", "--dbpath=PATH", "Database path (default: .)") do |path|
      opts[:db_path] = path
    end

    cmd.separator ""
    cmd.separator "  Data options:"

    cmd.on("-i", "--include=DIR", "Data directory (default: ./data for in-memory queries and . for setup)") do |name|
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
  pp args


  db_path = opts[:db_path] || '.'
  db_name = opts[:db_name] || 'kitties.db'
  database = "#{db_path}/#{db_name}"


  if args.size == 1 && args[0] == 'setup'   ## setup database
    connect( adapter: 'sqlite3',
             database: database )

    setup_db
    setup_traits  # note: also builds TRAIT_IDS_CACHE for read_datafiles for now

    data_dir = opts[:data_dir] || '.'    ## for setup assume local dir for data
    read_datafiles( data_dir: data_dir )
  else
    ## check if (local) database exists?
    if File.exist?( database )   ##   if yes, use "cached" local database
      connect( adapter: 'sqlite3',
               database: database )
    else                         ##  otherwise use (new) on-demand in-memory database
      puts "note: database >#{database}<; setting up in-memory database"
      connect( adapter:  'sqlite3',
               database: ':memory:' )

      setup_db
      setup_traits  # note: also builds TRAIT_IDS_CACHE for read_datafiles for now

      data_dir = opts[:data_dir] || './data'
      read_datafiles( data_dir: data_dir )
    end



    if args.size == 1
      id = args[0].to_i
      kitty = Copycats::Model::Kitty.find( id )

      ## pp kitty
      ## pp kitty.genes
      ## pp kitty.body
      ## pp kitty.pattern
      ## pp kitty.genes.to_a

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
      puts "error: too many arguments (expected setup or one or two kitty ids / names / genes)"
    end
  end
end  ## method run


end   ## class Tool

end   ## module Copycats
