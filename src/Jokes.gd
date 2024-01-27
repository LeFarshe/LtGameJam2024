class_name Jokes

enum JokeTypes {PUN, SARCASM, SLAPSTICK, SURREAL, SELFDEPRECATING, OBSERVATIONAL, DARK, BAD}

static func getDefaultReaction(joke):
	var ans = [1,1]
	match joke:
		JokeTypes.PUN:
			ans = [1,1.5]
		JokeTypes.SLAPSTICK:
			ans = [1,1.5]
		JokeTypes.SURREAL:
			ans = [1.5,3]
		JokeTypes.SELFDEPRECATING:
			ans = [1.5,1]
		JokeTypes.OBSERVATIONAL:
			ans = [1,0.8]
		JokeTypes.DARK:
			ans = [1.5,3]
		JokeTypes.BAD:
			ans = [0.5,2]
	return ans

static func getPrice(joke):
	var ans = 0;
	match joke:
		JokeTypes.PUN:
			ans = 5
		JokeTypes.SARCASM:
			ans = 10
		JokeTypes.SLAPSTICK:
			ans = 20
		JokeTypes.SURREAL:
			ans = 20
		JokeTypes.SELFDEPRECATING:
			ans = 30
		JokeTypes.OBSERVATIONAL:
			ans = 10
		JokeTypes.DARK:
			ans = 50
	return ans
	
static func getName(joke):
	var ans
	match joke:
		JokeTypes.PUN:
			ans = "puns"
		JokeTypes.SARCASM:
			ans = "sarcasm"
		JokeTypes.SLAPSTICK:
			ans = "slapstick"
		JokeTypes.SURREAL:
			ans = "surreal jokes"
		JokeTypes.SELFDEPRECATING:
			ans = "self-deprecation"
		JokeTypes.OBSERVATIONAL:
			ans = "observational jokes"
		JokeTypes.DARK:
			ans = "dark jokes"
		JokeTypes.BAD:
			ans = "bad jokes"
	return ans
