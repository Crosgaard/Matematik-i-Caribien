extends Control
class_name Minigame

@onready var player_bubble = $Background/PlayerBubble
@onready var asker_bubble = $Background/AskerBubble
@onready var player_bubble_label = $Background/PlayerBubble/Label
@onready var asker_bubble_label = $Background/AskerBubble/Label

var hover = false
var answering = false
var won = false;

var asker_dialogue
var asker_hint: String
var answer: String
var win_dialogue: String

var current_dialogue_index = 0

func _ready():
	pass # Replace with function body.

func _process(_delta):
	handle_player_bubble(false)

func handle_clicks():
	if won and Input.is_action_just_pressed("click"):
		reset_game()
		get_tree().change_scene_to_file("res://Scenes/Levels/level.tscn")
	elif answering and not hover and Input.is_action_just_pressed("click"):
		setAskerText(asker_dialogue[len(asker_dialogue) - 1])
	elif Input.is_action_just_pressed("click") and not hover and not current_dialogue_index >= len(asker_dialogue) - 1:
		current_dialogue_index += 1
		setAskerText(asker_dialogue[current_dialogue_index])
	if current_dialogue_index >= len(asker_dialogue) - 1 and not answering:
		answering = true

func handle_player_bubble(enter_pressed):
	if not answering:
		return
	if enter_pressed or (player_bubble_label.has_focus() and ((not hover and Input.is_action_just_pressed("click")))):
		print("ok")
		player_bubble_label.release_focus()
		var entered = str(player_bubble_label.text)
		player_bubble_label.text = ""
		if entered == answer:
			game_won()
		else:
			setAskerText(asker_hint)

func game_won():
	won = true
	setAskerText(win_dialogue)
	

func setPlayerText(text):
	player_bubble_label.text = text
	if text == "":
		player_bubble.modulate.a = 0;
	else:
		player_bubble.modulate.a = 1;

func setAskerText(text):
	asker_bubble_label.text = text
	if text == "":
		asker_bubble.modulate.a = 0;
	else:
		asker_bubble.modulate.a = 1;

func _on_label_mouse_entered():
	hover = true

func _on_label_mouse_exited():
	hover = false

func _input(event):
	if player_bubble_label.has_focus():
		if event is InputEventKey and event.is_pressed():
			if event.keycode == KEY_SPACE or event.keycode == KEY_ENTER:
				if event.keycode == KEY_ENTER:
					handle_player_bubble(true)
				get_viewport().set_input_as_handled()

func reset_game():
	answering = false
	won = false
	current_dialogue_index = 0
