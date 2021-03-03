# encoding: utf-8

##
#  todo: rename file from kitty.rb to models.rb - why? why not?
#     keep all models together in a single file? - why? why not?


module Copycats
  module Model

class Kitty < ActiveRecord::Base
  ## self.table_name = 'kitties'

  has_many :genes

  belongs_to :sire,      class_name: 'Kitty', foreign_key: 'sire_id'
  belongs_to :matron,    class_name: 'Kitty', foreign_key: 'matron_id'

  ## convenience shortcuts for gene (d) traits
  belongs_to :body,      class_name: 'Trait', foreign_key: 'body_id'
  belongs_to :pattern,   class_name: 'Trait', foreign_key: 'pattern_id'
  belongs_to :coloreyes, class_name: 'Trait', foreign_key: 'coloreyes_id'
  belongs_to :eyes,      class_name: 'Trait', foreign_key: 'eyes_id'
  belongs_to :color1,    class_name: 'Trait', foreign_key: 'color1_id'
  belongs_to :color2,    class_name: 'Trait', foreign_key: 'color2_id'
  belongs_to :color3,    class_name: 'Trait', foreign_key: 'color3_id'
  belongs_to :wild,      class_name: 'Trait', foreign_key: 'wild_id'
  belongs_to :mouth,     class_name: 'Trait', foreign_key: 'mouth_id'

  ## todo: add more genes convenience shortcuts
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
