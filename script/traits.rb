# encoding: utf-8

####
# use:
#  $ ruby -I ./lib script/traits.rb


require 'copycats'


report = TraitsReport.new
report.save( "./TRAITS.md" )
