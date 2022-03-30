extends Node

var bulletInstanceCount = 0 # Keeps track of how many bullet instances are current
var enemyBulletInstanceCount = 0

var scoringInformation = {
		"currentScore": 0,
	"currentPlayer": "User",
	"highScore": 0,
	"highScorePlayersName" : "Winner"
}

var saveHighScore = {
	"HighScore" : "0"
}

var saveGameFileName: String = "user://Highscore.txt"

func _ready() -> void:
	print("Original Data: ", saveHighScore)
	self.loadData()
	print("Altered Data: ", saveHighScore)

func editData() -> void:
	saveHighScore.HighScore = $HUD/HighScore.text

func saveData() -> void:
	self.editData()
	
	var saveFile = File.new()
	saveFile.open(saveGameFileName, File.WRITE)
	
	saveFile.store_line(to_json(saveHighScore))
	saveFile.close()


func loadData() -> void:
	var dataFile = File.new()
	
	if not dataFile.file_exists(saveGameFileName):
		return
	
	dataFile.open(saveGameFileName, File.READ)
	
	while dataFile.get_position() < dataFile.get_len():
		var nodeData = parse_json(dataFile.get_line())
		
		saveHighScore.Highscore = nodeData[$HUD/HighScore.text]


func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST:
		self.saveData()
		get_tree().quit()
