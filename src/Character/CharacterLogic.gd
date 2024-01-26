class_name CharacterLogic

var permTraits = []
var tempTraits = []
var reputation = 0
var repeatedJoke = {}

func _init(permanentTraits, temporaryTraits):
	var tempJokes = Jokes.JokeTypes.keys()
	for joke in tempJokes:
		repeatedJoke[Jokes.JokeTypes[joke]] = 0
	permTraits = permanentTraits
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
	
	print(reaction)
	print(getRepetition(joke))
	print(normalizedReputation())
	var rep = reaction[0] - (reaction[1] * getRepetition(joke) / normalizedReputation())
	reputation += rep
	print(reputation)
	if reaction[0] > 0:
		var reward = randf() * 17 + 7 + Jokes.getPrice(joke) * 0.2
		#ADD TO TOTAL REP
		reaction[0] * reward
	else:
		#ADD TO TOTAL REP
		0
	
	
	changeRepetition(joke, 1)
	return reaction
	
func normalizedReputation():
	if reputation <= 0:
		return 0.1 + pow(cos(reputation * PI / 200), 3) * 0.9
	else:
		return reputation / 10
		
func changeRepetition(joke, change):
	repeatedJoke[joke] += change
	if repeatedJoke[joke] > 5:
		repeatedJoke[joke] = 5
	elif repeatedJoke[joke] < 0:
		repeatedJoke[joke] = 0
		
func getRepetition(joke):
	return pow(repeatedJoke[joke], 5) / 625 + 1
	
	
