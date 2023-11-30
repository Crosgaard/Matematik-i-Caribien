extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_bank_pressed():
	get_tree().change_scene_to_file("res://Scenes/Levels/minigame_bank.tscn")

func _on_wood_pressed():
	get_tree().change_scene_to_file("res://Scenes/Levels/minigame_kløft.tscn")

func _on_roof_pressed():
	get_tree().change_scene_to_file("res://Scenes/Levels/minigame_tag.tscn")
