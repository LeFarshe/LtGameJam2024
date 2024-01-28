extends Control

@onready var nameLabel = $Name
@onready var traitControl = $Traits
@onready var newTheme = preload("res://DefaultTheme.tres")
@onready var quotaLabel = $Quota
@onready var reputationLabel = $Reputation
const labelY = 20
var traits = 0

const rotateMin = -3
const rotateMax = 3

const repRange1 = 10
const repRange2 = 50
const repRange3 = 80

const pos1 = ["Wished me a good day", "Shared gum", 'Fist bump', "Smiles at me"]
const pos2 = ["Gave me a gym membership", "Remembers my full name", "We're friends"]
const pos3 = ["Is in my walls", "Stands outside my house at night", "Everywhere I go, I see their face", "Remembers my address"]
const neg1 = ["Eyerolls a lot", "Doesn't like talking to me", "Ignores me"]
const neg2 = ["Avoids me", "Gets aggressive", "Didn't wish me a happy birthday"]
const neg3 = ["Hired an assassin to kill me", "Stabbed me at least three times", "Unfriended me on FaceBook", "Multiple restraining orders"]

func loadCharacter(character):
	for i in traitControl.get_children():
		i.queue_free()
	traits = 0
	nameLabel.text = character.name
	nameLabel.rotation = getRotation()
	for i in character.getTraits():
		addTrait(i)
	for i in character.tempTraits:
		addTrait(i.getName())
	loadQuota()
	loadReputation(character)
	
func getRotation():
	return deg_to_rad(randf() * (rotateMax - rotateMin) + rotateMin)
	
func addTrait(traitName):
	var newLabel = Label.new()
	newLabel.theme = newTheme
	newLabel.add_theme_font_size_override("font_size", 20)
	newLabel.add_theme_color_override("font_color", Color.BLACK)
	newLabel.rotation = getRotation()
	traitControl.add_child(newLabel)
	newLabel.text = "• " + traitName
	newLabel.set_position(Vector2(0, labelY * traits))
	
	traits += 1
	
func loadQuota():
	quotaLabel.text = str(floor(GameLogic.player.earnedReputation)) + "/" + str(GameLogic.quota)
	quotaLabel.rotation = getRotation()

func setRepText(responses):
	reputationLabel.text = responses[randi() % responses.size()]

func loadReputation(character):
	reputationLabel.rotation = getRotation()
	var rep = character.reputation
	if rep < 0:
		reputationLabel.add_theme_color_override("font_color", Color("580000"))
	else:
		reputationLabel.add_theme_color_override("font_color", Color("009700"))
	
	if abs(rep) < repRange1:
		reputationLabel.text = "test"
	elif abs(rep) < repRange2:
		if rep < 0:
			setRepText(neg1)
		else:
			setRepText(pos1)
	elif abs(rep) < repRange3:
		if rep < 0:
			setRepText(neg2)
		else:
			setRepText(pos2)
	else:
		if rep < 0:
			setRepText(neg3)
		else:
			setRepText(pos3)
			
