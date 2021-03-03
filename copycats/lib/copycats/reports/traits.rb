# encoding: utf-8

class TraitsReport

ROMAN = {
  1 => 'I',
  2 => 'II',
  3 => 'III',
  4 => 'IIII',
  5 => 'V'
}


def build
  buf = ""
  buf << "# Traits\n\n"

  buf << "| Tier | Kai |"
  TRAITS.values[0,6].each do |trait|
    buf << " #{trait[:name]} |"
  end
  buf << "\n"
  buf << "|----|----|----|----|----|----|----|----|\n"

  buf << "|    |    |"
  TRAITS.values[0,6].each do |trait|
    buf << " #{trait[:genes]} |"
  end
  buf << "\n"

  Kai::ALPHABET.each_char do |kai|
    tier = ROMAN[ Gene::TIER[kai] ]
    tier = '?'  if tier.nil?
    buf << "| #{tier} | #{kai} |"
    TRAITS.values[0,6].each do |trait|
      value = trait[:kai][kai]
      value = '?'  if value.nil? || value.empty?
      buf << " #{value} |"
    end
    buf << "\n"
  end
  buf << "\n\n"

  ## part ii (split into two tables)
  buf << "| Tier | Kai |"
  TRAITS.values[6,6].each do |trait|
    buf << " #{trait[:name]} |"
  end
  buf << "\n"
  buf << "|----|----|----|----|----|----|----|----|\n"

  buf << "|    |    |"
  TRAITS.values[6,6].each do |trait|
    buf << " #{trait[:genes]} |"
  end
  buf << "\n"

  Kai::ALPHABET.each_char do |kai|
    tier = ROMAN[ Gene::TIER[kai] ]
    tier = '?'  if tier.nil?
    buf << "| #{tier} | #{kai} |"
    TRAITS.values[6,6].each do |trait|
      value = trait[:kai][kai]
      value = '?'  if value.nil? || value.empty?
      buf << " #{value} |"
    end
    buf << "\n"
  end
  buf << "\n\n"


  buf += <<TXT
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

TXT


  puts buf

  buf
end ## method build


  def save( path )
    File.open( path, "w" ) do |f|
      f.write build
    end
  end

end # class TraitsReport
