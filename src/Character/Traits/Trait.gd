class_name Trait

var name = ""

var reactions = {}
var others = []
var revealChance = 0

func _init(newName, newReactions, newOthers, newRevealChance):
	name = newName
	reactions = newReactions
	others = newOthers
	revealChance = newRevealChance

func reactToJoke(joke):
	for i in reactions:
		if i == joke:
			return reactions[i]
	return others
	
func getName():
	return name
	
func reveal(joke):
	for i in reactions:
		if i == joke:
			if randf() <= revealChance:
				return true
	return false
