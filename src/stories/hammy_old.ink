"Um, hi!" # Character
+ "Hello!"
  -> name
+ "How are you?"
  -> hru

===name===
"I'm Hammy, what's your name?" # Character

+ Hamuel
"Nice to meet you Hamuel!" # Character
-> starter

===starter===
* "Sorry, I'm sorta new to this Hamfist thing..."
  -> new_here
+ "So what do you like to do?"
  -> interests

===hru===
"I'm well, thank you" # Character
-> name

===new_here===
"Oh! It's okay! I'm sort of new to this thing as well!" # Character
"Basically, you can meet all sorts of new people through the # Character
<> People Hub# Key Item
<>!"
+ [Neat]
"That seems pretty neat lol"
-> starter

VAR occupation = ""
VAR relation = 50

===interests===
I'm a chef! Nothing is more fulfilling than making a beautiful meal! # Character
+ [A cook?]
"So what sort of food do you make?"
"Oh, all sorts of things really!" # Character
"Recently, I've been trying to figure out how to make the perfect boiled human" # Character
-> boiled_human

===boiled_human===
+ [Boiled human?]
"So.. a boiled human? I've not heard of that before"
"Yeah!" # Character
"It's sort of a delicacy, mostly just rich people who eat it" # Character
"To be entirely honest it doesn't even taste that good haha" # Character
"Wow... That's cool"
->after_boiled
+ [Don't question it]
-> your_interests

===after_boiled===
+ [Ask more]
"So what's so hard about boiling a human anyways?"
"I thought boiling stuff was easy, it's like pasta!"
"You'd be surprised!" # Character
~ relation = relation + 2
"Hammy thought that was funny" # Note
"It's kind of all about seasoning and timing... You don't want to overcook it, and every human is different so it's tricky!" # Character
-> more_cooking

+ [Gross..]
"..."
"Hammy thought that was a rude thing to say" # Note
~ relation = relation - 5
-> your_interests

===more_cooking===
+ [Tell me more]
"What other sorts of stuff do you make?"
"I also make a mean Mac n' Cheese!" # Image:mac_and_cheese # Character
->yum

===yum===
+ [Yum]
"Looks tasty!"
"Thanks!" # Character
~ relation = relation + 4
"Hammy appreciated that... What have you gotten yourself into" # Note
-> your_interests
+ [Be nice]
"Ooh"
-> your_interests
+ [Be honest]
"Sorry, is that a joke?"
"N-no..? What's wrong with it?" # Character
"..."
"That's kind of mean... But I guess I appreciate the honesty" # Character
~ relation = relation - 8
"Hammy seems hurt by that" # Note
-> your_interests

===your_interests===
So, how about you? What do you like to do? # Character
+ [Cooking]
  ~ occupation = "cook"
  "I like cooking as well!"
  "Wow, how interesting!" # Character
  -> interests_done
+ [Baker]
  ~ occupation = "baker"
  "I'm a baker!"
  "Maybe you should come around my place at some point and we could make a whole meal!" # Character
  ~ relation += 1
  Hammy likes this idea # Note
  -> interests_done
  Hammy  # Note
+ [Video Games]
  ~ occupation = "gamer"
  "I like to play video games in my basement"
  "I suppose that's one way to spend one's time" # Character
  Hammy didn't like that # Note
  ~ relation -= 2
  -> interests_done

===interests_done===
// I kind of want to leave this in, the idea of communist ham is amazing
+ [Engels?]
"So have you read Engels?"
"Of course, who hasn't?" # Character
"Do you go to the bi-weekly rallies?" # Character
-> rally_selfie


===rally_selfie===
+ "Well, obviously"

"Me too!" # Character
"I got this cool Ushanka from the last one, I wear it practically everywhere haha!" # Character # Image:rally_selfie
-> go_sometime

===go_sometime===
+ "You know, we should go sometime..."
"Yeah! That sounds like it would be fun..!" # Character
"How about the next meeting?" # Character
->a_date

===a_date===
+ [A date..?]
  "It's a date then maybe? Haha"
  {relation >= 54:
    "You know what? Sure, let's call it a date!" #  Character
    -> after_date_journal
    - else:
    "Haha, no. Creep." # Character
    "Don't ever talk to me or my son ever again." # Image:myson # Character
    -> END
  }


===after_date_journal===
+ [Write Journal Entry]
First meeting # JournalEntry:after_rally
->after_date

===after_date===
+ [Reach out]
"Hey, I had a lot of fun last night"
"Oh, haha, me too!" # Character
-> after_date_discuss
+ [Wait a bit]
A few days pass... # Note
"Hi, I wasn't really sure what to say, I'm a little awkward, sorry"
"It's okay, I kinda was having the same issue.."
-> after_date_discuss

===after_date_discuss===
"Hey, what should we talk about?"
+ [Ham]
"I like Ham" -> after_date_discuss
+ [Ham]
"Ham is good" -> after_date_discuss
+ [Ham]
"Wow congrats!" -> END