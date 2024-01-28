extends Control

@onready var traitList = $TraitList
@onready var jokeSelector = $JokeSelector

const runRepLoss = 3

var currentCharacter
var totalCharacters
var totalInteractions
var interactionCount

var oldRepWithChar

@onready var character_sprite = $CharacterSprite

func _ready():
	currentCharacter = 0
	interactionCount = 0
	totalCharacters = GameLogic.characterAmount
	totalInteractions = GameLogic.charsPerDay
	traitList.loadCharacter(GameLogic.characters[currentCharacter])
	drawCharacter()

func drawCharacter():
	var currentChar = GameLogic.characters[currentCharacter]
	oldRepWithChar = currentChar.reputation
	character_sprite.setSprite(currentChar.charSeed, currentChar.isMale)
	if len(currentChar.tempTraits) > 0:
		character_sprite.setMood(currentChar.tempTraits[0].name)
	else:
		character_sprite.setMood(null)

func end():
	GameLogic.nextDay()
	
func tellJoke(joke):
	$NoteFlipSound.play(0.1)
	var char = GameLogic.characters[currentCharacter]
	char.reactToJoke(joke)
	var reaction = char.reputation - oldRepWithChar
	if reaction < -0.1:
		character_sprite.setMood("Irritated")
	elif reaction > 0.1:
		character_sprite.setMood("Happy")
	GameLogic.player.heldJokes[joke] -= 1
	nextCharacter()
	
func nextCharacter():
	interactionCount += 1
	$JokeSelector.visible = false
	jokeSelector.loadJokes()
	$CharSwitchTimer.start(0.4)
	
func runFromCharacter():
	GameLogic.characters[currentCharacter].changeReputation(-runRepLoss)
	character_sprite.setMood("Irritated")
	nextCharacter()

func _on_run_button_pressed():
	runFromCharacter()

func _on_char_switch_timer_timeout():
	$JokeSelector.visible = true
	currentCharacter += 1
	if currentCharacter >= totalCharacters or interactionCount >= totalInteractions:
		end()
	else:
		traitList.loadCharacter(GameLogic.characters[currentCharacter])
		drawCharacter()
