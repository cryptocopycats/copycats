# encoding: utf-8

#######################
## yuml.me diagram:

=begin
[Kitties|id;gen;birthdate;day_count;genes_kai;name]1-<>48 (12x4)[Genes|n;gene;gene_n],
[Genes]0..*<>-1[Traits|n;kai;tier;name],
[Traits]0..*<>-1[Trait Types|name;key],
[Kitties]<-parents (matron x sire) [Kitties],
=end




class CreateDb

def up

ActiveRecord::Schema.define do

create_table :kitties do |t|
  ### t.integer :ref,    null: false    ## reference id - todo - find a better name e.g. uid (for unique id?) or gid?
  ## note: use built-in id for id!!!!

  t.string   :name       ## optional name e.g. Genesis, Galaxy Cat, etc.
  t.string   :genes_kai  ## genes in kai format
  t.integer  :gen        ## generation e.g. 0,1,2,etc.
  t.datetime :birthdate
  t.integer  :day_count  ## day 1, day 2, running day counter since 2017-11-23

  t.integer  :matron_id   ## references kitty (with matron id)
  t.integer  :sire_id     ## references kitty (with sire id)
end


create_table :genes do |t|
  t.references  :kitty
  t.integer     :n    # gene number/pos  0-47  (start w/ 1 why? why not?)

  t.string      :gene        # d, r1, r2, r3
  t.integer     :gene_n     # 0-3  (0=d,1=r1,2=r2,3=r3 - start w/ 1 why? why not?)

  t.references  :trait
end


create_table :traits do |t|
  t.references :trait_type
  t.string     :name
  t.integer    :n              # 0-31  (decimal/base10)
  t.string     :kai            # 1-x   (kai/base32)
  t.integer    :tier           # 1,2,3,4 - note: is nil (for x/31)
end

create_table :trait_types do |t|
  t.string     :name      # use "pretty" name e.g. fur, highlight color, etc.
  t.string     :key       # use key/ lowercase name from "official json api"
end


end # block Schema.define

end # method up

end # class CreateDb
