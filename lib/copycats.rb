# encoding: utf-8

require 'pp'        # for pp => pretty printer

require 'date'
require 'time'
require 'json'



## our own code
require 'copycats/version'    # note: let version always go first
require 'copycats/genome'



# say hello
puts Copycats.banner    if defined?($RUBYLIBS_DEBUG) && $RUBYLIBS_DEBUG
