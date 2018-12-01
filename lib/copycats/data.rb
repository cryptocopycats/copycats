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

    Kai::ALPHABET.each_char.with_index do |kai,n|
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


def read_datafiles( data_dir: './data' )
  files = find_datafiles( data_dir )
  pp files

  ## todo: check if files found


  ## for speed - turn off logging for info/debug/etc. levels
  ActiveRecord::Base.logger.level = :warn


  ## pp TRAIT_IDS_CACHE

  ## add / read / load all datafiles
  files.each_with_index do |file,i|

    puts "== #{i+1}/#{files.size} reading datafile '#{file}'..."


    kitties_headers = CsvReader.header( file )
    pp kitties_headers

    ##  todo: fix - use field index not name!!!! - why? why not?
    ## check format
    if kitties_headers.include?( 'id' ) &&
       kitties_headers.include?( 'gen' ) &&
       kitties_headers.include?( 'matron_id' ) &&
       kitties_headers.include?( 'sire_id' ) &&
       kitties_headers.include?( 'birthdate' ) &&
       kitties_headers.include?( 'genes' ) &&
       kitties_headers.include?( 'name' )
       ## "standard" format
       ##   required headers include: id, gen, matron_id, sire_id, birthdate, genes, name

       ##  todo: fix - use field index not name!!!! - why? why not?
       headers = {
         'id'         => 'id',
         'gen'        => 'gen',
         'matron_id'  => 'matron_id',
         'sire_id'    => 'sire_id',
         'birthdate'  => 'birthdate',
         'genes'      => 'genes',
         'name'       => 'name'
       }
    elsif kitties_headers.include?( 'id' ) &&
          kitties_headers.include?( 'matron_id' ) &&
          kitties_headers.include?( 'sire_id' ) &&
          kitties_headers.include?( 'gen' ) &&
          kitties_headers.include?( 'birth_date' ) &&
          kitties_headers.include?( 'genes_kai' )
      ## "kittydex" format
      ##   see  https://cryptokittydex.com/resources
      ##    required headers include: id, matron_id, sire_id, gen, birth_date, genes_kai
       headers = {
         'id'         => 'id',
         'matron_id'  => 'matron_id',
         'sire_id'    => 'sire_id',
         'gen'        => 'gen',
         'birthdate'  => 'birth_date',
         'genes'      => 'genes_kai',
         'name'       => 'name'   ## note: will always be nil (is missing in kittydex)
       }
    else
      ## unknown format
      puts "!!! unknown datafile format; matching headers NOT found / missing"
      exit 1
    end


    ## start of kitties blockchain / genesis
    genesisdate = Date.new( 2017, 11, 23)   ## 2017-11-23

    ## note: for now use first 5 rows for testing
    ## kitties[0..4].each do |row|

    kitties = CsvHash.read( file )
    kitties.each do |row|
      ## puts row['id'] + '|' + row['gen'] + '|' + row['genes_kai']
      k = Copycats::Model::Kitty.new
      k.id        = row[headers['id']].to_i
      k.gen       = row[headers['gen']].to_i
      k.matron_id = row[headers['matron_id']].to_i   unless row[headers['matron_id']].blank? || row[headers['matron_id']] == '0'
      k.sire_id   = row[headers['sire_id']].to_i     unless row[headers['sire_id']].blank?   || row[headers['sire_id']] == '0'
      k.name      = row[headers['name']]             unless row[headers['name']].blank?

      ##  founder cats - first one hundret (1 to 100 - note: includes genesis (1))
      k.is_founder = true    if k.id >= 1 && k.id <= 100


      ## todo: pretty print (format genes !!!!)
      k.genes_kai = row[headers['genes']]   ### .gsub( ' ', '' )  ## remove all spaces - why? why not?

      ##  pp row['birthdate']
      birthdate = DateTime.strptime( row[headers['birthdate']], '%Y-%m-%d %H:%M:%S' )
      k.birthdate =  birthdate
      k.day_count = (birthdate.to_date.jd - genesisdate.jd)+1


      genome = Genome.new( k.genes_kai )
      genes =  genome.genes

      k.body_id      = TRAIT_IDS_CACHE[:body][:kai][genes[:body].d]
      k.pattern_id   = TRAIT_IDS_CACHE[:pattern][:kai][genes[:pattern].d]
      k.coloreyes_id = TRAIT_IDS_CACHE[:coloreyes][:kai][genes[:coloreyes].d]
      k.eyes_id      = TRAIT_IDS_CACHE[:eyes][:kai][genes[:eyes].d]
      k.color1_id    = TRAIT_IDS_CACHE[:color1][:kai][genes[:color1].d]
      k.color2_id    = TRAIT_IDS_CACHE[:color2][:kai][genes[:color2].d]
      k.color3_id    = TRAIT_IDS_CACHE[:color3][:kai][genes[:color3].d]
      k.wild_id      = TRAIT_IDS_CACHE[:wild][:kai][genes[:wild].d]
      k.mouth_id     = TRAIT_IDS_CACHE[:mouth][:kai][genes[:mouth].d]

      ## pp k

      ## print ids for progress report - why? why not?
      print "#{k.id}."
      k.save!

      ## add genes
      TRAITS.each_with_index do |(trait_key, trait_hash),i|
        gene    = genes[trait_key]
        next  if gene.nil?   ## skip future_1, future_2, etc. for now - add - why? why not?

        ##  puts "#{trait_hash[:name]} (Genes #{trait_hash[:genes]})\n\n"

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
