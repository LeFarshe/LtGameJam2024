class_name PresetColors

static func getHair(funSeed):
	funSeed /= 2
	match funSeed % 8:
		0:
			return [0.9, 0.4, 0.2]
		1:
			return [0.9, 0.8, 0.4]
		2:
			return [0.1, 0.1, 0.3]
		3:
			return [0.1, 0.1, 0.1]
		4:
			return [0.5, 0.5, 0.5]
		5:
			return [0.5, 0.3, 0.2]
		6:
			return [0.8, 0.5, 0.5]
		7:
			return [0.9, 0.9, 0.9]

static func getTop(funSeed):
	funSeed /= 7
	match funSeed % 4:
		0:
			return [0.5, 0.1, 0.2]
		1:
			return [0.2, 0.2, 0.2]
		2:
			return [0.8, 0.8, 0.8]
		3:
			return [0.2, 0.1, 0.5]
