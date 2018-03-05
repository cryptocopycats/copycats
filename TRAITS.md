# Traits

| Tier | Kai | Fur | Pattern | Eye Color | Eye Shape | Base Color |
|----|----|----|----|----|----|----|
|    |    | 0-3 | 4-7 | 8-11 | 12-15 | 16-19 |
| 1 | 1 | savannah | ? | thundergrey | ? | shadowgrey |
| 1 | 2 | selkirk | tiger | gold | wonky | salmon |
| 1 | 3 | ? | ? | topaz | serpent | ? |
| 1 | 4 | birman | ganado | mintgreen | googly | orangesoda |
| 1 | 5 | ? | leopard | ? | otaku | cottoncandy |
| 1 | 6 | bobtail | camo  | sizzurp | simple | mauveover |
| 1 | 7 | ? | ? | chestnut | crazy | aquamarine |
| 1 | 8 | ? | spangled | strawberry | thicccbrowz | nachocheez |
| 1 | 9 | ? | calicool | sapphire | ? | harbourfog |
| 1 | a | cymric | luckystripe | forgetmenot | ? | ? |
| 1 | b | chartreux | amur | ? | baddate | greymatter |
| 1 | c | himalayan | aguar | coralsunrise | ? | ? |
| 1 | d | munchkin | spock | ? | chronic | ? |
| 1 | e | sphynx | ? | ? | slyboots | ? |
| 1 | f | ragamuffin | totesbasic | ? | wiley | hintomint |
| 1 | g | ragdoll | totesbasic | ? | stunned | bananacream |
| 2 | h | norwegianforest | ? | pumpkin | ? | cloudwhite |
| 2 | i | ? | ? | limegreen | alien | ? |
| 2 | j | ? | dippedcone | ? | fabulous | oldlace |
| 2 | k | ? | ? | bubblegum | raisedbrow | koala |
| 2 | m | ? | tigerpunk | twilightsparkle | ? | ? |
| 2 | n | mainecoon | henna | ? | ? | ? |
| 2 | o | laperm | ? | ? | sass | ? |
| 2 | p | persian | totesbasic | ? | sweetmeloncakes | verdigris |
| 3 | q | ? | ? | babypuke | ? | ? |
| 3 | r | ? | ? | ? | wingtips | onyx |
| 3 | s | ? | hotrod | ? | ? | ? |
| 3 | t | manx | ? | ? | buzzed | ? |
| 4 | u | ? | ? | ? | ? | ? |
| 4 | v | ? | ? | ? | ? | ? |
| 5 | w | ? | ? | ? | ? | ? |
| ? | x | ? | ? | ? | ? | ? |


| Tier | Kai | Highlight Color | Accent Color | Wild | Mouth |
|----|----|----|----|----|----|
|    |    | 20-23 | 24-27 | 28-31 | 32-35 |
| 1 | 1 | ? | belleblue | ? | whixtensions |
| 1 | 2 | ? | sandalwood | ? | wasntme |
| 1 | 3 | egyptiankohl | peach | ? | wuvme |
| 1 | 4 | ? | icy | ? | gerbil |
| 1 | 5 | lilac | granitegrey | ? | ? |
| 1 | 6 | apricot | ? | ? | ? |
| 1 | 7 | royalpurple | kittencream | ? | ? |
| 1 | 8 | ? | emeraldgreen | ? | ? |
| 1 | 9 | swampgreen | ? | ? | beard |
| 1 | a | violet | ? | ? | pouty |
| 1 | b | scarlet | purplehaze | ? | saycheese |
| 1 | c | barkbrown | ? | ? | grim |
| 1 | d | coffee | azaleablush | ? | ? |
| 1 | e | lemonade | missmuffett | ? | ? |
| 1 | f | chocolate | morningglory | ? | happygokitty |
| 1 | g | ? | ? | ? | soserious |
| 2 | h | ? | daffodil | ? | cheeky |
| 2 | i | ? | flamingo | elk | starstruck |
| 2 | j | turtleback | ? | ? | ? |
| 2 | k | ? | bloodred | trioculus | ? |
| 2 | m | wolfgrey | ? | ? | dali |
| 2 | n | cerulian | ? | ? | grimace |
| 2 | o | skyblue | periwinkle | ? | ? |
| 2 | p | ? | ? | ? | tongue |
| 3 | q | ? | seafoam | ? | yokel |
| 3 | r | ? | ? | ? | ? |
| 3 | s | royalblue | ? | ? | neckbeard |
| 3 | t | ? | ? | ? | ? |
| 4 | u | ? | ? | ? | ? |
| 4 | v | ? | ? | ? | ? |
| 5 | w | ? | ? | ? | ? |
| ? | x | ? | ? | ? | ? |


## Mutations / Mewtations

16 Mutation Pairs (16 x 2 = 32)

```
Tier 1    Tier 2    Tier 3    Tier 4    Tier 5
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

