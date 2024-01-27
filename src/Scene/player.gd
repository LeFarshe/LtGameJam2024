class_name Player

var spendableReputation = 0
var earnedReputation = 0
var heldJokes = {}

func resetPlayer():
	spendableReputation = 0
	earnedReputation = 0
	for i in Jokes.JokeTypes.keys():
		heldJokes[Jokes.JokeTypes[i]] = 0
		
func changeRep(rep):
	spendableReputation += rep
	earnedReputation += rep
	
func spendRep(rep):
	spendableReputation -= rep
