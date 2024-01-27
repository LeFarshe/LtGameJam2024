extends Control

const runRepLoss = 3

var currentCharacter
var totalCharacters
var totalInteractions
var interactionCount

@onready var character_sprite = $CharacterSprite

func _ready():
	currentCharacter = 0
	interactionCount = 0
	totalCharacters = 10
	totalInteractions = GameLogic.charsPerDay
	drawCharacter()

func drawCharacter():
	var currentChar = GameLogic.characters[currentCharacter]
	character_sprite.setSprite(currentChar.charSeed, currentChar.isMale)

func end():
	GameLogic.nextDay()
	
func tellJoke(joke):
	GameLogic.characters[currentCharacter].reactToJoke(joke)
	interactionCount += 1
	if interactionCount >= totalInteractions:
		end()
	else:
		nextCharacter()
	
func nextCharacter():
	currentCharacter += 1
	if currentCharacter >= totalCharacters:
		end()
	drawCharacter()
	
func runFromCharacter():
	GameLogic.characters[currentCharacter].changeReputation(-runRepLoss)
	nextCharacter()


func _on_run_button_pressed():
	runFromCharacter()
