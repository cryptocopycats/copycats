require 'hoe'
require './lib/copycats/version.rb'

Hoe.spec 'copycats' do

  self.version = Copycats::VERSION

  self.summary = "copycats - command line tool (and core library) crypto cats / kitties collectibles unchained - buy! sell! hodl! sire! - play for free - runs off the blockchain w/ ledger lite - no ether / gas required; run your own peer-to-peer (P2P) network node over HTTP"
  self.description = summary

  self.urls    = ['https://github.com/cryptocopycats/copycats']

  self.author  = 'Gerald Bauer'
  self.email   = 'wwwmake@googlegroups.com'

  # switch extension to .markdown for gihub formatting
  self.readme_file  = 'README.md'
  self.history_file = 'CHANGELOG.md'

  self.extra_deps = [
    ['base32-alphabets', '>= 1.0.0'],
    ['csvreader',        '>= 1.2.3'],
    ['activerecord'],
    ['sqlite3'],
  ]

  self.licenses = ['Public Domain']

  self.spec_extras = {
    required_ruby_version: '>= 2.3'
  }

end
