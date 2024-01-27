extends Node2D

@onready var body = $Body
@onready var hair = $Hair
@onready var top = $Top
@onready var bottom = $Bottom
@onready var face = $Face

var initialPosition = null

func randomOffset():
	if initialPosition == null:
		initialPosition = position
	else:
		position = initialPosition
	move_local_x(randf_range(-10, 10))
	move_local_y(randf_range(-10, 10))

func setSprite(funSeed, isMale): # randi
	randomOffset()
	# body = 4, 5
	# bottom = 1, 6
	# top = 3, 8
	# hair = 16, 18, 21
	funSeed = rand_from_seed(funSeed)[0]
	if isMale:
		if funSeed % 2 == 0:
			body.frame = 4
			top.frame = 3
		else:
			body.frame = 5
			top.frame = 8
		bottom.frame = 1 + funSeed / 3 % 2 * 5
		var hairFrame = 16 + funSeed % 3 * 2
		if hairFrame == 20:
			hairFrame = 21
		hair.frame = hairFrame
	else:
		# body = 9, 13
		# bottom = 10, 14
		# top = 12, 15
		# hair = 18, 22
		if funSeed % 2 == 0:
			body.frame = 9
			top.frame = 12
			bottom.frame = 10
		else:
			body.frame = 13
			top.frame = 15
			bottom.frame = 14
		hair.frame = 18 + funSeed / 3 % 2 * 4
	
	funSeed = rand_from_seed(funSeed)[0]
	
	var hairC = PresetColors.getHair(funSeed)
	hair.material.set_shader_parameter("red", hairC[0])
	hair.material.set_shader_parameter("green", hairC[1])
	hair.material.set_shader_parameter("blue", hairC[2])
	
	var topC = PresetColors.getTop(funSeed)
	top.material.set_shader_parameter("red", topC[0])
	top.material.set_shader_parameter("green", topC[1])
	top.material.set_shader_parameter("blue", topC[2])
	
	funSeed = rand_from_seed(funSeed)[0]
	
	var bottomC = PresetColors.getTop(funSeed)
	bottom.material.set_shader_parameter("red", bottomC[0])
	bottom.material.set_shader_parameter("green", bottomC[1])
	bottom.material.set_shader_parameter("blue", bottomC[2])
	
func setMood(moodTrait):
	# happy 1
	# sad 4
	# irritated 3
	# tired 2
	# normal 0
	match moodTrait:
		TraitFactory.Traits.IRRITATED:
			face.frame = 3
		TraitFactory.Traits.SAD:
			face.frame = 4
		TraitFactory.Traits.HAPPY:
			face.frame = 1
		TraitFactory.Traits.TIRED:
			face.frame = 2
