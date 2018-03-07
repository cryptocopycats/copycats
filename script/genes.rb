# encoding: utf-8

####
# use:
#  $ ruby -I ./lib script/genes.rb


require 'copycats'


report = GenesReport.new
report.save( "./GENES.md" )
