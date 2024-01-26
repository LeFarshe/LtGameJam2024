class_name TraitFactory

enum Traits {DIFFERENTDEPARTMENT, KINDMEAN, INTDUMB, CHILDISH, CRINGE, ZOOMER, BOOMER, LIKES, PSYCHOPATH,
 IRRITATED, TIRED, HAPPY, SAD}

static func traitFactory(newTrait):
	match newTrait:
		Traits.DIFFERENTDEPARTMENT:
			return createDifferentDepartment()
		Traits.KINDMEAN:
			if randf() <= 0.5:
				return Trait.new("Mean", {Jokes.JokeTypes.SLAPSTICK: [1.5,1], Jokes.JokeTypes.SELFDEPRECATING: [1.5,1]}, [1,1.5], 0.5)
			else:
				return Trait.new("Kind", {Jokes.JokeTypes.SLAPSTICK: [0.5,1.5], Jokes.JokeTypes.SELFDEPRECATING: [0.5,1.2]}, [1.2,1], 0.5)
		Traits.INTDUMB:
			if randf() <= 7.0/17.0:
				return Trait.new("Intelligent", {Jokes.JokeTypes.SURREAL: [2,1], Jokes.JokeTypes.PUN: [1.5,1]}, [1,1], 0.5)
			else:
				return Trait.new("Dumb", {Jokes.JokeTypes.SURREAL: [0,1], Jokes.JokeTypes.PUN: [1.5,1], Jokes.JokeTypes.BAD: [1.2,1]}, [1,1], 0.2)
		Traits.CHILDISH:
			return Trait.new("Childish", {Jokes.JokeTypes.PUN: [1.5,1], Jokes.JokeTypes.DARK: [0.5,1]}, [1,1], 0.3)
		Traits.CRINGE:
			return Trait.new("Cringe", {Jokes.JokeTypes.BAD: [2,0.5], Jokes.JokeTypes.PUN: [1.2,0.5], Jokes.JokeTypes.SARCASM: [0.2,1], Jokes.JokeTypes.SURREAL: [0,1]}, [1,1], 0.1)
		Traits.ZOOMER:
			return Trait.new("Zoomer", {Jokes.JokeTypes.SURREAL: [1.5,1], Jokes.JokeTypes.SARCASM: [1.5,1]}, [1,1], 0.7)
		Traits.BOOMER:
			return Trait.new("Boomer", {Jokes.JokeTypes.OBSERVATIONAL: [1.5,1]}, [1,1], 0.7)
		Traits.LIKES:
			var joke = getJoke()
			var rand = randf()
			if rand <= 6.0/13.0:
				return Trait.new("Likes " + Jokes.getName(joke), {joke:[1.2,0.5]}, [1,1], 0.5)
			elif rand <= 7.0/13.0:
				return Trait.new("Only likes " + Jokes.getName(joke), {joke:[1.5,0.1]}, [0.5,1], 0.8)
			else:
				return Trait.new("Dislikes " + Jokes.getName(joke), {joke:[0.5,1.2]}, [1,1], 0.5)
		Traits.PSYCHOPATH:
			return Trait.new("Psychopath", {Jokes.JokeTypes.SLAPSTICK: [1.5,1], Jokes.JokeTypes.BAD: [1.5,1], Jokes.JokeTypes.DARK: [1.5,0.7]}, [1,1], 0.2)
		
		
		Traits.IRRITATED:
			return Trait.new("Irritated", {}, [0.2,0.5], 1)
		Traits.TIRED:
			return Trait.new("Tired", {}, [0.5,0.5], 1)
		Traits.HAPPY:
			return Trait.new("Happy", {}, [1.2,1], 1)
		Traits.SAD:
			return Trait.new("Sad", {}, [0.2,0.2], 1)

		


static func createDifferentDepartment():
	var potentialNames = ["HR", "Management", "Janitor", "Accountant", "Resident homeless person"]
	var name = potentialNames[randi() % potentialNames.size()]
	return Trait.new(name, {Jokes.JokeTypes.OBSERVATIONAL: [0.5,0.5]}, [1,1], 1)

static func getJoke():
	return Jokes.JokeTypes[Jokes.JokeTypes.keys()[randi()%Jokes.JokeTypes.size()]]
