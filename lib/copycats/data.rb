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
    ActiveRecord::Base.logger = Logger.new( STDOUT )
  end




TRAIT_IDS_CACHE = {}

def setup_in_memory_db
  # Database Setup & Config

  ## ActiveRecord::Base.logger = Logger.new( STDOUT )
  ## ActiveRecord::Base.colorize_logging = false  - no longer exists - check new api/config setting?

  connect( adapter:  'sqlite3',
           database: ':memory:' )

  ## build schema
  CreateDb.new.up

  ### add traits
  TRAITS.each do |trait_key, trait_hash|

    trait_t = Copycats::Model::TraitType.new
    trait_t.name = trait_hash[:name]
    trait_t.key  = trait_key.to_s
    trait_t.save!

    cache = {}

    Kai::ALPHABET.each_char.with_index do |kai,n|
      name = trait_hash[:kai][kai]
      name = '?'  if name.nil? || name.empty?

      tier = Kai::TIER[kai]

      puts "Kai: #{kai} (#{n}) /#{tier}, Cattribute: #{name}"
      trait  = Copycats::Model::Trait.new
      trait.name          = name
      trait.kai           = kai
      trait.n             = n
      trait.tier          = tier
      trait.trait_type_id = trait_t.id
      trait.save!

      cache[ kai ] = trait.id
    end

    TRAIT_IDS_CACHE[ trait_key ] = { id:  trait_t.id,
                                     kai: cache }
  end
end # setup_in_memory_db (using SQLite :memory:)



def setup( data_dir: './data' )
  files = find_datafiles( data_dir )
  pp files

  ## check if files found

  ## setup sqlite in-memory db
  setup_in_memory_db()

  pp TRAIT_IDS_CACHE

  ## add / read / load all datafiles
  files.each_with_index do |file,i|

    puts "== #{i+1}/#{files.size} reading datafile '#{file}'..."

    kitties = CSV.read( file, headers:true )
    pp kitties.headers

    ## note: for now use first 5 rows for testing
    ## kitties[0..4].each do |row|

    ## start of kitties blockchain / genesis
    genesisdate = Date.new( 2017, 11, 23)   ## 2017-11-23

    kitties.each do |row|
      ## puts row['id'] + '|' + row['gen'] + '|' + row['genes_kai']
      k = Copycats::Model::Kitty.new
      k.id        = row['id'].to_i
      k.gen       = row['gen'].to_i
      k.matron_id = row['matron_id']   unless row['matron_id'].blank?
      k.sire_id   = row['sire_id']     unless row['sire_id'].blank?
      k.name      = row['name']        unless row['name'].blank?

      ## todo: pretty print (format genes_kai !!!!)
      k.genes_kai = row['genes'] || row['genes_kai']  ### .gsub( ' ', '' )  ## remove all spaces - why? why not?

      pp row['birthdate']
      birthdate = DateTime.strptime( row['birthdate'], '%Y-%m-%d %H:%M:%S' )
      k.birthdate =  birthdate
      k.day_count = (birthdate.to_date.jd - genesisdate.jd)+1

      ## pp k

      ## print ids for progress report - why? why not?
      print "#{k.id}."
      k.save!

      ## add genes
      genome = Genome.new( k.genes_kai )
      genes =  genome.genes

      TRAITS.each_with_index do |(trait_key, trait_hash),i|
        gene    = genes[trait_key]
        next  if gene.nil?   ## skip future_1, future_2, etc. for now - add - why? why not?

        puts "#{trait_hash[:name]} (Genes #{trait_hash[:genes]})\n\n"

        ## note: start counting for d.n with 1 (NOT 0)
        ##  use idx for zero-based counting - why? why not?

        d = Copycats::Model::Gene.new
        d.kitty_id = k.id
        d.n        = (i*4)     # gene number/pos  0-47  (start w/ 1 why? why not?)
        d.gene     = 'd'     # d (0), r1 (1), r2 (2), r3 (3)
        d.gene_n   = 0       # 0-3  (0=d,1=r1,2=r2,3=r3)
        d.trait_id = TRAIT_IDS_CACHE[trait_key][:kai][gene.d]
        d.save!

        r1 = Copycats::Model::Gene.new
        r1.kitty_id = k.id
        r1.n        = (i*4)+1     # gene number/pos  0-47  (start w/ 1 why? why not?)
        r1.gene     = 'r1'     # d (0), r1 (1), r2 (2), r3 (3)
        r1.gene_n   = 1       # 0-3  (0=d,1=r1,2=r2,3=r3)
        r1.trait_id = TRAIT_IDS_CACHE[trait_key][:kai][gene.r1]
        r1.save!

        r2 = Copycats::Model::Gene.new
        r2.kitty_id = k.id
        r2.n        = (i*4)+2   # gene number/pos  0-47  (start w/ 1 why? why not?)
        r2.gene     = 'r2'     # d (0), r1 (1), r2 (2), r3 (3)
        r2.gene_n   = 2       # 0-3  (0=d,1=r1,2=r2,3=r3)
        r2.trait_id = TRAIT_IDS_CACHE[trait_key][:kai][gene.r2]
        r2.save!

        r3 = Copycats::Model::Gene.new
        r3.kitty_id = k.id
        r3.n        = (i*4)+3     # gene number/pos  0-47  (start w/ 1 why? why not?)
        r3.gene     = 'r3'     # d (0), r1 (1), r2 (2), r3 (3)
        r3.gene_n   = 3       # 0-3  (0=d,1=r1,2=r2,3=r3)
        r3.trait_id = TRAIT_IDS_CACHE[trait_key][:kai][gene.r3]
        r3.save!
      end

    end
    print "\n"
  end
end
