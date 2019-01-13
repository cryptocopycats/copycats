# encoding: utf-8


### build "reverse" lookup tables

TRAITS_BY_NAME = {}  # e.g. savannah, selkirk, chantilly, ...
TRAITS_BY_CODE = {}  # e.g. FU00, FU01, FU02, ...

TRAITS.each do |key,h|
  h[:kai].each do |kai, name|

    num = Kai::NUMBER[kai]
    code = "#{h[:code]}#{'%02d' % num}"   ## e.g. FU00, FU01, etc.

    rec = {}
    rec[:name] = name
    rec[:kai]  = kai
    rec[:code] = code
    rec[:type] = key   ## todo - use trait instead of type  (use string not symbol?) - why? why not?

    if TRAITS_BY_NAME[name]
      puts "warn: duplicate trait name!! overwritting old #{name}:"
      pp TRAITS_BY_NAME[name]
      ## add count - why? why not?
      ##  note: totebasic used three (3) times!!!
      ##   how to make name "unique" ? - add kai e.g. totebase_g etc. - why? why not?
    end


    TRAITS_BY_NAME[name] = rec    unless name.empty? || name == '?'
    TRAITS_BY_CODE[code] = rec
  end
end
