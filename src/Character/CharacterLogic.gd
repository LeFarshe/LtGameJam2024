class_name CharacterLogic

var permTraits = []
var revealedTraits = []
var tempTraits = []
var reputation = 0
var repeatedJoke = {}

func _init(permanentTraits, temporaryTraits):
	var tempJokes = Jokes.JokeTypes.keys()
	for joke in tempJokes:
		repeatedJoke[Jokes.JokeTypes[joke]] = 0
	permTraits = permanentTraits
	for i in permTraits:
		revealedTraits.append(false)
	tempTraits = temporaryTraits
	
func reactToJoke(joke):
	var reaction = Jokes.getDefaultReaction(joke)
	for i in permTraits:
		var temp = i.reactToJoke(joke)
		reaction[0] *= temp[0]
		reaction[1] *= temp[1]
	for i in tempTraits:
		var temp = i.reactToJoke(joke)
		reaction[0] *= temp[0]
		reaction[1] *= temp[1]
	
	
	calculateRep(joke, reaction)
	revealTrait(joke)
	changeRepetition(joke, 1)
	return reaction
	
func calculateRep(joke, reaction):
	var rep = reaction[0] - (reaction[1] * getRepetition(joke) / normalizedReputation())
	reputation += rep
	if reaction[0] > 0:
		var reward = randf() * 17 + 7 + Jokes.getPrice(joke) * 0.2
		#ADD TO TOTAL REP
		reaction[0] * reward
	else:
		#ADD TO TOTAL REP
		0

func changeReputation(change):
	reputation = clamp(reputation + change, -100, 100)

func normalizedReputation():
	if reputation <= 0:
		return 0.1 + pow(cos(reputation * PI / 200), 3) * 0.9
	else:
		return reputation / 10
		
func changeRepetition(joke, change):
	repeatedJoke[joke] = clamp(repeatedJoke[joke] + change, 0, 5)
		
func getRepetition(joke):
	return pow(repeatedJoke[joke], 5) / 625 + 1
	
func revealTrait(joke):
	for i in range(len(permTraits)):
		if not revealedTraits[i]:
			if permTraits[i].reveal(joke):
				revealedTraits[i] = true
				return permTraits[i]
	return null

func getTraits():
	var ans = []
	for i in range(len(permTraits)):
		if revealedTraits[i]:
			ans.append(permTraits[i].getName())
		else:
			ans.append("???")
	return ans

	
	
