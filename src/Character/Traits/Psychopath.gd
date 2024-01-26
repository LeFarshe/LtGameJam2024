class_name Psychopath extends Trait

const slapstick = [1.5,1.5]
const bad = [1.5,1.5]
const dark = [1.5,1.5]
const other = [1,1]

func _init():
	name = "Psychopath"
	
func reactToJoke(joke, rep):
	match joke:
		Jokes.JokeTypes.SLAPSTICK:
			return slapstick
		Jokes.JokeTypes.BAD:
			return bad
		Jokes.JokeTypes.DARK:
			return dark
		_:
			return other
