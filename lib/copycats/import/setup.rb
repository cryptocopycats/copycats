# encoding: utf-8


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
  ## ActiveRecord::Base.colorize_logging = false  - no longer exists - check new api/config setting?

  ## if sqlite3 add (use) some pragmas for speedups
  if config[:adapter] == 'sqlite3'
      ## check/todo: if in memory e.g. ':memory:' no pragma needed!!
      con = ActiveRecord::Base.connection
      con.execute( 'PRAGMA synchronous=OFF;' )
      con.execute( 'PRAGMA journal_mode=OFF;' )
      con.execute( 'PRAGMA temp_store=MEMORY;' )
  end
end  ## method connect


def setup_db
  ## build schema
  CreateDb.new.up
end



### todo/fix:
##  make trait_ids_cache more (re)usable - fix global!!!!
TRAIT_IDS_CACHE = {}


def setup_traits
  ## for speed - turn off logging for info/debug/etc. levels
  ActiveRecord::Base.logger.level = :warn

  ### add traits
  TRAITS.each do |trait_key, trait_hash|

    trait_t = Copycats::Model::TraitType.new
    trait_t.name = trait_hash[:name]
    trait_t.key  = trait_key.to_s
    trait_t.save!

    cache = {}

    Kai::ALPHABET.each_with_index do |kai,n|
      name = trait_hash[:kai][kai]
      name = '?'  if name.nil? || name.empty?

      tier = Gene::TIER[kai]

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
end
