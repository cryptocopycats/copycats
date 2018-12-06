# encoding: utf-8

###
#
#  for latest updates on new fancies/exclusives see:
#      https://updates.cryptokitties.co   (official latest updates/timeline)
#
#  or see
#      https://blog.kotobaza.co/timeline/


## todo: add formula: []

##
## note:
##  for time limits for fancies use:
##     e.g. time: { end: '2018-12-07' }   # until dec/7
##
##  for overflows for limited edition use:
##     e.g. overflow: 1      #   888+1  (=889)


FANCIES =
{
  ## 2018
  ## November
  draco:                { name: 'Draco',        date: '2018-11-30', time: { end: '2018-12-07' },
                          formula: ['toyger', 'martian', 'peppermint', 'dragonwings', 'SE03']},
  dracothemagnificent:  { name: 'Draco The Magnificent', date: '2018-11-27', limit: 12, exclusive: true, ids:	(270..281).to_a },
  bugcatv2:             { name: 'Bug Cat V2',            date: '2018-11-27', limit: 20, exclusive: true, ids: (167..186).to_a, desc: 'Bug Bounty II (Offers Contract) Kitty' },
  dracojunior: { name: 'Draco Junior', date: '2018-11-26', time: { end: '2018-12-07' },
                 formula: ['lynx', 'verdigris', 'dragontail', 'SE03']},
  dreggo:      { name: 'Dreggo',       date: '2018-11-21', time: { end: '2018-12-07' },
                 formula: ['siberian', 'bananacream', 'SE03']},
  pickles:     { name: 'Pickles',      date: '2018-11-14',  limit: 303,
                 formula: ['lynx', 'martian', 'highsociety', 'emeraldgreen']},
  lilbub:      { name: 'Lil Bub Ub Bub (BUB)',   date: '2018-11-13',  limit: 42, special: true },  ## for search use specialedition:

  lilbubthemagicalspacecat: { name: 'Lil Bub Ub Bub (BUB) The Magical Space Cat', date: '2018-11-13', limit: 3, exclusive: true, ids: [266,267,268] },

  ## October
  thatsawrap:  { name: 'Thatsawrap', date: '2018-10-21', limit:	615, time: { start: '2018-10-20', end: '2018-11-06' }, prestige: true,
                  formula: ['bobtail','WE00','PU28']},
  duckduckcat: { name: 'Duckduckcat', date: '2018-10-19', limit: 1249, time: { start: '2018-10-20', end: '2018-11-15' }, prestige: true,
                   formula: ['neckbeard',['PU24','PU25','PU26']]},  ##  Purrstige: PU24 / PU25 / PU26

  dukecat:       { name: 'Dukecat',       date: '2018-10-18', limit: 1366,
                   formula: ['cymric', 'periwinkle', 'simple', 'tongue']},
  sheilapurren:  { name: 'Sheila Purren', date: '2018-10-04', limit: 1971, desc: 'Sheila Warren Kitty-fied - Head of Blockchain and Distributed Ledger Technology at the World Economic Forum (WEF)',
                   formula: ['mauveover', 'icy', 'wingtips', 'fangtastic']},

  ## September
  pawzilla: { name: 'Pawzilla', date: '2018-09-22', limit: 1185,
              formula: ['jaguar', 'universe', 'atlantis', 'littlefoot']},
  prune:   { name: 'Prune', date: '2018-09-19', limit: 921, time: { start: '2018-09-18', end: '2018-09-30' }, prestige: true,
            formula: ['norwegianforest', 'totesbasic', 'PU25']},     ## todo/fix: check totesbasic - three genes!!! - check which one PA15?
  furball:  { name: 'Furball', date: '2018-09-19', limit: 998, time: { start: '2018-09-19', end: '2018-09-30' }, prestige: true,
              formula: ['norwegianforest', 'totesbasic', 'PU26']},   ## todo/fix: check totesbasic - three genes!!! - check which one PA15?
  vulcat:   { name: 'Vulcat',   date: '2018-09-12', limit: 1, exclusive: true, ids: [1000000], desc: '1 000 000th Kitty' },
  meowstro: { name: 'Meowstro', date: '2018-09-09', limit: 1698,
              formula: ['onyx', 'wowza', 'eclipse']},
  atlas:    { name: 'Atlas',    date: '2018-09-07', limit: 998,
              formula: ['highlander', 'kittencream', 'swarley', 'topoftheworld']},

  ## August
  vulcant:        { name: 'Vulcant',        date: '2018-08-31', limit: 20, exclusive: true, ids: [932914,937360,938299,946526,948925,949058,950617,952280,952981,956374,956908,958570,964205,967234,983046,984451,990713,992861,995745,997469] },
  purrity:        { name: 'Purrity',        date: '2018-08-23', limit: 5984,
                    formula: ['selkirk', 'chronic', 'cloudwhite', 'cheeky']},
  rabbidkitty:    { name: 'Rabbid Kitty',   date: '2018-08-23', limit: 6, exclusive: true, ids: (260..265).to_a, desc: 'Ubisoft Blockchain Heroes Hackathon' },
  squiddlesworth: { name: 'Squiddlesworth', date: '2018-08-16', limit: 1510, desc: 'Lava Squid Cat',
                     formula: ['sphynx', 'redvelvet', 'patrickstarfish', 'dragontail']},

  ## July
  purrspero:      { name: 'Purrspero',   date: '2018-07-27', limit: 4448,
                    formula: ['dippedcone', 'googly', 'royalpurple', 'beard']},
  catbury:        { name: 'Catbury',     date: '2018-07-25', limit: 76,
                     formula: ['ragdoll', 'crazy', 'chocolate', 'mintmacaron', 'yokel', 'WE02']},
  honu:           { name: 'Honu',        date: '2018-07-20', limit: 1, exclusive: true, ids: [251], desc: 'Kitties for Good - Save Turtle Habitats' },
  victoire:       { name: 'Victoire',    date: '2018-07-18', limit: 1, exclusive: true, ids: [402], desc: 'France Football World Cup Champion' },
  lulu:           { name: 'Lulu',        date: '2018-07-13', limit: 999,
                    formula: ['cyan', 'verdigris', 'turtleback', 'salty']},
  boot:           { name: 'Boot',        date: '2018-07-05', limit: 1440,  desc: 'Football World Cup',
                    formula: ['ganado', 'wiley', 'cerulian', 'rollercoaster'],
                    variants: {
                      belgium: { name: 'Belgium', limit: 97,   formula: [['orangesoda','onyx']]},                    ## Base Color: Orangesoda / Onyx
                      brazil:  { name: 'Brazil',  limit: 195,  formula: [['hintomint','bananacream','verdigris']]},  ## Base Color: Hintomint / Bananacream / Verdigris
                      croatia: { name: 'Croatia', limit: 253,  formula: [['cottoncandy','mauveover','oldlace']]},    ## Base Color: Cottoncandy / Mauveover / Oldlace
                      england: { name: 'England', limit: 168,  formula: [['greymatter','martian']]},                 ## Base Color: Greymatter / Martian
                      france:  { name: 'France',  limit: 317,  formual: [['harbourfog','cinderella','lavender']]},   ## Base Color: Harbourfog / Cinderella / Lavender
                      russia:  { name: 'Russia',  limit: 94,   formula: [['shadowgrey','salmon','cloudwhite']]},     ## Base Color: Shadowgrey / Salmon/ Cloudwhite
                      sweden:  { name: 'Sweden',  limit: 123,  formula: [['brownies','dragonfruit','redvelvet']]},   ## Base Color: Brownies / Dragonfruit / Redvelvet
                      uruguay: { name: 'Uruguay', limit: 193,  formula: [['aquamarine','nachocheez','koala']]},      ## Base Color: Aquamarine / Nachocheez / Koala
                    },
                  },
  ## note: boot - different variants for world cup teams
  ##  Although there are 8 unique Fancies, they're actually each a variant on the same Fancy - Boot.
  ##  Their colours are different, and you can collect all 8 as a set

  ## June
  raspoutine:    { name: 'Raspoutine',  date: '2018-06-28', limit: 1867,
                    formula: ['buzzed', 'nachocheez', 'sandalwood', 'belch']},
  furlin:        { name: 'Furlin',      date: '2018-06-26', limit: 52, exclusive: true, ids: (115..126).to_a + (128..166).to_a },
  kittypride:    { name: 'Kitty Pride', date: '2018-06-21', limit: 1316,
                    formula: ['fabulous','cinderella','garnet']},
  furrmingo:     { name: 'Furrmingo',   date: '2018-06-14', limit: 333,
                    formula: ['bobtail', 'egyptiankohl', 'flamingo', 'whixtensions']},

  ## May
  page:              { name: 'Page',              date: '2018-05-31',  limit: 50_000,
                       formula: ['rascal', 'peach', 'wasntme' ]},
  "schrödingerscat": { name: "Schrödinger's Cat", date: '2018-05-20',  limit: 73,
                        formula: ['forgetmenot','tinybox','PU20','SE25']},
  chatplongeur:      { name: 'Chat Plongeur',     date: '2018-05-19',  limit: 1910,
                        formula: ['aquamarine', 'skyblue', 'seafoam']},
  docpurr:             { name: 'Doc Purr',         date: '2018-05-16',  limit: 250,
                          formula: ['persian','spock','raisedbrow','violet','tongue']},
  celestialcyberdimension: { name: 'Celestial Cyber Dimension', date: '2018-05-12', limit: 1, exclusive: true, ids: [127] },
  swish:               { name: 'Swish', date: '2018-05-08', limit: 2880,
                          formula: ['norwegianforest', 'luckystripes', 'thicccbrowz', 'orangesoda']},

  ## April
  flutterbee:  { name: 'Flutterbee', date: '2018-04-28', limit: 275,
                 formula: ['cloudwhite','jaguar','lemonade','azaleablush','WE14']},
  vernon:      { name: 'Vernon',     date: '2018-04-16', limit: 320, desc: 'Spring Equinox Kitty',
                  formula: ['amur','fabulous','cottoncandy','springcrocus','belleblue','soserious']},  ## first, see https://www.cryptokitties.co/kitty/696398

  ## March
  berry:           { name: 'Berry',   date: '2018-03-16', limit: 200,
                     formula: ['dragonfruit','thunderstruck','emeraldgreen','apricot','simple']},
  pussforprogress: { name: 'Puss For Progress', date: '2018-03-08', limit: 1920, desc: "Women's Day",
                     formula: ['himalayan','peach','safetyvest','gerbil']},
  fortunecat:      { name: 'Fortune Cat', name_cn: '红包喵', date: '2018-03-08', limit: 888,
                      formula: ['harbourfog','calicool','swampgreen','sapphire','beard']},  ## todo: check date for china launch specials!!!
  goldendragoncat: { name: 'Golden Dragon Cat', name_cn: '帝龙喵', date: '2018-03-08', limit: 1, exclusive: true, ids: [888], desc: 'China Launch' }, ## todo: check date for china launch specials!!!
  goldendogcat:    { name: 'Golden Dog Cat', name_cn: '旺财汪', date: '2018-03-08', limit: 11, exclusive: true, ids: [1802,1803,1805,1806,1808,1809,1812,1816]+(1825..1828).to_a, desc: 'China Launch' },  ## todo: check date for china launch specials!!!
  liondance:    { name: 'Lion Dance', name_cn: '咚咚锵', date: '2018-03-07', limit: 888, overflow: 1,
                    formula: ['manx','royalblue','googly','starstruck']},
  dogcat:       { name: 'Dog Cat',    name_cn: '汪星爷', date: '2018-03-02', limit: 88, desc: 'Year of the Dog (Greater China)',
                   formula: ['tigerpunk','periwinkle','barkbrown','sweetmeloncakes','yokel']},
  knightkitty:  { name: 'Knight Kitty',  date: '2018-03-01',  limit: 11, exclusive: true, ids: (104..114).to_a },

  ## February
  tabby:           { name: 'Tabby',           date: '2018-02-26', limit: 250,
                      formula: ['ragamuffin','morningglory','otaku','cheeky']},
  yuricatsuki:     { name: 'Yuri Catsuki',    date: '2018-02-20', limit: 250,  desc: 'Figure Scating Kitty - Winter Olympics (Korea)',
                       formula: ['cymric','tiger','neckbeard','elk']},
  misterpurrfect:  { name: 'Mister Purrfect', date: '2018-02-14', limit: 1000, desc: "Valentine's Day",
                        formula: ['chocolate','baddate','strawberry','wuvme']},
  earnie:          { name: 'Earnie',          date: '2018-02-13', limit: 500,  desc: 'Earn.com - Golden Kitty Award (Product Hunt)',
                        formula: ['birman','orangesoda','hotrod','grim']},
  cathena:         { name: 'Cathena',         date: '2018-02-06', limit: 1,  exclusive: true, ids: [500000], desc: '500 000th Kitty' },

  ## January
  'momo-chan':     { name: 'Momo-chan',       date: '2018-01-31',  limit: 500, desc: 'Ninja Kitty',
                       formula: ['onyx','henna','bloodred','wolfgrey','sass']},
  negato:          { name: 'Negato',          date: '2018-01-29',  limit: 500, desc: 'Ninja Kitty',
                       formula: ['onyx','henna','wolfgrey','slyboots']},
  stitches:        { name: 'Stitches',         date: '2018-01-10',  limit: 500, desc: 'Zombie Kitty',
                       formula: ['hintomint','seafoam','swampgreen','saycheese']},

  ## 2017
  ## December
  phuziqaat:    { name: 'Phu Ziqaat',    date: '2017-12-31',  limit: 1000,  desc: 'Alien Kitty',
                   formula: ['chartreux','spock','alien','pouty']},
  santaclaws:   { name: 'Santa Claws',   date: '2017-12-12',  limit: 1000, overflow: 2, desc: 'Ho Ho Ho - Santa Claus Kitty',
                    formula: ['cloudwhite','scarlet','beard','wild_d']},
  mistletoe:    { name: 'Mistletoe',     date: '2017-12-09',  limit: 2000,  desc: "XMas Kitty",
                   formula: ['odlace','crazy','gerbil']},
  dracula:      { name: 'Dracula',       date: '2017-12-01',  limit: 2000,
                   formula: ['laperm','spock','strawberry','WE01']},

  ## November
  ducat:        { name: 'Du Cat',        date: '2017-11-29',  limit: 10_000,
                    formula: ['cymric','tongue']},
  genesis:      { name: 'Genesis',       date: '2017-11-24',  limit: 1,     exclusive: true, ids: [1],  desc: '1st Kitty'},
  shipcat:      { name: 'Ship Cat',      date: '2017-11-23',  limit: 2000,
                    formula: ['sphynx','orangesoda','luckystripe','crazy']},
  bugcat:       { name: 'Bug Cat',       date: '2017-11-23',  limit: 3,     exclusive: true, ids: [101,102,103], desc: 'Bug Bounty Kitty' },
}
