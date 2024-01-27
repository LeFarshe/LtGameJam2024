class_name NameFactory

const maleNames = ["James", "Robert", "John", "Michael", "David", "William", "Richard", "Joseph", "Thomas", "Christopher", "Todd"]
const femaleNames = ["Mary", "Patricia", "Jennifer", "Linda", "Elizabeth", "Barbara", "Susan", "Jessica", "Sarah", "Karen", "Lisa"]
const lastName = ["Smith", "Johnson", "Williams", "Brown", "Jones", "Garcia", "Miller", "Davis", "Rodriguez", "Wilson", "Anderson", "Thomas", "Ephant", "Howard"]

static func generateName(isMale):
	if isMale:
		return maleNames[randi() % maleNames.size()] + " " + lastName[randi() % lastName.size()]
	else:
		return femaleNames[randi() % femaleNames.size()] + " " + lastName[randi() % lastName.size()]
