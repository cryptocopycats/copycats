# encoding: utf-8

require 'pp'        # for pp => pretty printer

require 'date'
require 'time'
require 'json'



## our own code
require 'copycats/version'    # note: let version always go first
require 'copycats/traits'
require 'copycats/genome'
require 'copycats/base32'


# say hello
puts Copycats.banner    if defined?($RUBYLIBS_DEBUG) && $RUBYLIBS_DEBUG
