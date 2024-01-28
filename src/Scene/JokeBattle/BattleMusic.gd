extends AudioStreamPlayer

func _ready():
	play(1)

func _on_finished():
	play(27)
