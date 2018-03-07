# encoding: utf-8

require 'pp'        # for pp => pretty printer

require 'date'
require 'time'
require 'uri'
require 'json'
require 'csv'
require 'enumerator'    ## needed for each_slice
require 'optparse'      # note: used for command line tool (see Tool in tool.rb)

require 'logger'    # note: use for ActiveRecord::Base.logger -- remove/replace later w/ LogUtils::Logger ???

## 3rd party gems
require 'active_record'   ## todo: add sqlite3? etc.


## our own code
require 'copycats/version'    # note: let version always go first
require 'copycats/base32'
require 'copycats/traits'
require 'copycats/gene'
require 'copycats/genome'

require 'copycats/schema'
require 'copycats/data'

require 'copycats/models/kitty'

require 'copycats/reports/kitty'
require 'copycats/reports/mix'
require 'copycats/reports/genes'
require 'copycats/reports/traits'

require 'copycats/tool'


## add wrapper for allowing configuration of random number generator
module Lottery

  def self.random
    @random ||= Random.new
  end

  def self.random=(value)
    @random = value
  end

  def self.rand( arg=nil )
    if arg.is_a? Integer
      random.rand( arg )  ## max (number) = arg
    else
      random.rand     ## between 0.0 and 1.0 (as floating point number)
    end
  end
end  ## module Lottery


module Copycats
## add command line binary (tool) e.g. $ try kitty -h
  def self.main
   Tool.new.run( ARGV )
  end
end



# say hello
puts Copycats.banner    if defined?($RUBYLIBS_DEBUG) && $RUBYLIBS_DEBUG
