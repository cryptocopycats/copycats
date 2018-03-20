# Traits

| Tier | Kai | Fur | Pattern | Eye Color | Eye Shape | Base Color | Highlight Color |
|----|----|----|----|----|----|----|----|
|    |    | 0-3 | 4-7 | 8-11 | 12-15 | 16-19 | 20-23 |
| I | 1 | savannah | ? | thundergrey | ? | shadowgrey | ? |
| I | 2 | selkirk | tiger | gold | wonky | salmon | ? |
| I | 3 | ? | rascal | topaz | serpent | ? | egyptiankohl |
| I | 4 | birman | ganado | mintgreen | googly | orangesoda | poisonberry |
| I | 5 | ? | leopard | ? | otaku | cottoncandy | lilac |
| I | 6 | bobtail | camo  | sizzurp | simple | mauveover | apricot |
| I | 7 | ? | ? | chestnut | crazy | aquamarine | royalpurple |
| I | 8 | pixiebob | spangled | strawberry | thicccbrowz | nachocheez | ? |
| I | 9 | ? | calicool | sapphire | ? | harbourfog | swampgreen |
| I | a | cymric | luckystripe | forgetmenot | ? | ? | violet |
| I | b | chartreux | amur | ? | baddate | greymatter | scarlet |
| I | c | himalayan | jaguar | coralsunrise | ? | ? | barkbrown |
| I | d | munchkin | spock | ? | chronic | dragonfruit | coffee |
| I | e | sphynx | ? | ? | slyboots | ? | lemonade |
| I | f | ragamuffin | totesbasic | ? | wiley | hintomint | chocolate |
| I | g | ragdoll | totesbasic | cyan | stunned | bananacream | ? |
| II | h | norwegianforest | ? | pumpkin | ? | cloudwhite | ? |
| II | i | ? | thunderstruck | limegreen | alien | ? | safetyvest |
| II | j | ? | dippedcone | ? | fabulous | oldlace | turtleback |
| II | k | ? | ? | bubblegum | raisedbrow | koala | ? |
| II | m | ? | tigerpunk | twilightsparkle | ? | ? | wolfgrey |
| II | n | mainecoon | henna | ? | ? | ? | cerulian |
| II | o | laperm | ? | ? | sass | ? | skyblue |
| II | p | persian | totesbasic | ? | sweetmeloncakes | verdigris | ? |
| III | q | ? | ? | babypuke | ? | ? | ? |
| III | r | ? | ? | ? | wingtips | onyx | ? |
| III | s | ? | hotrod | ? | ? | ? | royalblue |
| III | t | manx | ? | ? | buzzed | ? | ? |
| IIII | u | ? | ? | ? | ? | ? | ? |
| IIII | v | ? | ? | ? | ? | ? | ? |
| V | w | ? | ? | ? | ? | ? | ? |
| ? | x | ? | ? | ? | ? | ? | ? |


| Tier | Kai | Accent Color | Wild | Mouth | Future 1 | Future 2 | Future 3 |
|----|----|----|----|----|----|----|----|
|    |    | 24-27 | 28-31 | 32-35 | 36-39 | 40-43 | 44-47 |
| I | 1 | belleblue | ? | whixtensions | ? | ? | ? |
| I | 2 | sandalwood | ? | wasntme | ? | ? | ? |
| I | 3 | peach | ? | wuvme | ? | ? | ? |
| I | 4 | icy | ? | gerbil | ? | ? | ? |
| I | 5 | granitegrey | ? | ? | ? | ? | ? |
| I | 6 | ? | ? | ? | ? | ? | ? |
| I | 7 | kittencream | ? | belch | ? | ? | ? |
| I | 8 | emeraldgreen | ? | ? | ? | ? | ? |
| I | 9 | ? | ? | beard | ? | ? | ? |
| I | a | ? | ? | pouty | ? | ? | ? |
| I | b | purplehaze | ? | saycheese | ? | ? | ? |
| I | c | ? | ? | grim | ? | ? | ? |
| I | d | azaleablush | ? | ? | ? | ? | ? |
| I | e | missmuffett | ? | ? | ? | ? | ? |
| I | f | morningglory | ? | happygokitty | ? | ? | ? |
| I | g | ? | ? | soserious | ? | ? | ? |
| II | h | daffodil | ? | cheeky | ? | ? | ? |
| II | i | flamingo | elk | starstruck | ? | ? | ? |
| II | j | ? | ? | ? | ? | ? | ? |
| II | k | bloodred | trioculus | ? | ? | ? | ? |
| II | m | ? | ? | dali | ? | ? | ? |
| II | n | ? | ? | grimace | ? | ? | ? |
| II | o | periwinkle | ? | ? | ? | ? | ? |
| II | p | ? | ? | tongue | ? | ? | ? |
| III | q | seafoam | ? | yokel | ? | ? | ? |
| III | r | ? | ? | ? | ? | ? | ? |
| III | s | ? | ? | neckbeard | ? | ? | ? |
| III | t | ? | ? | ? | ? | ? | ? |
| IIII | u | ? | ? | ? | ? | ? | ? |
| IIII | v | ? | ? | ? | ? | ? | ? |
| V | w | ? | ? | ? | ? | ? | ? |
| ? | x | ? | ? | ? | ? | ? | ? |


## Mutations / Mewtations

16 Mutation Pairs (16 x 2 = 32)

```
Tier I    Tier II   Tier III  Tier IIII  Tier V
 (1-g)     (h-p)     (q-t)     (u,v)      (w)
1+2 = h   h+i = q   q+r = u   u+v = w
3+4 = i   j+k = r   s+t = v
5+6 = j   m+n = s
7+8 = k   o+p = t
9+a = m
b+c = n
d+e = o
f+g = p
```

Note: It's impossible for a mutation to reach `x` e.g. `w+x = x`.

## Kai (Base32) Notation

|Kai    |Binary |Num|Kai    |Binary |Num|Kai    |Binary |Num|Kai    |Binary |Num|
|-------|-------|---|-------|-------|---|-------|-------|---|-------|-------|---|
| **1** | 00000 | 0 | **9** | 01000 | 8 | **h** | 10000 |16 | **q** | 11000 |24 |
| **2** | 00001 | 1 | **a** | 01001 | 9 | **i** | 10001 |17 | **r** | 11001 |25 |
| **3** | 00010 | 2 | **b** | 01010 | 10| **j** | 10010 |18 | **s** | 11010 |26 |
| **4** | 00011 | 3 | **c** | 01011 | 11| **k** | 10011 |19 | **t** | 11011 |27 |
| **5** | 00100 | 4 | **d** | 01100 | 12| **m** | 10100 |20 | **u** | 11100 |28 |
| **6** | 00101 | 5 | **e** | 01101 | 13| **n** | 10101 |21 | **v** | 11101 |29 |
| **7** | 00110 | 6 | **f** | 01110 | 14| **o** | 10110 |22 | **w** | 11110 |30 |
| **8** | 00111 | 7 | **g** | 01111 | 15| **p** | 10111 |23 | **x** | 11111 |31 |

Note: The digit-0 and the letter-l are NOT used in kai.

