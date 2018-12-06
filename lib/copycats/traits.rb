# encoding: utf-8

###
#  trais / kaittributes
#   see https://cryptokittydex.com/kaittributes
#       https://docs.google.com/spreadsheets/d/1ShiBKSglFAB2vJe4Uow3iF09FBVq6ZAaOzTCIECf4iA
#       http://www.rolldice.club/cryptokitties/wkt_tree.php
#       https://www.cryptokitties.co/cattributes (official cattributes list)
#
#
#  for latest updates on new cattributes see:
#      https://updates.cryptokitties.co   (official latest updates/timeline)

## ordered by gene position (0,1,3.4,5,... etc.)
##  12 traits (4 genes each)
TRAITS =
{
  body: {
    genes: '0-3',
    name:  'Fur',  code: 'FU',
    kai: {
    '1' => 'savannah',
    '2' => 'selkirk',
    '3' => 'chantilly',
    '4' => 'birman',
    '5' => 'koladiviya',
    '6' => 'bobtail',
    '7' => 'manul',
    '8' => 'pixiebob',
    '9' => 'siberian',
    'a' => 'cymric',
    'b' => 'chartreux',
    'c' => 'himalayan',
    'd' => 'munchkin',
    'e' => 'sphynx',
    'f' => 'ragamuffin',
    'g' => 'ragdoll',
    'h' => 'norwegianforest',
    'i' => 'mekong',
    'j' => 'highlander',
    'k' => 'balinese',
    'm' => 'lynx',
    'n' => 'mainecoon',
    'o' => 'laperm',
    'p' => 'persian',
    'q' => 'fox',
    'r' => 'kurilian',
    's' => 'toyger',
    't' => 'manx',
    'u' => 'lykoi',
    'v' => 'burmilla',
    'w' => 'liger',
    'x' => ''
    }
  },
  pattern: {
    genes: '4-7',
    name: 'Pattern', code: 'PA',
    kai: {
    '1' => 'vigilante',
    '2' => 'tiger',
    '3' => 'rascal',
    '4' => 'ganado',
    '5' => 'leopard',
    '6' => 'camo',
    '7' => 'rorschach',
    '8' => 'spangled',
    '9' => 'calicool',
    'a' => 'luckystripe',
    'b' => 'amur',
    'c' => 'jaguar',
    'd' => 'spock',
    'e' => 'mittens',
    'f' => 'totesbasic',  ## use totesbasic_f - why? why not?
    'g' => 'totesbasic',  ## use totesbasic_g
    'h' => 'splat',
    'i' => 'thunderstruck',
    'j' => 'dippedcone',
    'k' => 'highsociety',
    'm' => 'tigerpunk',
    'n' => 'henna',
    'o' => 'arcreactor',
    'p' => 'totesbasic',  ## use totesbasic_p
    'q' => 'scorpius',
    'r' => 'razzledazzle',
    's' => 'hotrod',
    't' => 'allyouneed',
    'u' => 'avatar',
    'v' => 'gyre',
    'w' => 'moonrise',
    'x' => ''
    }
  },
  coloreyes: {
    genes: '8-11',
    name:  'Eye Color', code: 'EC',
    kai: {
    '1' => 'thundergrey',
    '2' => 'gold',
    '3' => 'topaz',
    '4' => 'mintgreen',
    '5' => 'isotope',
    '6' => 'sizzurp',
    '7' => 'chestnut',
    '8' => 'strawberry',
    '9' => 'sapphire',
    'a' => 'forgetmenot',
    'b' => 'dahlia',
    'c' => 'coralsunrise',
    'd' => 'olive',
    'e' => 'doridnudibranch',
    'f' => 'parakeet',
    'g' => 'cyan',
    'h' => 'pumpkin',
    'i' => 'limegreen',
    'j' => 'bridesmaid',
    'k' => 'bubblegum',
    'm' => 'twilightsparkle',
    'n' => 'palejade',
    'o' => 'pinefresh',
    'p' => 'eclipse',
    'q' => 'babypuke',
    'r' => 'downbythebay',
    's' => 'autumnmoon',
    't' => 'oasis',
    'u' => 'gemini',
    'v' => 'dioscuri',
    'w' => 'kaleidoscope',
    'x' => ''
    }
  },
  eyes: {
    genes: '12-15',
    name: 'Eye Shape', code: 'ES',     ##  eye type
    kai: {
    '1' => 'swarley',
    '2' => 'wonky',
    '3' => 'serpent',
    '4' => 'googly',
    '5' => 'otaku',
    '6' => 'simple',
    '7' => 'crazy',
    '8' => 'thicccbrowz',
    '9' => 'caffeine',
    'a' => 'wowza',
    'b' => 'baddate',
    'c' => 'asif',
    'd' => 'chronic',
    'e' => 'slyboots',
    'f' => 'wiley',
    'g' => 'stunned',
    'h' => 'chameleon',
    'i' => 'alien',
    'j' => 'fabulous',
    'k' => 'raisedbrow',
    'm' => 'tendertears',
    'n' => 'hacker',
    'o' => 'sass',
    'p' => 'sweetmeloncakes',
    'q' => 'oceanid',
    'r' => 'wingtips',
    's' => 'firedup',
    't' => 'buzzed',
    'u' => 'bornwithit',
    'v' => 'candyshoppe',
    'w' => 'drama',
    'x' => ''
    }
  },
  color1: {
    genes: '16-19',
    name: 'Base Color', code: 'BC',   ##  colorprimary / body color
    kai: {
    '1' => 'shadowgrey',
    '2' => 'salmon',
    '3' => 'meowgarine',
    '4' => 'orangesoda',
    '5' => 'cottoncandy',
    '6' => 'mauveover',
    '7' => 'aquamarine',
    '8' => 'nachocheez',
    '9' => 'harbourfog',
    'a' => 'cinderella',
    'b' => 'greymatter',
    'c' => 'tundra',
    'd' => 'brownies',
    'e' => 'dragonfruit',
    'f' => 'hintomint',
    'g' => 'bananacream',
    'h' => 'cloudwhite',
    'i' => 'cornflower',
    'j' => 'oldlace',
    'k' => 'koala',
    'm' => 'lavender',
    'n' => 'glacier',
    'o' => 'redvelvet',
    'p' => 'verdigris',
    'q' => 'icicle',
    'r' => 'onyx',
    's' => 'hyacinth',
    't' => 'martian',
    'u' => 'hotcocoa',
    'v' => 'shamrock',
    'w' => 'firstblush',
    'x' => ''
    }
  },
  color2: {
    genes: '20-23',
    name:  'Highlight Color', code: 'HC',    ## colorsecondary / sec color / pattern color
    kai: {
    '1' => 'cyborg',
    '2' => 'springcrocus',
    '3' => 'egyptiankohl',
    '4' => 'poisonberry',
    '5' => 'lilac',
    '6' => 'apricot',
    '7' => 'royalpurple',
    '8' => 'padparadscha',
    '9' => 'swampgreen',
    'a' => 'violet',
    'b' => 'scarlet',
    'c' => 'barkbrown',
    'd' => 'coffee',
    'e' => 'lemonade',
    'f' => 'chocolate',
    'g' => 'butterscotch',
    'h' => 'ooze',
    'i' => 'safetyvest',
    'j' => 'turtleback',
    'k' => 'rosequartz',
    'm' => 'wolfgrey',
    'n' => 'cerulian',
    'o' => 'skyblue',
    'p' => 'garnet',
    'q' => 'peppermint',
    'r' => 'universe',
    's' => 'royalblue',
    't' => 'mertail',
    'u' => 'inflatablepool',
    'v' => 'pearl',
    'w' => 'prairierose',
    'x' => ''
    }
  },
  color3: {
    genes: '24-27',
    name: 'Accent Color', code: 'AC',   ## colortertiary
    kai: {
    '1' => 'belleblue',
    '2' => 'sandalwood',
    '3' => 'peach',
    '4' => 'icy',
    '5' => 'granitegrey',
    '6' => 'cashewmilk',
    '7' => 'kittencream',
    '8' => 'emeraldgreen',
    '9' => 'kalahari',
    'a' => 'shale',
    'b' => 'purplehaze',
    'c' => 'hanauma',
    'd' => 'azaleablush',
    'e' => 'missmuffett',
    'f' => 'morningglory',
    'g' => 'frosting',
    'h' => 'daffodil',
    'i' => 'flamingo',
    'j' => 'buttercup',
    'k' => 'bloodred',
    'm' => 'atlantis',
    'n' => 'summerbonnet',
    'o' => 'periwinkle',
    'p' => 'patrickstarfish',
    'q' => 'seafoam',
    'r' => 'cobalt',
    's' => 'mallowflower',
    't' => 'mintmacaron',
    'u' => 'sully',
    'v' => 'fallspice',
    'w' => 'dreamboat',
    'x' => ''
    }
  },
  wild: {
    genes: '28-31',
    name: 'Wild', code: 'WE',
    kai: {
    'h' => 'littlefoot',
    'i' => 'elk',
    'j' => 'ducky',
    'k' => 'trioculus',
    'm' => 'daemonwings',
    'n' => 'featherbrain',
    'o' => 'flapflap',
    'p' => 'daemonhorns',
    'q' => 'dragontail',
    'r' => 'aflutter',
    's' => 'foghornpawhorn',
    't' => 'unicorn',
    'u' => 'dragonwings',
    'v' => 'alicorn',
    'w' => 'wyrm',
    'x' => ''
    }
  },
  mouth: {
    genes: '32-35',
    name:  'Mouth', code: 'MO',
    kai: {
    '1' => 'whixtensions',
    '2' => 'wasntme',
    '3' => 'wuvme',
    '4' => 'gerbil',
    '5' => 'confuzzled',
    '6' => 'impish',
    '7' => 'belch',
    '8' => 'rollercoaster',
    '9' => 'beard',
    'a' => 'pouty',
    'b' => 'saycheese',
    'c' => 'grim',
    'd' => 'fangtastic',
    'e' => 'moue',
    'f' => 'happygokitty',
    'g' => 'soserious',
    'h' => 'cheeky',
    'i' => 'starstruck',
    'j' => 'samwise',
    'k' => 'ruhroh',
    'm' => 'dali',
    'n' => 'grimace',
    'o' => 'majestic',
    'p' => 'tongue',
    'q' => 'yokel',
    'r' => 'topoftheworld',
    's' => 'neckbeard',
    't' => 'satiated',
    'u' => 'walrus',
    'v' => 'struck',
    'w' => 'delite',
    'x' => ''
   }
  },
  environment: {
      genes: '36-39',
      name: 'Environment', code: 'EN',
      kai: {
        'h' => 'salty',
        'i' => 'dune',
        'j' => 'juju',
        'k' => 'tinybox',
        'm' => 'myparade',
        'n' => 'finalfrontier',
        'o' => 'metime',
        'p' => 'drift',
        'q' => 'secretgarden',
        'r' => 'frozen',
        's' => 'roadtogold',
        't' => 'jacked',
        'u' => 'floorislava',
        'v' => 'prism',
        'w' => 'junglebook',
        'x' => ''
      }
  },
  secret: {
      genes: '40-43',
      name: 'Secret Y Gene', code: 'SE',   ## todo: change to Y Gene or Y (see https://guide.cryptokitties.co/guide/cat-features/genes)
      kai: { }
      ## use alpha_1, alpha_2, ... - why? why not?
      ## use beta_1, beta_2, ... - why? why not?
      ## use gamma_1, gamma_2, ... - why? why not?
  },
  prestige: {
      genes: '44-47',
      name: 'Purrstige', code: 'PU',
      kai: { }
      ##  prune, furball, duckduckcat, or thatsawrap - more like fancies (not really traits)
  }
}


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


