# encoding: utf-8

###
#  to run use
#     ruby -I ./lib -I ./test test/test_models.rb


require 'helper'


class TestModels < MiniTest::Test


def test_create
  ## connect to local kitties.db database
  connect( adapter:  'sqlite3',
           database: ':memory:' )

  setup_db
  setup_traits  # note: also builds TRAIT_IDS_CACHE for read_datafiles for now

  ## print some (record) stats
  kitty_count = Copycats::Model::Kitty.count
  gene_count  = Copycats::Model::Gene.count
  trait_count = Copycats::Model::Trait.count

  puts "kitties: #{kitty_count}"
  puts "genes:   #{gene_count}"
  puts "traits:  #{trait_count}"

  assert_equal   0, kitty_count
  assert_equal   0, gene_count
  assert_equal 384, trait_count
end

end  # class TestModels
