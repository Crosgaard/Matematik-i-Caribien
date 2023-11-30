extends Minigame

var boolean = true;

# Called when the node enters the scene tree for the first time.
func _ready():
	asker_dialogue = [
		"Du vil have et lån sige du? Det kan arrangeres...",
		"Jeg kan give dig et lån på 1000kr. med en 10% over 2 år.",
		"Inden jeg lader dig tage lånet, skal jeg bare lige vide noget.",
		"Jeg vil se om du ved hvad du skal betale tilbage efter 2 år.",
		"Dette er for at se om du har tænkt over lånet.",
		"Hvis du har tænkt over det, er måske mindre chance for at du snyder mig.",
		"På et lån af 1000kr med 10% i renter over 2 år, hvor meget bataler du i renter?"
	]
	asker_hint = "Renters rente formlen kan bruges til at udregningen:\nK = K₀ * (1 + r)ⁿ"
	answer = "210"
	win_dialogue = "Lyder rigtigt. Her er dit lån. Husk nu at betale det tilbage igen!"
	
	player_bubble = $Background/PlayerBubble
	asker_bubble = $Background/AskerBubble
	player_bubble_label = $Background/PlayerBubble/Label
	asker_bubble_label = $Background/AskerBubble/Label
	setAskerText(asker_dialogue[0])

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	handle_clicks()
	handle_player_bubble(false)
