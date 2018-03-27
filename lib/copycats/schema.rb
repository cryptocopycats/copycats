# encoding: utf-8

#######################
## yuml.me diagram:

=begin
[Kitties|id;gen;birthdate;day_count;genes_kai;name]1-<>48 (12x4)[Genes|n;gene;gene_n],
[Genes]0..*<>-1[Traits|n;kai;tier;name],
[Traits]32<>-1[Trait Types|name;key],
[Kitties]<-parents (matron x sire) [Kitties],
=end




class CreateDb

def up

ActiveRecord::Schema.define do

create_table :kitties do |t|
  ### t.integer :ref,    null: false    ## reference id - todo - find a better name e.g. uid (for unique id?) or gid?
  ## note: use built-in id for id!!!!

  t.string   :name       ## optional name e.g. Genesis, Galaxy Cat, etc.
  t.string   :genes_kai, null: false  ## genes in kai format
  t.integer  :gen,       null: false  ## generation e.g. 0,1,2,etc.
  t.datetime :birthdate, null: false
  t.integer  :day_count, null: false  ## day 1, day 2, running day counter since 2017-11-23

  t.references  :matron   ## optional references kitty (with matron id)
  t.references  :sire     ## optional references kitty (with sire id)


  t.boolean  :is_fancy,      null: false, default: false
  t.boolean  :is_exclusive,  null: false, default: false
  t.boolean  :is_founder,    null: false, default: false   # ids 1 to 100 (in cryptokitties)


  ## for easy queries add convenience gene-d for all traits
  t.references  :body,      null: false    ## gene 0 (d)
  t.references  :pattern,   null: false    ## gene 4 (d)
  t.references  :coloreyes, null: false    ## gene 8 (d)
  t.references  :eyes,      null: false    ## gene 12 (d)
  t.references  :color1,    null: false    ## gene 16 (d)
  t.references  :color2,    null: false    ## gene 20 (d)
  t.references  :color3,    null: false    ## gene 24 (d)
  t.references  :wild,      null: false    ## gene 28 (d)
  t.references  :mouth,     null: false    ## gene 32 (d)
end


create_table :genes do |t|
  t.references  :kitty,   null: false
  t.integer     :n,       null: false   # gene number/pos  0-47  (start w/ 1 why? why not?)

  t.string      :gene,    null: false   # d, r1, r2, r3
  t.integer     :gene_n,  null: false   # 0-3  (0=d,1=r1,2=r2,3=r3 - start w/ 1 why? why not?)

  t.references  :trait,   null: false
end


create_table :traits do |t|
  t.references :trait_type,  null: false
  t.string     :name,        null: false
  t.integer    :n,           null: false  # 0-31  (decimal/base10)
  t.string     :kai,         null: false  # 1-x   (kai/base32)
  t.integer    :tier          # 1,2,3,4 - note: is nil (for x/31) for now (thus, optinal)
end

create_table :trait_types do |t|
  t.string     :name,   null: false  # use "pretty" name e.g. fur, highlight color, etc.
  t.string     :key,    null: false  # use key/ lowercase name from "official json api"
end


end # block Schema.define

end # method up

end # class CreateDb
