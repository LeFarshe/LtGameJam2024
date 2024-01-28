class_name CharacterFactory

var permTraits = [[TraitFactory.Traits.DIFFERENTDEPARTMENT, 3],
 [TraitFactory.Traits.KINDMEAN, 10], [TraitFactory.Traits.INTDUMB, 8],
 [TraitFactory.Traits.CHILDISH, 5], [TraitFactory.Traits.CRINGE, 2],
 [TraitFactory.Traits.ZOOMER, 4], [TraitFactory.Traits.BOOMER, 5],
 [TraitFactory.Traits.LIKES, 13], [TraitFactory.Traits.PSYCHOPATH, 1]]
var permWeights = 0

var tempTraits = [[TraitFactory.Traits.IRRITATED, 1],
 [TraitFactory.Traits.TIRED, 1], [TraitFactory.Traits.HAPPY, 1],
 [TraitFactory.Traits.SAD, 1]]
var tempWeights = 0

func _init():
	for i in permTraits:
		permWeights += i[1]
	for i in tempTraits:
		tempWeights += i[1]

func createCharacter(startPermanentTraits, extraPermAmount, startTemporaryTraits, extraTempAmount):
	var ans = CharacterLogic.new(startPermanentTraits + generateTraits(extraPermAmount, permTraits, permWeights),
	 startTemporaryTraits + generateTraits(extraTempAmount, tempTraits, tempWeights))
	if ans.name == "Todd Howard":
		ans.permTraits.insert(0, TraitFactory.sweetLittleTrait())
		ans.revealedTraits.insert(0, true)
	return ans
	
func generateTraits(amount, traitList, weights):
	var currentWeight = weights
	var generatedTraits = []
	var gottenTraits = []
	
	
	for i in range(amount):
		var generatedWeight = randf() * currentWeight
		
		for checkedTrait in traitList:
			if checkedTrait[0] not in gottenTraits:
				generatedWeight -= checkedTrait[1]
				if generatedWeight <= 0:
					gottenTraits.append(checkedTrait[0])
					generatedTraits.append(TraitFactory.getTrait(checkedTrait[0]))
					currentWeight -= checkedTrait[1]
					break
		
	return generatedTraits
	
func generateMood(amount):
	return generateTraits(amount, tempTraits, tempWeights)
