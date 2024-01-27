extends Control


func _on_back_pressed():
	get_tree().change_scene_to_file("res://Scene/menu_page.tscn")

func _on_back_mouse_entered():
	$FlipSound.play()
