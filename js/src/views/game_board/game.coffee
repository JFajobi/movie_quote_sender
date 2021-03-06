window.Movie ||= {}
window.Movie.Collection ||= {}
window.Movie.Models ||= {}

class Movie.Models.Game extends Backbone.Model

  defaults:
    quote: ""
    right: ""
    consumed: false
   


class Movie.Collection.GameCollection extends Backbone.Collection
  localStorage: new Backbone.LocalStorage("GameCollection")

  model: Movie.Models.Game  

  initialize: ->
    q1 = new Movie.Models.Game({quote:"Frankly, my dear, I don't give a damn.", right:"Gone With The Wind"})
    q2 = new Movie.Models.Game({quote:"I'm gonna make him an offer he can't refuse.", right:"The Godfather"})
    q3 = new Movie.Models.Game({quote:"You don't understand! I coulda had class. I coulda been a contender. I could've been somebody, instead of a bum, which is what I am", right:"On The Waterfront"})
    q4 = new Movie.Models.Game({quote:"Toto, I've a feeling we're not in Kansas anymore.", right:"THE WIZARD OF OZ"})
    q5 = new Movie.Models.Game({quote:"Here's looking at you, kid.", right:"CASABLANCA"})
    q6 = new Movie.Models.Game({quote:"Go ahead, make my day.", right:"SUDDEN IMPACT"})
    q7 = new Movie.Models.Game({quote:"All right, Mr. DeMille, I'm ready for my close-up.", right:"SUNSET BLVD."})
    q8 = new Movie.Models.Game({quote:"May the Force be with you.", right:"STAR WARS"})
    q9 = new Movie.Models.Game({quote:"Fasten your seatbelts. It's going to be a bumpy night.", right:"ALL ABOUT EVE"})
    q10 = new Movie.Models.Game({quote:"You talking to me?", right:"TAXI DRIVER"})
    q11 = new Movie.Models.Game({quote:"What we've got here is failure to communicate.", right:"COOL HAND LUKE"})
    q12 = new Movie.Models.Game({quote:"I love the smell of napalm in the morning.", right:"APOCALYPSE NOW"})
    q13 = new Movie.Models.Game({quote:"Love means never having to say you're sorry.", right:"LOVE STORY"})
    q14 = new Movie.Models.Game({quote:"the stuff that dreams are made of.", right:"THE MALTESE FALCON"})
    q15 = new Movie.Models.Game({quote:"E.T. phone home.", right:"E.T. THE EXTRA-TERRESTRIAL"})
    q16 = new Movie.Models.Game({quote:"They call me Mister Tibbs!", right:"IN THE HEAT OF THE NIGHT"})
    q17 = new Movie.Models.Game({quote:"Rosebud", right:"CITIZEN KANE"})
    q18 = new Movie.Models.Game({quote:"Made it, Ma! Top of the world!", right:"WHITE HEAT"})
    q19 = new Movie.Models.Game({quote:"I'm as mad as hell, and I'm not going to take this anymore!", right:"NETWORK"})
    q20 = new Movie.Models.Game({quote:"Today, I consider myself the luckiest man on the face of the earth.", right:"THE PRIDE OF THE YANKEES"})
    q21 = new Movie.Models.Game({quote:"Louis, I think this is the beginning of a beautiful friendship.", right:"CASABLANCA"})
    q22 = new Movie.Models.Game({quote:"A census taker once tried to test me. I ate his liver with some fava beans and a nice Chianti.", right:"THE SILENCE OF THE LAMBS"})
    q23 = new Movie.Models.Game({quote:"Bond. James Bond.", right:"DR. NO"})
    q24 = new Movie.Models.Game({quote:"There's no place like home.", right:"THE WIZARD OF OZ"})
    q25 = new Movie.Models.Game({quote:"I am big! It's the pictures that got small.", right:"SUNSET BLVD."})
    q26 = new Movie.Models.Game({quote:"Show me the money!", right:"JERRY MAGUIRE"})
    q27 = new Movie.Models.Game({quote:"Why don't you come up sometime and see me?", right:"SHE DONE HIM WRONG"})
    q28 = new Movie.Models.Game({quote:"I'm walking here! I'm walking here!", right:"MIDNIGHT COWBOY"})
    q29 = new Movie.Models.Game({quote:"Play it, Sam. Play 'As Time Goes By.'", right:"CASABLANCA"})
    q30 = new Movie.Models.Game({quote:"You can't handle the truth!", right:"A FEW GOOD MEN"})
    q31 = new Movie.Models.Game({quote:"I want to be alone.", right:"GRAND HOTEL"})
    q32 = new Movie.Models.Game({quote:"After all, tomorrow is another day!", right:"GONE WITH THE WIND"})
    q33 = new Movie.Models.Game({quote:"Round up the usual suspects.", right:"CASABLANCA"})
    q34 = new Movie.Models.Game({quote:"I'll have what she's having.", right:"WHEN HARRY MET SALLY"})
    q35 = new Movie.Models.Game({quote:"You know how to whistle, don't you, Steve? You just put your lips together and blow.", right:"TO HAVE AND HAVE NOT"})
    q36 = new Movie.Models.Game({quote:"You're gonna need a bigger boat.", right:"JAWS"})
    q37 = new Movie.Models.Game({quote:"Badges? We ain't got no badges! We don't need no badges! I don't have to show you any stinking badges!", right:"THE TREASURE OF THE SIERRA MADRE"})
    q38 = new Movie.Models.Game({quote:"I'll be back.", right:"THE TERMINATOR"})
    q39 = new Movie.Models.Game({quote: "If you build it, he will come.", right: "FIELD OF DREAMS"})
    q40 = new Movie.Models.Game({quote: "My mama always said life was like a box of chocolates. You never know what you're gonna get.", right: "FORREST GUMP"})
    q41 = new Movie.Models.Game({quote: "We rob banks.", right: "BONNIE AND CLYDE"})
    q42 = new Movie.Models.Game({quote: "Plastics.", right: "THE GRADUATE"})
    q43 = new Movie.Models.Game({quote: "We'll always have Paris.", right: "CASABLANCA"})
    q44 = new Movie.Models.Game({quote: "I see dead people.", right: "THE SIXTH SENSE"})
    q45 = new Movie.Models.Game({quote: "Stella! Hey, Stella!", right: "A STREETCAR NAMED DESIRE"})
    q46 = new Movie.Models.Game({quote: "Oh, Jerry, don't let's ask for the moon. We have the stars.", right: "NOW, VOYAGER"})
    q47 = new Movie.Models.Game({quote: "Shane. Shane. Come back!", right: "SHANE"})
    q48 = new Movie.Models.Game({quote: "Well, nobody's perfect.", right: "SOME LIKE IT HOT"})
    q49 = new Movie.Models.Game({quote: "It's alive! It's alive!", right: "FRANKENSTEIN"})
    q50 = new Movie.Models.Game({quote: "Houston, we have a problem.", right: "APOLLO 13 "})
    q51 = new Movie.Models.Game({quote: "You've got to ask yourself one question: 'Do I feel lucky?' Well, do ya, punk?", right: "DIRTY HARRY"})
    q52 = new Movie.Models.Game({quote: "You had me at 'hello.'", right: "JERRY MAGUIRE"})
    q53 = new Movie.Models.Game({quote: "One morning I shot an elephant in my pajamas. How he got in my pajamas, I don't know.", right: "ANIMAL CRACKERS"})
    q54 = new Movie.Models.Game({quote: "There's no crying in baseball!", right: "A LEAGUE OF THEIR OWN"})
    q55 = new Movie.Models.Game({quote: "La-dee-da, la-dee-da.", right: "ANNIE HALL"})
    q56 = new Movie.Models.Game({quote: "A boy's best friend is his mother.", right: "PSYCHO"})
    q57 = new Movie.Models.Game({quote: "Greed, for lack of a better word, is good.", right: "WALL STREET"})
    q58 = new Movie.Models.Game({quote: "Keep your friends close, but your enemies closer.", right: "THE GODFATHER II"})
    q59 = new Movie.Models.Game({quote: "As God is my witness, I'll never be hungry again.", right: "GONE WITH THE WIND"})
    q60 = new Movie.Models.Game({quote: "Well, here's another nice mess you've gotten me into!", right: "SONS OF THE DESERT"})
    q61 = new Movie.Models.Game({quote: "Say 'hello' to my little friend!", right: "SCARFACE"})
    q62 = new Movie.Models.Game({quote: "What a dump.", right: "BEYOND THE FOREST"})
    q63 = new Movie.Models.Game({quote: "Mrs. Robinson, you're trying to seduce me. Aren't you?", right: "THE GRADUATE"})
    q64 = new Movie.Models.Game({quote: "Gentlemen, you can't fight in here! This is the War Room!", right: "DR. STRANGELOVE"})
    q65 = new Movie.Models.Game({quote: "Elementary, my dear Watson.", right: "THE ADVENTURES OF SHERLOCK HOLMES"})
    q66 = new Movie.Models.Game({quote: "Take your stinking paws off me, you damned dirty ape.", right: "PLANET OF THE APES"})
    q67 = new Movie.Models.Game({quote: "Of all the gin joints in all the towns in all the world, she walks into mine.", right: "CASABLANCA"})
    q68 = new Movie.Models.Game({quote: "Here's Johnny!", right: "THE SHINING"})
    q69 = new Movie.Models.Game({quote: "They're here!", right: "POLTERGEIST"})
    q70 = new Movie.Models.Game({quote: "Is it safe?", right: "MARATHON MAN"})
    q71 = new Movie.Models.Game({quote: "Wait a minute, wait a minute. You ain't heard nothin' yet!", right: "THE JAZZ SINGER"})
    q72 = new Movie.Models.Game({quote: "No wire hangers, ever!", right: "MOMMIE DEAREST"})
    q73 = new Movie.Models.Game({quote: "Mother of mercy, is this the end of Rico?", right: "LITTLE CAESAR"})
    q74 = new Movie.Models.Game({quote: "Forget it, Jake, it's Chinatown.", right: "CHINATOWN"})
    q75 = new Movie.Models.Game({quote: "I have always depended on the kindness of strangers.", right: "A STREETCAR NAMED DESIRE"})
    q76 = new Movie.Models.Game({quote: "Hasta la vista, baby.", right: "TERMINATOR 2: JUDGMENT DAY"})
    q77 = new Movie.Models.Game({quote: "Soylent Green is people!", right: "SOYLENT GREEN"})
    q78 = new Movie.Models.Game({quote: "Open the pod bay doors, HAL.", right: "A SPACE ODYSSEY"})
    q79 = new Movie.Models.Game({quote: "Striker: Surely you can't be serious. Rumack: I am serious...and don't call me Shirley.", right: "AIRPLANE!"})
    q80 = new Movie.Models.Game({quote: "Yo, Adrian!", right: "ROCKY"})
    q81 = new Movie.Models.Game({quote: "Hello, gorgeous.", right: "FUNNY GIRL"})
    q82 = new Movie.Models.Game({quote: "Toga! Toga!", right: "LAMPOON'S ANIMAL HOUSE"})
    q83 = new Movie.Models.Game({quote: "Listen to them. Children of the night. What music they make.", right: "DRACULA"})
    q84 = new Movie.Models.Game({quote: "Oh, no, it wasn't the airplanes. It was Beauty killed the Beast.", right: "KING KONG"})
    q85 = new Movie.Models.Game({quote: "My precious.", right: "THE LORD OF THE RINGS: TWO TOWERS"})
    q86 = new Movie.Models.Game({quote: "Attica! Attica!", right: "DOG DAY AFTERNOON"})
    q87 = new Movie.Models.Game({quote: "Sawyer, you're going out a youngster, but you've got to come back a star!", right: "42ND STREET"})
    q88 = new Movie.Models.Game({quote: "Listen to me, mister. You're my knight in shining armor. Don't you forget it. You're going to get back on that horse, and I'm going to be right behind you, holding on tight, and away we're gonna go, go, go!", right: "ON GOLDEN POND"})
    q89 = new Movie.Models.Game({quote: "Tell 'em to go out there with all they got and win just one for the Gipper.", right: "KNUTE ROCKNE ALL AMERICAN"})
    q90 = new Movie.Models.Game({quote: "A martini. Shaken, not stirred.", right: "GOLDFINGER"})
    q91 = new Movie.Models.Game({quote: "Who's on first.", right: "THE NAUGHTY NINETIES"})
    q92 = new Movie.Models.Game({quote: "Cinderella story. Outta nowhere. A former greenskeeper, now, about to become the Masters champion. It looks like a mirac...It's in the hole! It's in the hole! It's in the hole!", right: "CADDYSHACK"})
    q93 = new Movie.Models.Game({quote: "Life is a banquet, and most poor suckers are starving to death!", right: "AUNTIE MAME"})
    q94 = new Movie.Models.Game({quote: "I feel the need - the need for speed!", right: "TOP GUN"})
    q95 = new Movie.Models.Game({quote: "Carpe diem. Seize the day, boys. Make your lives extraordinary.", right: "DEAD POETS SOCIETY"})
    q96 = new Movie.Models.Game({quote: "Snap out of it!", right: "MOONSTRUCK"})
    q97 = new Movie.Models.Game({quote: "My mother thanks you. My father thanks you. My sister thanks you. And I thank you.", right: "YANKEE DOODLE DANDY"})
    q98 = new Movie.Models.Game({quote: "Nobody puts Baby in a corner.", right: "DIRTY DANCING"})
    q99 = new Movie.Models.Game({quote: "I'll get you, my pretty, and your little dog, too!", right: "WIZARD OF OZ, THE"})
    q100 = new Movie.Models.Game({quote: "I'm the king of the world!", right: "TITANIC"})

    list = [q1,q2,q3,q4,q5,q6,q7,q8,q9,q10,q11,q12,q13,q14,q15,q16,q17,q18,q19,q20,q21,q22,q23,q24,q25,q26,q27,q28,q29,q30,q31,q32,q33,q34,q35,q36,q37,q38,q39,q40,q41,q42,q43,q44,q45,q46,q47,q48,q49,q50,q51,q52,q53,q54,q55,q56,q57,q58,q59,q60,q61,q62,q63,q64,q65,q66,q67,q68,q69,q70,q71,q72,q73,q74,q75,q76,q77,q78,q79,q80,q81,q82,q83,q84,q85,q86,q87,q88,q89,q90,q91,q92,q93,q94,q95,q96,q97,q98,q99,q100]
    _.each list, (quote)=>
      @add(quote)



  

