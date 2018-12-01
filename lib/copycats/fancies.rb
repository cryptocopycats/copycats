# encoding: utf-8

###
#
#  for latest updates on new fancies/exclusives see:
#      https://updates.cryptokitties.co   (official latest updates/timeline)
#
#  or see
#      https://blog.kotobaza.co/timeline/


## todo: add formula: []


FANCIES =
{
  ## 2018
  ## November
  draco:                { name: 'Draco',        date: '2018-11-30' },
  dracothemagnificent:  { name: 'Draco The Magnificent', date: '2018-11-27', limit: 12, exclusive: true, ids:	(270..281).to_a },
  bugcatv2:             { name: 'Bug Cat V2',            date: '2018-11-27', limit: 20, exclusive: true, ids: (167..186).to_a, desc: 'Bug Bounty II (Offers Contract) Kitty' },
  dracojunior: { name: 'Draco Junior', date: '2018-11-26' },
  dreggo:      { name: 'Dreggo',       date: '2018-11-21' },
  pickles:     { name: 'Pickles',      date: '2018-11-14',  limit: 303 },
  lilbub:      { name: 'Lil Bub Ub Bub (BUB)',   date: '2018-11-13',  limit: 42, special: true },  ## for search use specialedition:
  lilbubthemagicalspacecat: { name: 'Lil Bub Ub Bub (BUB) The Magical Space Cat', date: '2018-11-13', limit: 3, exclusvie: true, ids: [266,267,268] },

  ## October
  dukecat:       { name: 'Dukecat',       date: '2018-10-18', limit: 1366 },
  sheilapurren:  { name: 'Sheila Purren', date: '2018-10-04', limit: 1971 },

  ## September
  pawzilla: { name: 'Pawzilla', date: '2018-09-22', limit: 1185 },
  vulcat:   { name: 'Vulcat',   date: '2018-09-12', limit: 1, exclusive: true, ids: [1000000], desc: '1 000 000th Kitty' },
  meowstro: { name: 'Meowstro', date: '2018-09-09', limit: 1698 },
  atlas:    { name: 'Atlas',    date: '2018-09-07', limit: 998  },

  ## August
  vulcant:        { name: 'Vulcant',        date: '2018-08-31', limit: 20, exclusive: true, ids: [932914,937360,938299,946526,948925,949058,950617,952280,952981,956374,956908,958570,964205,967234,983046,984451,990713,992861,995745,997469] },
  purrity:        { name: 'Purrity',        date: '2018-08-23', limit: 5984 },
  rabbidkitty:    { name: 'Rabbid Kitty',   date: '2018-08-23', limit: 6, exclusive: true, ids: (260..265).to_a },
  squiddlesworth: { name: 'Squiddlesworth', date: '2018-08-16', limit: 1510 },

  ## July
  purrspero:      { name: 'Purrspero',   date: '2018-07-27', limit: 4448 },
  catbury:        { name: 'Catbury',     date: '2018-07-25', limit: 76 },
  honu:           { name: 'Honu',        date: '2018-07-20', limit: 1, exclusive: true, ids: [251] },
  victoire:       { name: 'Victoire',    date: '2018-07-18', limit: 1, exclusive: true, ids: [402], desc: 'France Football World Cup Champion' },
  lulu:           { name: 'Lulu',        date: '2018-07-13', limit: 999 },
  boot:           { name: 'Boot',        date: '2018-07-05', limit: 1440,  desc: 'Football World Cup' },
  ## note: boot - different variants for world cup teams!!! make sub-fancies - why? why not?

  ## June
  raspoutine:    { name: 'Raspoutine',  date: '2018-06-28', limit: 1867 },
  furlin:        { name: 'Furlin',      date: '2018-06-26', limit: 52, exclusive: true, ids: (115..166).to_a },
  kittypride:    { name: 'Kitty Pride', date: '2018-06-21', limit: 1316 },
  furrmingo:     { name: 'Furrmingo',   date: '2018-06-14', limit: 333  },

  ## May
  page:              { name: 'Page',              date: '2018-05-31',  limit: 50_000  },
  "schrödingerscat": { name: "Schrödinger's Cat", date: '2018-05-20',  limit: 73 },
  chatplongeur:      { name: 'Chat Plongeur',     date: '2018-05-19',  limit: 1910 },
  docpurr:             { name: 'Doc Purr',         date: '2018-05-16',  limit: 250 },
  celestialcyberdimension: { name: 'Celestial Cyber Dimension', date: '2018-05-12', limit: 1, exclusive: true },
  swish:               { name: 'Swish', date: '2018-05-08', limit: 2880 },

  ## April
  flutterbee:  { name: 'Flutterbee', date: '2018-04-28', limit: 275 },
  vernon:      { name: 'Vernon',     date: '2018-04-16', limit: 320, desc: 'Spring Equinox Kitty' },  ## first, see https://www.cryptokitties.co/kitty/696398

  ## March
  berry:           { name: 'Berry',   date: '2018-03-16' limit: 200  },
  pussforprogress: { name: 'Puss For Progress', date: '2018-03-08', limit: 1920, desc: "Women's Day" },
  fortunecat:      { name: 'Fortune Cat', name_cn: '红包喵', date: '2018-03-08', limit: 888 },  ## todo: check date for china launch specials!!!
  goldendragoncat: { name: 'Golden Dragon Cat', name_cn: '帝龙喵', date: '2018-03-08', limit: 1, exclusive: true, ids: [888], desc: 'China Launch' }, ## todo: check date for china launch specials!!!
  goldendogcat:    { name: 'Golden Dog Cat', name_cn: '旺财汪', date: '2018-03-08', limit: 11, exclusive: true, ids: [1802,1803,1805,1806,1808,1809,1812,1816,1826,1827,1828], desc: 'China Launch' },  ## todo: check date for china launch specials!!!
  liondance:    { name: 'Lion Dance', name_cn: '咚咚锵', date: '2018-03-07', limit: 888 },
  dogcat:       { name: 'Dog Cat',    name_cn: '汪星爷', date: '2018-03-02', limit: 88, desc: 'Year of the Dog (Greater China)' },
  knightkitty:  { name: 'Knight Kitty',  date: '2018-03-01',  limit: 11, exclusive: true, ids: (104..114).to_a },

  ## February
  tabby:           { name: 'Tabby',           date: '2018-02-26', limit: 250 },
  yuricatsuki:     { name: 'Yuri Catsuki',    date: '2018-02-20', limit: 250,  desc: 'Figure Scating Kitty - Winter Olympics (Korea)' },
  misterpurrfect:  { name: 'Mister Purrfect', date: '2018-02-14', limit: 1000, desc: "Valentine's Day" },
  earnie:          { name: 'Earnie',          date: '2018-02-13', limit: 500,  desc: 'Earn.com - Golden Kitty Award (Product Hunt)' },
  cathena:         { name: 'Cathena',         date: '2018-02-06', limit: 1,  exclusive: true, ids: [500000], desc: '500 000th Kitty' },

  ## January
  'momo-chan':     { name: 'Momo-chan',       date: '2018-01-31',  limit: 500, desc: 'Ninja Kitty' },
  negato:          { name: 'Negato',          date: '2018-01-29',  limit: 500, desc: 'Ninja Kitty' },
  stiches:         { name: 'Stiches',         date: '2018-01-10',  limit: 500, desc: 'Zombie Kitty' },

  ## 2017
  ## December
  phuziqaat:    { name: 'Phu Ziqaat',    date: '2017-12-31',  limit: 1000,  desc: 'Alien Kitty' },
  santaclaws:   { name: 'Santa Claws',   date: '2017-12-12',  limit: 1000,  desc: 'Ho Ho Ho - Santa Claus Kitty' },
  mistletoe:    { name: 'Mistletoe',     date: '2017-12-09',  limit: 2000,  desc: "XMas Kitty" },
  dracula:      { name: 'Dracula',       date: '2017-12-01',  limit: 2000  },

  ## November
  ducat:        { name: 'Du Cat',        date: '2017-11-29',  limit: 10_000 },
  genesis:      { name: 'Genesis',       date: '2017-11-24',  limit: 1,     exclusive: true, ids: [1],  desc: '1st Kitty' },
  shipcat:      { name: 'Ship Cat',      date: '2017-11-23',  limit: 2000,   },
  bugcat:       { name: 'Bug Cat',       date: '2017-11-23',  limit: 3,     exclusive: true, ids: [101,102,103], desc: 'Bug Bounty Kitty' },
}
