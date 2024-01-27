class_name Player

var spendableReputation = 0
var earnedReputation = 0
var heldJokes = {}

func resetPlayer():
	spendableReputation = 0
	earnedReputation = 0
	for i in Jokes.JokeTypes.keys():
		heldJokes[Jokes.JokeTypes[i]] = 0
	heldJokes[Jokes.JokeTypes.PUN] = 2
		
func changeRep(rep):
	spendableReputation += rep
	earnedReputation += rep
	
func spendRep(rep):
	spendableReputation -= rep

func canBuy(joke):
	if spendableReputation >= Jokes.getPrice(joke):
		return true
	return false

func buyJoke(joke):
	spendableReputation -= Jokes.getPrice(joke)
	heldJokes[joke] += 1

func sellJoke(joke):
	spendableReputation += Jokes.getPrice(joke)
	heldJokes[joke] -= 1
	
func getJokeCount(joke):
	return heldJokes[joke]
