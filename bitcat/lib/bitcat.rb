# encoding: utf-8

require 'pp'

## 3rd party
require 'copycats'
require 'sinatra/base'   ## note: use "modular" class sinatra style



## our own code
require 'bitcat/version'    # note: let version always go first
require 'bitcat/app'



module Bitcat

   ## convenience method
   def self.run!
     app    = App
     port   = 4567
     Rack::Handler::WEBrick.run( app, Port:port ) do |server|
       ## todo: add traps here - why, why not??
     end
   end

   def self.main
     p banner
     ##  p root   #=> e.g. "C:/Sites/openblockchains/bitcat"

     database = './kitties.db'

     unless File.exist?( database )
       puts "*** error - no SQLite database found - expected >#{database}<"
       puts
       puts "  note: for how to setup a database,"
       puts "        see <https://github.com/openblockchains/copycats#database-setup>"
       puts
       exit 1
     end


     ## connect to local kitties.db database
     connect( adapter:  'sqlite3',
              database:  database )

     ## print some (record) stats
     puts "kitties: #{Copycats::Model::Kitty.count}"
     puts "genes:   #{Copycats::Model::Gene.count}"
     puts "traits:  #{Copycats::Model::Trait.count}"

     run!
   end
end # module Bitcat
