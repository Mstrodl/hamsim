Hi # Character
+ [Hello]
Hello!
-> interests_leadin
+ [Pickup Line]
Hey babe, are you ham? Because you're ham..
Haha! Yeah! # Character
Hammy thought that was funny # Note
-> interests_leadin
+ [Roblox?]
Hey wanna play Roblox?
"...Are you like 12?" # Character
You were blocked # Note
-> END

===interests_leadin===
So what sort of stuff do you like to do? # Character
-> interests

VAR is_gaming = false
VAR occupation = ""

VAR food = ""
===about_that_macaroni===
~ food = "macaroni"
Wow, that looks
+ [Lie]
...Great! I'm excited to try it!
-> directions
+ [Be honest]
Honestly that's kind of the most disgusting macaroni I've ever seen
I... # Character
I'm sorry I can't please you # Character
You were blocked # Note
-> END

VAR annoyance_count = 0
===directions===
{Anyways, how exactly do I get to your place?|Okay, and then what?}
+ [Go left]
{So you'll want to take a left|Then a left}
+ [Go right]
{Head right|Then go right}
+ [Go straight]
{Keep going forward|Now go forwards}

- { annoyance_count > 30:
-> dinner_date_arrival
- else:
~ annoyance_count = annoyance_count + 1
-> directions
}

===dinner_date_arrival===
I think I might be in the wrong place, this is an office building # Character
Nope, that's right!
...Huh? # Character
Come in! I'm in room 143, by the copy machine
...Alright then # Character
A few minutes pass # Note
Is... Is this some kind of joke? # Character
No, why would you think that?
Room 143 is a closet that says "Maintenence" # Character
Yeah? What about it? Come in!
Oh my god. # Character
{food == "macaroni":
Hammy sets down the macaroni on an overturned 5 gallon bucket with a checkerboard tablecloth draped over it. It takes all your willpower to avoid gagging. # Note
You only eat about half of the admittedly very small amount you took before excusing yourself and vomitting into the very bucket you had been using as a table. # Note
Hammy leaves in disgust, you die a short time later of food poisoning. The end. # Note
-> END
- else:
In the end, you got your date, although the hum of the boiler put a bit of a damper  on the evening. You agreed it probably wouldn't work out. The end. # Note
-> END
}




===mac_and_cheese===
Macaroni and cheese it is then!
A few hours pass # Note
I'm just about ready to head over to your place! # Character
Macaroni looks yummy! # Images:mac_and_cheese # Character
-> about_that_macaroni

===boiled_human===
Boiled human it is then! # Character
I hear it tastes just like chicken
-> directions

===cooking===
Any ideas on what I should make? # Character
+ [Mac N' Cheese]
How about macaroni and cheese?
-> mac_and_cheese
+ [Human]
How about a boiled human? -> boiled_human
+ [Whatever you want]
{RANDOM(0,1):
- 0: -> mac_and_cheese
- 1: -> boiled_human
}

VAR janitor = false
===interests===
* [Gaming]
~ is_gaming = true
I like to play video games in my basement!
Oh, is that all? # Character
Yeah, I like playing Hamus in Super Meatroid
-> interests
+ [Hot tub?]
~ occupation = "hot tub"
Oh you know... I like hanging out in the hot tub haha # Image:crockpot
I like your hammy flakes... # Character
Hey you should come over, we can make ham sandwiches... ;)
Sounds like a plan, I'll get some Mayonaise # Character
This is gross. But I guess you found an ending. Please excuse me while I vomit up some space-time. The end. # Note
-> END
+ [Stalking!]
I stalk people!
-> stalking
+ [Cleaning]
I'm a janitor!
Oh that's cool I guess # Character
Hey want to come have dinner with me tonight?
Sure, I can make us dinner, I'm a pretty good cook if I do say so myself! # Character
~ janitor = true
-> cooking
+ [Towels!]
You're a towel!
-> towel_loop
+ [LARP!]
I like LARPing!
Woah, that's cool! Me too! # Character
What sort of stuff specifically do you like? # Character
-> larp_start
+ [Music]
I'm a musician!
Impressive! I love music! # Character
You should come see me perform with my group sometime!
I'd love to! Sounds like fun! # Character
-> music

===music===
+ I play the Saxophone
You bring Hammy to your jazz club, the tilted pork, and show Hammy to their seat. # Note
Hammy seems impressed, and for once you feel like you might have found the one. The end. # Note
-> END
+ I play the Drums
You bring Hammy to your drum circle, wearing your finest tie-dye and yet they don't seem impressed. The evening ends in failure. The end. # Note
-> END


===larp_start===
+ [Blacksmithing]
~ occupation = "blacksmith"
I'm a blacksmith in my spare time!
Wow! # Character
-> blacksmith
+ [Wizard]
I'm a wizard!
-> wizard
+ [Fighter]
I'm a fighter!
Neat! I'm a Wizard! # Character
-> larp_ask

===wizard===
Woah, me too! # Character
What level are you? # Character
+ [Level 10]
I'm level 10
Wow, I'm level 8 -> larp_ask # Character
+ [Level 6]
I'm level 6
I'm level 8,  I've just learned real magic # Character
-> real_magic

===real_magic===
Would you like me to teach you? # Character
+ [Yes]
Sure, that sounds like fun!
Heck yeah it is! # Character
-> learn_magic
+ [No]
Uhh, no thanks
Oh, that's too bad... # Character
Hey, you should come with me to the park tonight # Character
Like a date?
Something like that ;) # Character
-> cult_sacrifice

