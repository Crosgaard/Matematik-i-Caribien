extends Minigame

var boolean = true;

# Called when the node enters the scene tree for the first time.
func _ready():
	asker_dialogue = [
		"Hej! Kan du hjælpe mig?",
		"Jeg har længde undret mig over hvor langt mit tag er.",
		"Jeg ville udregne det selv, men jeg er ikke så god til tal som jeg engang var.",
		"Hvis man ser taget fra siden danner det en retvinklet trekant.",
		"Jeg har kun kunne måle trekantens bredde og højde, så du må udrenge den skrå længde.",
		"Trekanten er 4 meter bred og 3 meter høj. Hvor lang der den skrå længde?"
	]
	asker_hint = "Pythagoras sagde noget med at a² + b² = c². Måske kan det hjælpe dig på vej?"
	answer = "5"
	win_dialogue = "Perfekt! Tag denne årer som tak! Mine sejledage er overstået for længst."
	
	player_bubble = $Background/PlayerBubble
	asker_bubble = $Background/AskerBubble
	player_bubble_label = $Background/PlayerBubble/Label
	asker_bubble_label = $Background/AskerBubble/Label
	setAskerText(asker_dialogue[0])

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	handle_clicks()
	handle_player_bubble(false)
