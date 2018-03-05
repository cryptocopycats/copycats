# Notes

## Mutations / Mewtations

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


