# encoding: utf-8

require 'pp'        # for pp => pretty printer

require 'date'
require 'time'
require 'json'



## our own code
require 'copycats/version'    # note: let version always go first
require 'copycats/base32'
require 'copycats/traits'
require 'copycats/gene'
require 'copycats/genome'



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



# say hello
puts Copycats.banner    if defined?($RUBYLIBS_DEBUG) && $RUBYLIBS_DEBUG
