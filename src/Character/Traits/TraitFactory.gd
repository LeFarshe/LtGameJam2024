class_name TraitFactory

enum Traits {DIFFERENTDEPARTMENT, KINDMEAN, INTDUMB, CHILDISH, CRINGE, ZOOMER, BOOMER, LIKES, PSYCHOPATH,
 IRRITATED, TIRED, HAPPY, SAD}

static func getTrait(newTrait):
	match newTrait:
		Traits.DIFFERENTDEPARTMENT:
			return createTrait(["HR", "Management", "Janitor", "Accountant", "Resident homeless person"],
			 {Jokes.JokeTypes.OBSERVATIONAL: [0.5,1], Jokes.JokeTypes.SELFDEPRECATING: [1.5,0.7], Jokes.JokeTypes.BAD: [1.2,0.9], Jokes.JokeTypes.SARCASM: [1.3,0.85]}, [1,1], 1)
		Traits.KINDMEAN:
			if randf() <= 0.5:
				return createTrait(["Mean", "A Bully", "Insulted me once", "Grumpy"],
				 {Jokes.JokeTypes.SLAPSTICK: [1.5,1], Jokes.JokeTypes.SELFDEPRECATING: [1.5,1], Jokes.JokeTypes.DARK: [1.5,0.5]}, [1,1.5], 0.5)
			else:
				return createTrait(["Kind", "A nice person", "Cares a lot", "Ends e-mails with :)", "Good vibes"],
				 {Jokes.JokeTypes.SLAPSTICK: [0.5,1.5], Jokes.JokeTypes.SELFDEPRECATING: [0.5,1.2], Jokes.JokeTypes.PUN: [1.5,0.5]}, [1.2,1], 0.5)
		Traits.INTDUMB:
			if randf() <= 7.0/17.0:
				return createTrait(["Intelligent", "Big Brain", "Uses Big Words", "Reads During Lunch Breaks", "Uses Linux"],
				 {Jokes.JokeTypes.SURREAL: [2,1], Jokes.JokeTypes.PUN: [1.5,1], Jokes.JokeTypes.OBSERVATIONAL: [1.5,0.8]}, [1,1], 0.5)
			else:
				return createTrait(["Dumb", "Not Smart", "Not the sharpest tool in the shed", "Obtuse", "Can't Read"],
				 {Jokes.JokeTypes.SURREAL: [0,0], Jokes.JokeTypes.PUN: [1.5,1], Jokes.JokeTypes.BAD: [1.2,0.4]}, [1,1], 0.5)
		Traits.CHILDISH:
			return createTrait(["Childish", "Has Kids", "Very PG"],
			 {Jokes.JokeTypes.PUN: [1.5,1], Jokes.JokeTypes.DARK: [0.5,1], Jokes.JokeTypes.SLAPSTICK: [1.5,0.8]}, [1,1], 0.4)
		Traits.CRINGE:
			return createTrait(["Cringe", "Unlikable", "God's Mistake", "Can't Read the Room"],
			 {Jokes.JokeTypes.BAD: [2,0.5], Jokes.JokeTypes.PUN: [1.2,0.5], Jokes.JokeTypes.SARCASM: [0.2,1], Jokes.JokeTypes.SURREAL: [0.5,1]}, [1,1], 0.3)
		Traits.ZOOMER:
			return createTrait(["Zoomer", "Likes Skibidi Toilet", "Watches Tik-Tok", "Says \"bussing\" a Lot"],
			 {Jokes.JokeTypes.SURREAL: [1.5,1], Jokes.JokeTypes.SARCASM: [1.5,1], Jokes.JokeTypes.DARK: [1.3,0.75]}, [1,1], 0.7)
		Traits.BOOMER:
			return createTrait(["Boomer", "Almost retired", "Older Than Me", "Still Uses a Flip Phone"],
			{Jokes.JokeTypes.OBSERVATIONAL: [1.5,1], Jokes.JokeTypes.SELFDEPRECATING: [1.8,0.75]}, [1,1], 0.7)
		Traits.LIKES:
			var joke = getJoke()
			var rand = randf()
			var badness = Jokes.getDefaultReaction(joke)[1]
			var badnessOffset = 1
			if badness > 1:
				badnessOffset /= badness
			if rand <= 6.0/13.0:
				return Trait.new("Likes " + Jokes.getName(joke), {joke:[1.2,0.5 * badnessOffset]}, [1,1], 0.8)
			elif rand <= 7.0/13.0:
				return Trait.new("Only likes " + Jokes.getName(joke), {joke:[1.5,0.1 * badnessOffset]}, [0.5,1], 0.8)
			else:
				return Trait.new("Dislikes " + Jokes.getName(joke), {joke:[0.5,1.2]}, [1,1], 0.8)
		Traits.PSYCHOPATH:
			return createTrait(["Psychopath"], {Jokes.JokeTypes.SLAPSTICK: [1.5,1], Jokes.JokeTypes.BAD: [1.5,0.8], Jokes.JokeTypes.DARK: [1.5,0.7]}, [1,1], 0.2)
		
		
		Traits.IRRITATED:
			return Trait.new("Irritated", {}, [0.2,0.5], 1)
		Traits.TIRED:
			return Trait.new("Tired", {}, [0.5,0.5], 1)
		Traits.HAPPY:
			return Trait.new("Happy", {}, [1.2,1], 1)
		Traits.SAD:
			return Trait.new("Sad", {}, [0.2,0.2], 1)

static func sweetLittleTrait():
	return createTrait(["Is in the chess club", "Tells sweet little lies", "Just works", "Is laughing now", "Rereleased Skyrim",
	"Is finally awake"], {}, [1,1], 1)


static func createTrait(potentialNames, reactions, others, reveal):
	var name = potentialNames[randi() % potentialNames.size()]
	return Trait.new(name, reactions, others, reveal)

static func getJoke():
	return Jokes.JokeTypes[Jokes.JokeTypes.keys()[randi()%Jokes.JokeTypes.size()]]
