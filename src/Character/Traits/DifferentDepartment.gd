class_name DifferentDepartment extends Trait

const potentialNames = ["HR", "Management", "Janitor", "Accountant", "Resident homeless person"]

const observational = [0.5,0.5]
const other = [1,1]

func _init():
	name = potentialNames[randi() % potentialNames.size()]

func reactToJoke(joke, rep):
	match joke:
		Jokes.JokeTypes.OBSERVATIONAL:
			return observational
		_:
			return other
			
