class_name CharacterLogic

var permTraits = []
var tempTraits = []
var reputation = 0

func _init(permanentTraits, temporaryTraits):
	permTraits = permanentTraits
	temporaryTraits = tempTraits
	
func reactToJoke(joke):
	var reaction = Jokes.getDefaultReaction(joke)
	for i in permTraits:
		var temp = i.reactToJoke(joke, reputation)
		reaction[0] *= temp[0]
		reaction[1] *= temp[1]
	for i in tempTraits:
		var temp = i.reactToJoke(joke, reputation)
		reaction[0] *= temp[0]
		reaction[1] *= temp[1]
	return reaction
	
	
