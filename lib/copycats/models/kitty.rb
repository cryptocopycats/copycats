# encoding: utf-8

##
#  todo: rename file from kitty.rb to models.rb - why? why not?
#     keep all models together in a single file? - why? why not?


module Copycats
  module Model

class Kitty < ActiveRecord::Base
  ## self.table_name = 'kitties'

  has_many :genes

  ## has_many :genes_body
  ## has_many :genes_pattern
end  # class Kitty


class TraitType <  ActiveRecord::Base
  ## self.table_name = 'trait_types'

  has_many :traits
end # class TraitType


class Trait <  ActiveRecord::Base
  ## self.table_name = 'traits'

  belongs_to :trait_types
end # class Trait


class Gene < ActiveRecord::Base
  ## self.table_name = 'genes'

  belongs_to :kitty
end # class Gene



  end # module Model
end # module Copycats
