extends Node

var earningMultiplier = 1
const earningInflation = 1.03

const startQuota = 214
const quotaInflation = 1.5
const startRep = 1100
var quota = 0

const charsPerDay = 6
const characterAmount = 10
const traitMin = 3
const traitMax = 5
const moodChance = 0.25
var characters = []
var characterFactory = CharacterFactory.new()
const newCharMin = 1
const newCharMax = 3

var player = Player.new()

var week = 1
var day = 1

func _ready():
	pass

func resetGame():
	earningMultiplier = 1
	day = 1
	week = 1
	quota = startQuota
	player.resetPlayer()
	player.spendRep(-startRep)
	characters = []
	
	for i in range(characterAmount):
		characters.append(createCharacter())
	resetMoods()
	
func createCharacter():
	var traitAmount = randi() % (traitMax - traitMin + 1) + traitMin
	return characterFactory.createCharacter([], traitAmount, [], 0)
	
func resetMoods():
	for i in characters:
		var mood = []
		if randf() <= moodChance:
			mood = characterFactory.generateMood(1)
		i.resetMood(mood)
		
func nextDay():
	day += 1
	earningMultiplier *= earningInflation
	var ended = false
	if day == 6:
		day = 1
		ended = nextWeek()
	if not ended:
		characters.shuffle()
		resetMoods()
		get_tree().change_scene_to_file("res://Scene/JokeSelection/RepStore.tscn")
	
func nextWeek():
	if player.earnedReputation < quota:
		endGame()
		return true
	else:
		week += 1
		player.earnedReputation = 0
		quota = ceil(quota * quotaInflation)
		for i in characters:
			i.nextWeek()
		newWeekCharacters()
		return false
		
func newWeekCharacters():
	var newCharAmount = randi() % (newCharMax - newCharMin + 1) + newCharMin
	characters.shuffle()
	for i in range(newCharAmount):
		characters[i] = createCharacter()
	
func endGame():
	get_tree().change_scene_to_file("res://Scene/menu_page.tscn")
	
func changePlayerRep(rep):
	player.changeRep(rep)
	
func getHeldJokes():
	return player.heldJokes
	
func canBuy(joke):
	if player.spendableReputation >= Jokes.getPrice(joke):
		return true
	return false



