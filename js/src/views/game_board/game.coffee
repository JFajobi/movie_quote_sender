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
    q20 = new Movie.Models.Game({quote:"Today, I consider myself the luckiest man on the face of the earth.", right:"THE PRIDE OF THE YANKEES"})

    list = [q1,q2,q3,q4,q5,q6,q7,q8,q9,q10,q11,q12,q13,q14,q15,q16,q17,q18,q19,q20,q21,q22,q23,q24,q25,q26,q27,q28,q29,q30,q31,q32,q33,q34,q35,q36,q37,q38]
    _.each list, (quote)=>
      @add(quote)



  

