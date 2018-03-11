# Todos


## print traits with database id - why? why not?

TRAIT_IDS.md - use / build a new page (report) - why? why not?



## Ruby SQL intersect with ActiveRecord


```
genes = Gene.where( trait: Trait.find_by( name: 'savannah' )).intersect(
        Gene.where( trait: Trait.find_by( name: 'pattern' )))
genes.map { |gene| gene.kitty }     # get kitties (from gene)
```

check if the same as:

```
genes = Gene.find_by( trait: Trait.find_by( name: 'savannah' )) &
        Gene.find_by( trait: Trait.find_by( name: 'pattern' ))
genes.map { |gene| gene.kitty }     # get kitties (from gene)
```

use to_sql  for see generated sql!


check if project on kitty_id required!!
otherwise all records are different (has its own id!!!)



## SQL

``` sql
SELECT kitty_id FROM genes WHERE trait_id = 0
INTERSECT
SELECT kitty_id FROM genes WHERE trait_id = 33
```


check query samples
with article and tags (find article by two tags - more than one - for example)


does it work with inner join?

``` sql
SELECT id      -- ??? to be done (not working)
FROM kitties
INNER JOIN genes
where genes.trait_id in [0,3]
```

or use subselect in where?

``` sql
SELECT id         -- ??? to be done (not working)
FROM kitties
where select kitty_id from genes where trait_id in [0,3]    
```
