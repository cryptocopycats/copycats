# encoding: utf-8

####
#  "all-in-one" update script
#
#  use:
#    $ ruby -I ./lib script/update.rb


require 'copycats'


##  see script/genes.rb
report = GenesReport.new
report.save( "./GENES.md" )


## see script/traits.rb
report = TraitsReport.new
report.save( "./TRAITS.md" )
