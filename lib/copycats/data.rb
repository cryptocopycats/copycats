# encoding: utf-8


## load all *.file in data folder



def find_datafiles( root='.' )
  files = []
  ## todo/check: include all subfolders - why? why not?
  Dir.glob( root + '/**/*.csv' ).each do |file|
    files << file
  end
  files
end


def connect( config={} )
  if config.empty?
    puts "ENV['DATBASE_URL'] - >#{ENV['DATABASE_URL']}<"

    ### change default to ./copycats.db ?? why? why not?
    db = URI.parse( ENV['DATABASE_URL'] || 'sqlite3:///kitties.db' )

    if db.scheme == 'postgres'
        config = {
          adapter: 'postgresql',
          host: db.host,
          port: db.port,
          username: db.user,
          password: db.password,
          database: db.path[1..-1],
          encoding: 'utf8'
        }
      else # assume sqlite3
       config = {
         adapter: db.scheme, # sqlite3
         database: db.path[1..-1] # world.db (NB: cut off leading /, thus 1..-1)
      }
      end
    end

    puts "Connecting to db using settings: "
    pp config
    ActiveRecord::Base.establish_connection( config )
    # ActiveRecord::Base.logger = Logger.new( STDOUT )
  end


def setup_in_memory_db
  # Database Setup & Config

  ## ActiveRecord::Base.logger = Logger.new( STDOUT )
  ## ActiveRecord::Base.colorize_logging = false  - no longer exists - check new api/config setting?

  connect( adapter:  'sqlite3',
           database: ':memory:' )

  ## build schema
  CreateDb.new.up
end # setup_in_memory_db (using SQLite :memory:)



def setup( data_dir: './data' )
  files = find_datafiles( data_dir )
  pp files

  ## check if files found

  ## setup sqlite in-memory db
  setup_in_memory_db()


  ## add / read / load all datafiles
  files.each_with_index do |file,i|

    puts "== #{i+1}/#{files.size} reading datafile '#{file}'..."

    kitties = CSV.read( file, headers:true )
    pp kitties.headers

    ## note: for now use first 5 rows for testing
    ## kitties[0..4].each do |row|
    kitties.each do |row|
      ## puts row['id'] + '|' + row['gen'] + '|' + row['genes_kai']
      k = Copycats::Model::Kitty.new
      k.id    = row['id'].to_i
      k.gen   = row['gen'].to_i
      k.genes = row['genes_kai']
      ## pp k

      ## print ids for progress report - why? why not?
      print "#{k.id}."
      k.save!
    end
    print "\n"
  end
end
