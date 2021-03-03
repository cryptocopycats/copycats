require 'hoe'
require './lib/bitcat/version.rb'

Hoe.spec 'bitcat' do

  self.version = Bitcat::VERSION

  self.summary = "bitcat - bit cat(alog) browser - browse your (digital) bit(s) collections; browse your (crypto) kitties and more"
  self.description = summary

  self.urls    = ['https://github.com/openblockchains/bitcat']

  self.author  = 'Gerald Bauer'
  self.email   = 'wwwmake@googlegroups.com'

  # switch extension to .markdown for gihub formatting
  self.readme_file  = 'README.md'
  self.history_file = 'HISTORY.md'

  self.extra_deps = [
    ['sinatra', '>=2.0'],
    ['sass'],   ## used for css style preprocessing (scss)
    ['copycats', '>=0.6.1'],
  ]

  self.licenses = ['Public Domain']

  self.spec_extras = {
    required_ruby_version: '>= 2.3'
  }

end
