extends Node

var bulletInstanceCount = 0 # Keeps track of how many bullet instances are current
var enemyBulletInstanceCount = 0

var scoringInformation = {
		"currentScore": 0,
	"currentPlayer": "User",
	"highScore": 0,
	"highScorePlayersName" : "Winner"
}
var saveFile = File.new()
saveFile.open("path String", File.WRITE)
saveFile.store_line(data)
saveFile.close()
