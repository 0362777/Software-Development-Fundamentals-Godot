extends Control

# Declare member variables here. Examples:
export(int) var countdownMax 
var currentTimer

# Called when the node enters the scene tree for the first time.
func _ready():
	currentTimer = countdownMax
	$HUD/Countdown.text = str(currentTimer) 
	while currentTimer > 0:
		yield(get_tree().create_timer(1.0), "timeout")
		$HUD/Countdown.text = str(currentTimer) 
		currentTimer = currentTimer - 1
		print(currentTimer)
	print ("Game Over")
func _process(delta):
	$HUD/CurrentScore.text = str(GlobalVariables.scoringInformation["currentScore"])
	if $HUD/CurrentScore > $HUD/HighScore:
		$HUD/HighScore.text = $HUD/CurrentScore.text
