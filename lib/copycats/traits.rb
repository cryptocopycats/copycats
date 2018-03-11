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
    name:  'Fur',
    kai: {
    '1' => 'savannah',
    '2' => 'selkirk',
    '3' => '',
    '4' => 'birman',
    '5' => '',
    '6' => 'bobtail',
    '7' => '',
    '8' => '',
    '9' => '',
    'a' => 'cymric',
    'b' => 'chartreux',
    'c' => 'himalayan',
    'd' => 'munchkin',
    'e' => 'sphynx',
    'f' => 'ragamuffin',
    'g' => 'ragdoll',
    'h' => 'norwegianforest',
    'i' => '',
    'j' => '',
    'k' => '',
    'm' => '',
    'n' => 'mainecoon',
    'o' => 'laperm',
    'p' => 'persian',
    'q' => '',
    'r' => '',
    's' => '',
    't' => 'manx',
    'u' => '',
    'v' => '',
    'w' => '',
    'x' => ''
    }
  },
  pattern: {
    genes: '4-7',
    name: 'Pattern',
    kai: {
    '1' => '',
    '2' => 'tiger',
    '3' => '',
    '4' => 'ganado',
    '5' => 'leopard',
    '6' => 'camo ',
    '7' => '',
    '8' => 'spangled',
    '9' => 'calicool',
    'a' => 'luckystripe',
    'b' => 'amur',
    'c' => 'jaguar',
    'd' => 'spock',
    'e' => '',
    'f' => 'totesbasic',  ## use totesbasic_f - why? why not?
    'g' => 'totesbasic',  ## use totesbasic_g
    'h' => '',
    'i' => '',
    'j' => 'dippedcone',
    'k' => '',
    'm' => 'tigerpunk',
    'n' => 'henna',
    'o' => '',
    'p' => 'totesbasic',  ## use totesbasic_p
    'q' => '',
    'r' => '',
    's' => 'hotrod',
    't' => '',
    'u' => '',
    'v' => '',
    'w' => '',
    'x' => ''
    }
  },
  coloreyes: {
    genes: '8-11',
    name:  'Eye Color',
    kai: {
    '1' => 'thundergrey',
    '2' => 'gold',
    '3' => 'topaz',
    '4' => 'mintgreen',
    '5' => '',
    '6' => 'sizzurp',
    '7' => 'chestnut',
    '8' => 'strawberry',
    '9' => 'sapphire',
    'a' => 'forgetmenot',
    'b' => '',
    'c' => 'coralsunrise',
    'd' => '',
    'e' => '',
    'f' => '',
    'g' => '',
    'h' => 'pumpkin',
    'i' => 'limegreen',
    'j' => '',
    'k' => 'bubblegum',
    'm' => 'twilightsparkle',
    'n' => '',
    'o' => '',
    'p' => '',
    'q' => 'babypuke',
    'r' => '',
    's' => '',
    't' => '',
    'u' => '',
    'v' => '',
    'w' => '',
    'x' => ''
    }
  },
  eyes: {
    genes: '12-15',
    name: 'Eye Shape', ##  eye type
    kai: {
    '2' => 'wonky',
    '3' => 'serpent',
    '4' => 'googly',
    '5' => 'otaku',
    '6' => 'simple',
    '7' => 'crazy',
    '8' => 'thicccbrowz',
    'b' => 'baddate',
    'd' => 'chronic',
    'e' => 'slyboots',
    'f' => 'wiley',
    'g' => 'stunned',
    'i' => 'alien',
    'j' => 'fabulous',
    'k' => 'raisedbrow',
    'o' => 'sass',
    'p' => 'sweetmeloncakes',
    'r' => 'wingtips',
    't' => 'buzzed'
    }
  },
  color1: {
    genes: '16-19',
    name: 'Base Color',   ##  colorprimary / body color
    kai: {
    '1' => 'shadowgrey',
    '2' => 'salmon',
    '4' => 'orangesoda',
    '5' => 'cottoncandy',
    '6' => 'mauveover',
    '7' => 'aquamarine',
    '8' => 'nachocheez',
    '9' => 'harbourfog',
    'b' => 'greymatter',
    'f' => 'hintomint',
    'g' => 'bananacream',
    'h' => 'cloudwhite',
    'j' => 'oldlace',
    'k' => 'koala',
    'p' => 'verdigris',
    'r' => 'onyx'
    }
  },
  color2: {
    genes: '20-23',
    name:  'Highlight Color',  ## colorsecondary / sec color / pattern color
    kai: {
    '3' => 'egyptiankohl',
    '5' => 'lilac',
    '6' => 'apricot',
    '7' => 'royalpurple',
    '9' => 'swampgreen',
    'a' => 'violet',
    'b' => 'scarlet',
    'c' => 'barkbrown',
    'd' => 'coffee',
    'e' => 'lemonade',
    'f' => 'chocolate',
    'j' => 'turtleback',
    'm' => 'wolfgrey',
    'n' => 'cerulian',
    'o' => 'skyblue',
    's' => 'royalblue'
    }
  },
  color3: {
    genes: '24-27',
    name: 'Accent Color',  ## colortertiary
    kai: {
    '1' => 'belleblue',
    '2' => 'sandalwood',
    '3' => 'peach',
    '4' => 'icy',
    '5' => 'granitegrey',
    '6' => '',
    '7' => 'kittencream',
    '8' => 'emeraldgreen',
    '9' => '',
    'a' => '',
    'b' => 'purplehaze',
    'c' => '',
    'd' => 'azaleablush',
    'e' => 'missmuffett',
    'f' => 'morningglory',
    'g' => '',
    'h' => 'daffodil',
    'i' => 'flamingo',
    'j' => '',
    'k' => 'bloodred',
    'm' => '',
    'n' => '',
    'o' => 'periwinkle',
    'p' => '',
    'q' => 'seafoam',
    'r' => '',
    's' => '',
    't' => '',
    'u' => '',
    'v' => '',
    'w' => '',
    'x' => ''
    }
  },
  wild: {
    genes: '28-31',
    name: 'Wild',
    kai: {
    'i' =>  'elk',
    'k' =>  'trioculus'
    }
  },
  mouth: {
    genes: '32-35',
    name:  'Mouth',
    kai: {
    '1' => 'whixtensions',
    '2' => 'wasntme',
    '3' => 'wuvme',
    '4' => 'gerbil',
    '5' => '',
    '6' => '',
    '7' => '',
    '8' => '',
    '9' => 'beard',
    'a' => 'pouty',
    'b' => 'saycheese',
    'c' => 'grim',
    'd' => '',
    'e' => '',
    'f' => 'happygokitty',
    'g' => 'soserious',
    'h' => 'cheeky',
    'i' => 'starstruck',
    'j' => '',
    'k' => '',
    'm' => 'dali',
    'n' => 'grimace',
    'o' => '',
    'p' => 'tongue',
    'q' => 'yokel',
    'r' => '',
    's' => 'neckbeard',
    't' => '',
    'u' => '',
    'v' => '',
    'w' => '',
    'x' => ''
   }
  },
  future1: {
      genes: '36-39',
      name: 'Future 1',
      kai: { }   ## use alpha_1, alpha_2, ... - why? why not?
  },
  future2: {
      genes: '40-43',
      name: 'Future 2',
      kai: { }   ## use beta_1, beta_2, ... - why? why not?
  },
  future3: {
      genes: '44-47',
      name: 'Future 3',
      kai: { }   ## use gamma_1, gamma_2, ... - why? why not?
  }
}
