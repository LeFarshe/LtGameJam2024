extends Node2D

var characters = []

var permTraits = [[TraitFactory.Traits.DIFFERENTDEPARTMENT, 6],
 [TraitFactory.Traits.KINDMEAN, 20], [TraitFactory.Traits.INTDUMB, 17],
 [TraitFactory.Traits.CHILDISH, 10], [TraitFactory.Traits.CRINGE, 4],
 [TraitFactory.Traits.ZOOMER, 8], [TraitFactory.Traits.BOOMER, 10],
 [TraitFactory.Traits.LIKES, 13], [TraitFactory.Traits.PSYCHOPATH, 1]]
var permWeights = 0

var tempTraits = [[TraitFactory.Traits.IRRITATED, 1],
 [TraitFactory.Traits.TIRED, 1], [TraitFactory.Traits.HAPPY, 1],
 [TraitFactory.Traits.SAD, 1]]
var tempWeights = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in permTraits:
		permWeights += i[1]
	for i in tempTraits:
		tempWeights += i[1]
		
	var char = createCharacter([], 3, [], 1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func createCharacter(startPermanentTraits, extraPermAmount, startTemporaryTraits, extraTempAmount):
	return CharacterLogic.new(startPermanentTraits + generateTraits(extraPermAmount, permTraits, permWeights),
	 startTemporaryTraits + generateTraits(extraTempAmount, tempTraits, tempWeights))
	
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
					generatedTraits.append(TraitFactory.traitFactory(checkedTrait[0]))
					currentWeight -= checkedTrait[1]
					break
		
	return generatedTraits
