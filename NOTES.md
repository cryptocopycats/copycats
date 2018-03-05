# Notes

## Mutations / Mewtations

5-bit Gene = 2^5 = 32 Values / Attributes

16 Mutation Pairs (16 x 2 = 32)

| Tier                   | Count | Total |
|------------------------|-------|-------|
| Tier 1 (Basic Traits)  |    16 |    16 |
| Tier 2 (Mutations)     |     8 |    24 |
| Tier 3 (Mutations)     |     4 |    28 |
| Tier 4 (Mutations)     |     2 |    30 |
| Tier 5 (Mutations)     |     1 |    31 |


```
Tier 1       Tier 2       Tier 3       Tier 4       Tier  5
 (0-15)       (16-23)      (24-27)      (28,29)      (30)
 0+1  = 16   16+17 = 24   24+25 = 28   28+29 = 30    
 2+3  = 17   18+19 = 25   26+27 = 29  
 4+5  = 18   20+21 = 26
 6+7  = 19   22+23 = 27
 8+9  = 20
10+11 = 21
12+13 = 22
14+15 = 23
```

Note: It's impossible for a mutation to reach `31` e.g.`30+31 = 31`.


in Kai (base32) notation:

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