### todo/check: move TIER mapping to Genome class or ... - why? why not?

##################################
#  Tier 0 (Base)           (1-g)
#  Tier 1 (Mewtation I)    (h-p)
#  Tier 2 (Mewtation II)   (q-t)
#  Tier 3 (Mewtation III)  (u,v)
#  Tier 4 (Mewtation IIII) (w)
#
TIER = {    ## todo/fix: use an algo to calculate - why? why not?
  '1' => 0,
  '2' => 0,
  '3' => 0,
  '4' => 0,
  '5' => 0,
  '6' => 0,
  '7' => 0,
  '8' => 0,
  '9' => 0,
  'a' => 0,
  'b' => 0,
  'c' => 0,
  'd' => 0,
  'e' => 0,
  'f' => 0,
  'g' => 0,
  'h' => 1,
  'i' => 1,
  'j' => 1,
  'k' => 1,
  'm' => 1,
  'n' => 1,
  'o' => 1,
  'p' => 1,
  'q' => 2,
  'r' => 2,
  's' => 2,
  't' => 2,
  'u' => 3,
  'v' => 3,
  'w' => 4,
  'x' => nil
}

## (quick 'n' dirty) kai to mutation/mewtation level (I,II,III,IIII)
MUTATION_LEVEL = {
  '1' => '',
  '2' => '',
  '3' => '',
  '4' => '',
  '5' => '',
  '6' => '',
  '7' => '',
  '8' => '',
  '9' => '',
  'a' => '',
  'b' => '',
  'c' => '',
  'd' => '',
  'e' => '',
  'f' => '',
  'g' => '',
  'h' => 'I',
  'i' => 'I',
  'j' => 'I',
  'k' => 'I',
  'm' => 'I',
  'n' => 'I',
  'o' => 'I',
  'p' => 'I',
  'q' => 'II',
  'r' => 'II',
  's' => 'II',
  't' => 'II',
  'u' => 'III',
  'v' => 'III',
  'w' => 'IIII',
  'x' => ''
}
MEWTATION_LEVEL = MUTATION_LEVEL   ## add alias

MUTATION_PAIR = {
  '1' => '',   ## todo: use nil for "" - why? why not?
  '2' => '',
  '3' => '',
  '4' => '',
  '5' => '',
  '6' => '',
  '7' => '',
  '8' => '',
  '9' => '',
  'a' => '',
  'b' => '',
  'c' => '',
  'd' => '',
  'e' => '',
  'f' => '',
  'g' => '',
  'h' => '1+2',
  'i' => '3+4',
  'j' => '5+6',
  'k' => '7+8',
  'm' => '9+a',
  'n' => 'b+c',
  'o' => 'd+e',
  'p' => 'f+g',
  'q' => 'h+i',
  'r' => 'j+k',
  's' => 'm+n',
  't' => 'o+p',
  'u' => 'q+r',
  'v' => 's+t',
  'w' => 'u+v',
  'x' => ''
}
MEWTATION_PAIR = MUTATION_PAIR   ## add alias
