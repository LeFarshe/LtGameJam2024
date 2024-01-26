extends Node2D

var characters = []

var permTraits = [[DifferentDepartment, 0.1], [Psychopath, 0.05]]
var permWeights = 0

var tempTraits = []
var tempWeights = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in permTraits:
		permWeights += i[1]
	for i in tempTraits:
		tempWeights += i[1]
		
	for i in range(5):
		characters.append(createCharacter([], 1, [], 0))
	for i in characters:
		print(i.permTraits[0].getName())

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func createCharacter(startPermanentTraits, extraPermAmount, startTemporaryTraits, extraTempAmount):
	return Character.new(startPermanentTraits + generateTraits(extraPermAmount, permTraits, permWeights),
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
					generatedTraits.append(checkedTrait[0].new())
					currentWeight -= checkedTrait[1]
					break
		
	return generatedTraits
