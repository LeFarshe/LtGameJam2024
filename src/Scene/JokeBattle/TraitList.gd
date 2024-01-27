extends Control

@onready var nameLabel = $Name
@onready var traitControl = $Traits
@onready var newTheme = preload("res://DefaultTheme.tres")
const labelY = 20
var traits = 0

func loadCharacter(character):
	for i in traitControl.get_children():
		i.queue_free()
	traits = 0
	nameLabel.text = character.name
	for i in character.getTraits():
		addTrait(i)
	for i in character.tempTraits:
		addTrait(i.getName())
	
func addTrait(name):
	var newLabel = Label.new()
	newLabel.theme = newTheme
	newLabel.add_theme_font_size_override("font_size", 20)
	newLabel.add_theme_color_override("font_color", Color.BLACK)
	traitControl.add_child(newLabel)
	newLabel.text = name
	newLabel.set_position(Vector2(0, labelY * traits))
	
	traits += 1

