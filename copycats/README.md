# Crypto Copycats Collectibles - Buy! Sell! Hodl! Sire!

copycats command line tool (and core library) - crypto cats / kitties collectibles unchained - buy! sell! hodl! sire! - play for free - runs off the blockchain w/ ledger lite - no ether / gas required; run your own peer-to-peer (P2P) network node over HTTP



* home  :: [github.com/cryptocopycats/copycats](https://github.com/cryptocopycats/copycats)
* bugs  :: [github.com/cryptocopycats/copycats/issues](https://github.com/cryptocopycats/copycats/issues)
* gem   :: [rubygems.org/gems/copycats](https://rubygems.org/gems/copycats)
* rdoc  :: [rubydoc.info/gems/copycats](http://rubydoc.info/gems/copycats)



<!--
## Timeline / Updates

### New Traits / Catttributes

Mar 21, 2018
- **Springcrocus** - highlight color (2) trait is discovered. #Cattribute

Mar 16, 2018
- **Thunderstruck** - pattern (i) trait is discovered. #Cattribute
- **Rascal** - pattern (3) trait is discovered. #Cattribute

Mar 14, 2018
- **Dragonfruit** - base color (e) trait is discovered. #Cattribute

Mar 9, 2018
- **Belch** - mouth (7) trait is discovered. #Cattribute

Mar 8, 2018
- **Pixiebob** - fur (8) trait is discovered. #Cattribute
- **Poisonberry** - highlight color (4) trait is discovered. #Cattribute
- **Safetyvest** - highlight color (i) trait is discovered. #Cattribute

Mar 5, 2018
- **Cyan** - eye color (g) trait is discovered. #Cattribute


See [Updates - Traits](updates/TRAITS.md) for more.


### New Fancies / Exclusives

Mar 16, 2018
- **Berry** (?) Fancy Cat is discovered. #Fancy Cat

Mar 7, 2018
- **Lion Dance** (888) Fancy Cat is discovered. #Fancy Cat

Mar 2, 2018
- **Dogcat** (88) Fancy Cat is discovered. #Fancy Cat

Mar 1, 2018
- Exclusive **Knight Kitty** (?) is released. #Fancy Cat #Exclusive


See [Updates - Fancies / Exclusives](updates/FANCIES.md) for more.
-->




## kitty Command Line Tool

Use the `kitty` command line tool to (auto-)read kitty data records
(in comma-separated values (CSV)) into an in-memory SQLite database
and print reports. Example - [`kitties/1-99_999/000.csv`](https://github.com/cryptocopycats/kitties/blob/master/1-99_999/000.csv):

```
id,gen,matron_id,sire_id,birthdate,genes,name
1,0,,,2017-11-23 06:19:59,ccac 7787 fa7f afaa 1646 7755 f9ee 4444 6766 7366 cccc eede,
2,0,,,2017-11-23 06:19:59,ca9c 7575 f442 af9g 6664 5557 7777 4444 6686 8667 cccc ffec,
3,0,,,2017-11-23 06:19:59,ac9a 6686 ff7f 99aa 6666 5575 779f 4444 6786 7748 cccc dcfc,
4,0,,,2017-11-23 06:19:59,ccac 5686 22ff f99g 1616 7555 ffed 4444 8668 4687 cccc dcff,
5,0,,,2017-11-23 06:19:59,ca9c 8777 747f g99g 4411 7775 f77d 4444 7788 6377 cccc ffef,
...
```

Note: By default all datafiles (`**/*.csv`) in the `./data` and all subdirectories
get (auto-)read. Use the `-i/--include` option to change the data directory.



### Kitty Genes Reader / Report

Pass in the id (e.g. `1`, `43`, etc.) of the kitty to print a genes report.
Example:

```
$ kitty 1
```

prints:

```
# Kitty #1

genes (kai): ccac 7787 fa7f afaa 1646 7755 f9ee 4444 6766 7366 cccc eede

Fur (Genes 0-3)

|Gene| Binary |Kai (Tier)| Trait      |    |
|----|--------|----------|------------|----|
| 0  | 01101  | e (I)    | **sphynx** | d  |
| 1  | 01100  | d (I)    | munchkin ) | r1 |
| 2  | 01101  | e (I)    | sphynx     | r2 |
| 3  | 01101  | e (I)    | sphynx     | r3 |

d = dominant, r1 = 1st order recessive, r2 = 2nd order recessive, r3 = 3rd order recessive

Pattern (Genes 4-7)

|Gene| Binary |Kai (Tier)| Trait      |    |
|----|--------|----------|------------|----|
| 4  | 01011  | c (I)    | **jaguar** | d  |
| 5  | 01011  | c (I)    | jaguar     | r1 |
| 6  | 01011  | c (I)    | jaguar     | r2 |
| 7  | 01011  | c (I)    | jaguar     | r3 |

Eye Color (Genes 8-11)

|Gene| Binary |Kai (Tier)| Trait       |    |
|----|--------|----------|-------------|----|
| 8  | 00101  | 6 (I)    | **sizzurp** | d  |
| 9  | 00101  | 6 (I)    | sizzurp     | r1 |
| 10 | 00010  | 3 (I)    | topaz       | r2 |
| 11 | 00110  | 7 (I)    | chestnut    | r3 |

Eye Shape (Genes 12-15)

|Gene| Binary  |Kai (Tier)| Trait      |    |
|----|---------|----------|------------|----|
| 12 | 00101   | 6 (I)    | **simple** | d  |
| 13 | 00101   | 6 (I)    | simple     | r1 |
| 14 | 00110   | 7 (I)    | crazy      | r2 |
| 15 | 00101   | 6 (I)    | simple     | r3 |

Base Color (Genes 16-19)

|Gene| Binary |Kai (Tier)| Trait          |    |
|----|--------|----------|----------------|----|
| 16 | 00011  | 4 (I)    | **orangesoda** | d  |
| 17 | 00011  | 4 (I)    | orangesoda     | r1 |
| 18 | 00011  | 4 (I)    | orangesoda     | r2 |
| 19 | 00011  | 4 (I)    | orangesoda     | r3 |

Highlight Color (Genes 20-23)

|Gene| Binary |Kai (Tier)| Trait        |    |
|----|--------|----------|--------------|----|
| 20 | 01101  | e (I)    | **lemonade** | d  |
| 21 | 01101  | e (I)    | lemonade     | r1 |
| 22 | 01000  | 9 (I)    | swampgreen   | r2 |
| 23 | 01110  | f (I)    | chocolate    | r3 |

Accent Color (Genes 24-27)

|Gene| Binary |Kai (Tier)| Trait           |    |
|----|--------|----------|-----------------|----|
| 24 | 00100  | 5 (I)    | **granitegrey** | d  |
| 25 | 00100  | 5 (I)    | granitegrey     | r1 |
| 26 | 00110  | 7 (I)    | kittencream     | r2 |
| 27 | 00110  | 7 (I)    | kittencream     | r3 |

Wild (Genes 28-31)

|Gene| Binary |Kai (Tier)| Trait   |    |
|----|--------|----------|---------|----|
| 28 | 00101  | 6 (I)    | **?**   |  d |
| 29 | 00011  | 4 (I)    | ?       | r1 |
| 30 | 00101  | 6 (I)    | ?       | r2 |
| 31 | 00000  | 1 (I)    | ?       | r3 |

Mouth (Genes 32-35)

|Gene| Binary |Kai (Tier)| Trait        |   |
|----|--------|----------|--------------|---|
| 32 | 01001  | a (I)    | **pouty**    | d |
| 33 | 01001  | a (I)    | pouty        | r1 |
| 34 | 01110  | f (I)    | happygokitty | r2 |
| 35 | 01001  | a (I)    | pouty        | r3 |
```


### Kitty Mix Genes (Matron + Sire) Report

Pass in two ids for the matron and sire kitties to print a mix genes report.
Example:


```
$ kitty 2 43
```

prints:

```
# Kitty #2 + #43

genes (kai) 1: ca9c 7575 f442 af9g 6664 5557 7777 4444 6686 8667 cccc ffec
genes (kai) 2: ca9a 7588 72a7 fa9f 4111 5555 dedf 4444 5888 4666 cccc fded

Fur (Genes 0-3)

|Gene|Kai|Trait (Matron) |Kai|Trait (Sire)  |    |
|----|---|---------------|---|--------------|----|
| 0  | c | **himalayan** | d | **munchkin** | d  |
| 1  | e | sphynx        | e | sphynx       | r1 |
| 2  | f | ragamuffin    | d | munchkin     | r2 |
| 3  | f | ragamuffin    | f | ragamuffin   | r3 |

d = dominant, r1 = 1st order recessive, r2 = 2nd order recessive, r3 = 3rd order recessive

Pattern (Genes 4-7)

|Gene|Kai|Trait (Matron)|Kai|Trait (Sire)|    |
|----|---|--------------|---|------------|----|
| 4  | c | **jaguar**   | c | **jaguar** | d  |
| 5  | c | jaguar       | c | jaguar     | r1 |
| 6  | c | jaguar       | c | jaguar     | r2 |
| 7  | c | jaguar       | c | jaguar     | r3 |

Eye Color (Genes 8-11)

|Gene|Kai|Trait (Matron)|Kai|Trait (Sire) |    |
|----|---|--------------|---|-------------|----|
| 8  | 7 | **chestnut** | 6 | **sizzurp** | d  |
| 9  | 6 | sizzurp      | 6 | sizzurp     | r1 |
| 10 | 6 | sizzurp      | 6 | sizzurp     | r2 |
| 11 | 8 | strawberry   | 4 | mintgreen   | r3 |

Eye Shape (Genes 12-15)

|Gene|Kai|Trait (Matron)|Kai|Trait (Sire)     |    |
|----|---|--------------|---|-----------------|----|
| 12 | 6 | **simple**   | 8 | **thicccbrowz** | d  |
| 13 | 8 | thicccbrowz  | 8 | thicccbrowz     | r1 |
| 14 | 6 | simple       | 8 | thicccbrowz     | r2 |
| 15 | 6 | simple       | 5 | otaku           | r3 |

Base Color (Genes 16-19)

|Gene|Kai|Trait (Matron)  |Kai|Trait (Sire)    |    |
|----|---|----------------|---|----------------|----|
| 16 | 4 | **orangesoda** | 4 | **orangesoda** | d  |
| 17 | 4 | orangesoda     | 4 | orangesoda     | r1 |
| 18 | 4 | orangesoda     | 4 | orangesoda     | r2 |
| 19 | 4 | orangesoda     | 4 | orangesoda     | r3 |

Highlight Color (Genes 20-23)

|Gene|Kai|Trait (Matron)   |Kai|Trait (Sire)   |    |
|----|---|-----------------|---|---------------|----|
| 20 | 7 | **royalpurple** | f | **chocolate** | d  |
| 21 | 7 | royalpurple     | d | coffee        | r1 |
| 22 | 7 | royalpurple     | e | lemonade      | r2 |
| 23 | 7 | royalpurple     | d | coffee        | r3 |

Accent Color (Genes 24-27)

|Gene|Kai|Trait (Matron)   |Kai|Trait (Sire)     |    |
|----|---|-----------------|---|-----------------|----|
| 24 | 7 | **kittencream** | 5 | **granitegrey** | d  |
| 25 | 5 | granitegrey     | 5 | granitegrey     | r1 |
| 26 | 5 | granitegrey     | 5 | granitegrey     | r2 |
| 27 | 5 | granitegrey     | 5 | granitegrey     | r3 |

Wild (Genes 28-31)

|Gene|Kai|Trait (Matron)|Kai|Trait (Sire)|    |
|----|---|--------------|---|------------|----|
| 28 | 4 | **?**        | 1 | **?**      | d  |
| 29 | 6 | ?            | 1 | ?          | r1 |
| 30 | 6 | ?            | 1 | ?          | r2 |
| 31 | 6 | ?            | 4 | ?          | r3 |

Mouth (Genes 32-35)

|Gene|Kai|Trait (Matron) |Kai|Trait (Sire)      |    |
|----|---|---------------|---|------------------|----|
| 32 | g | **soserious** | f | **happygokitty** | d  |
| 33 | 9 | beard         | 9 | beard            | r1 |
| 34 | f | happygokitty  | a | pouty            | r2 |
| 35 | a | pouty         | f | happygokitty     | r3 |
```



## Installation - I Can Has Copycats?

Use:

```
$ gem install copycats
```


## License

![](https://publicdomainworks.github.io/buttons/zero88x31.png)

The `copycats` scripts are dedicated to the public domain.
Use it as you please with no restrictions whatsoever.


## Questions? Comments?

Post them on the [cryptokitties reddit](https://www.reddit.com/r/cryptokitties). Thanks.
