extends Control

@onready var nameLabel = $Name
@onready var traitControl = $Traits
@onready var newTheme = preload("res://DefaultTheme.tres")
@onready var quotaLabel = $Quota
const labelY = 20
var traits = 0

const rotateMin = -3
const rotateMax = 3

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

