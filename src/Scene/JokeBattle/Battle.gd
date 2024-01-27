extends Control

const runRepLoss = 3

var currentCharacter
var totalCharacters
var totalInteractions
var interactionCount

func _ready():
	currentCharacter = 0
	interactionCount = 0
	totalCharacters = 10
	totalInteractions = GameLogic.charsPerDay
	
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
	
func runFromCharacter():
	GameLogic.characters[currentCharacter].changeReputation(-runRepLoss)
	nextCharacter()


func _on_run_button_pressed():
	runFromCharacter()
