extends Minigame

var boolean = true;

# Called when the node enters the scene tree for the first time.
func _ready():
	asker_dialogue = [
		"Hej! Jeg vil gerne bygge en rampe over en stor kløft.",
		"Jeg har mere end nok materialer til det, jeg skal bare have hjælp til en sidste udregning.",
		"Jeg kender min rampes start- og slutpunkter. Jeg skal bare finde rampens hældning.",
		"Rampen starter i punktet (10;6) og slutter i punktet (6;4). Hvor meget hælder rampen?",
	]
	asker_hint = "Topunktsformlen: (y2 - y1) / (x2 - x1), kan bruges til at finde hældning udfra 2 punkter."
	answer = "0.5"
	win_dialogue = "Det lyder rigtig! Her er det overskydende træ til rampen, til hvis du kan bruge det."
	
	player_bubble = $Background/PlayerBubble
	asker_bubble = $Background/AskerBubble
	player_bubble_label = $Background/PlayerBubble/Label
	asker_bubble_label = $Background/AskerBubble/Label
	setAskerText(asker_dialogue[0])

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	handle_clicks()
	handle_player_bubble(false)

