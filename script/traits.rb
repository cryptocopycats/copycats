# encoding: utf-8

####
# use:
#  $ ruby -I ./lib script/traits.rb


require 'copycats'


class TraitsReport

def build
  buf = ""
  buf << "# Traits\n\n"

  buf << "| Tier | Kai |"
  TRAITS.values[0,9].each do |trait|
    buf << " #{trait[:name]} |"
  end
  buf << "\n"
  buf << "|----|----|----|----|----|----|----|----|----|----|----|\n"

  buf << "|    |    |"
  TRAITS.values[0,9].each do |trait|
    buf << " #{trait[:genes]} |"
  end
  buf << "\n"

  Kai::ALPHABET.each_char do |kai|
    tier = Kai::TIER[kai]
    tier = '?'  if tier.nil?
    buf << "| #{tier} | #{kai} |"
    TRAITS.values[0,9].each do |trait|
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


report = TraitsReport.new
report.save( "./TRAITS.md" )
