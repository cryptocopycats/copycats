# encoding: utf-8

class CreateDb

def up

ActiveRecord::Schema.define do

create_table :kitties do |t|
  ### t.integer :ref,    null: false    ## reference id - todo - find a better name e.g. uid (for unique id?) or gid?
  ## note: use built-in id for id!!!!
  
  t.string  :name      ## optional name e.g. Genesis, Galaxy Cat, etc.
  t.string  :genes     ## genes in kai format
  t.integer :gen       ## generation e.g. 0,1,2,etc.
end


end # block Schema.define

end # method up

end # class CreateDb
