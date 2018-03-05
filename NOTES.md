# Notes

## Mutations / Mewtations

5-bit Gene = 2^5 = 32 Attributes

16 Mutation Pairs (16x2 = 32)

| Tier                   | Count | Total |
|------------------------|-------|-------|
| Tier 1 (Basic Traits)  |    16 |    16 |
| Tier 2 (Mutations)     |     8 |    24 |
| Tier 3 (Mutations)     |     4 |    28 |
| Tier 4 (Mutations)     |     2 |    30 |
| Tier 5 (Mutations)     |     1 |    31 |


The formula is `n+(n+1) = n/2+16` if n is an even number (0,2,4,6,...).
Running:

``` ruby
(0..31).each do |n|
  if n.even?
    puts "#{n}+#{n+1} = #{n/2+16}"
  end
end
```

results in:

```
 0+1  = 16
 2+3  = 17
 4+5  = 18
 6+7  = 19
 8+9  = 20
10+11 = 21
12+13 = 22
14+15 = 23
16+17 = 24
18+19 = 25
20+21 = 26
22+23 = 27
24+25 = 28
26+27 = 29
28+29 = 30
30+31 = 31
```

and in kai (base32) notation. 

``` ruby
ALPHABET = "123456789abcdefghijkmnopqrstuvwx"

(0..31).each do |n|
  if n.even?
    puts "#{ALPHABET[n]}+#{ALPHABET[n+1]} = #{ALPHABET[n/2+16]}"
  end
end
```

results in:

```
1+2 = h
3+4 = i
5+6 = j
7+8 = k
9+a = m
b+c = n
d+e = o
f+g = p
h+i = q
j+k = r
m+n = s
o+p = t
q+r = u
s+t = v
u+v = w
w+x = x
```