===learn_magic===
Come with me to the park tonight, I'm going to show you something that will change your life! # Character
True power, it's an incredible feeling! # Character
Uhh sure!
You go to the park as Hammy directed and... it seems you can't remember anything else. # Note
...The evening is still a success though... Whatever that means anyways # Note
The end # Note
-> END

===cult_sacrifice===
You meet Hammy in the park, although something seems off... # Note
Hammy is dressed in black, and they lead you to the middle of a circle of about 30 others clad similarly in black robes. # Note
...They begin to chant and encircle you # Note
You turn to run, but seem held in place # Note
A voice from above rings out: # Note
"Who DARES disturb my rest?" # Kinetic
The people surrounding you cry out in unision, "The West Hamel Witch Coven commands you, Hamthulhu, to arise from your shackles, and wreak havoc on this pitiful world!" # Note
The ground beneath you begins to shake, and open, although you do not fall in. You seem instead to hover. # Note
Your eyes look down beneath you and you can see an enormous glazed ham with massive tentacles reach up and grab you. Unexpectedly, you appear to no longer be frozen in place, as the beast can very easily manipulate you. # Note
You begin to feel yourself burning up, as a bright light is emitted from the suction cups of the tentacle. As the light touches your skin, you can feel it burn away. # Note
... # Note
And just like that, your life fades away to a close. Perhaps in some cruel kind of mercy, you were spared from the endless suffering that would soon be endured by the other inhabitants of your plane... Whatever that means. # Note
Either way, this is a dating simulator, and although I may be an omniscient narrator, there are some things that are better unsaid. # Note
Good night, Hamuel. # Note
The end. # Note
-> END


===towel_loop===
No you're a towel! # Character
+ No you're a towel!
-> towel_loop

===stalking===
What?! Were you stalking me? # Character
+ Yes?
// FBI death
That's creepy what the heck? # Character
I was j-
You were reported to the authorities who promptly detained you. The end. # Note
-> END
+ Yes!
You're weird... I like that # Character
We should hang out sometime and do weird stuff in the park... # Character
-> cult_sacrifice

===blacksmith===
So what sort of stuff do you make? # Character
+ [Swords]
I make super awesome swords!
Cool! # Character
-> larp_ask
+ [Knives]
I make cool knives!
Woah! # Character
-> larp_ask
+ [Armor]
I make plate armor!
Wow! # Character
-> larp_ask

===larp_ask===
Hey, want to come with me to LARP camp? # Character
+ [Yes]
Sure! Sounds like fun!
So it's a date! ;) # Character
-> END

+ [No]
No thanks
Oh, that's too bad # Character
In the end, you didn't talk much after this, Hammy loves LARP, and your disinterest was kind of rude. The end. # Note
-> END