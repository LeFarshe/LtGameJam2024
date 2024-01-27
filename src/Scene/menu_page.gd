extends Control

func _on_story_pressed():
	pass # Replace with function body.

func _on_play_pressed():
	get_tree().change_scene_to_file("res://Scene/game.tscn")

func _on_quit_pressed():
	get_tree().quit()

func _on_story_mouse_entered():
	$FlipSound.play()

func _on_play_mouse_entered():
	$FlipSound.play()

func _on_quit_mouse_entered():
	$FlipSound.play()
