extends Control

var score
var highscore

var save_path= "user://save.dat"

func _ready():
	score = 0
	highscore = load_score()
	$HighScore.text = "High Score: "+str(highscore)

func _on_HitBox_area_entered(area):
	if area.is_in_group("ScoreArea"):
		score += 1
		if score > highscore:
			highscore = score
			new_score(highscore)
		$Score.text = str(score)
		$HighScore.text = "High Score: "+ str(highscore)


func new_score(HighScore):
	var file = File.new()
	var error = file.open(save_path, File.WRITE)
	if error == OK:
		file.store_64(HighScore)
		file.close()
		
func load_score():
	var HighScore = 0
	var file = File.new()
	if file.file_exists(save_path):
		var error = file.open(save_path, File.READ)
		if error == OK:
			HighScore = file.get_64()
			print(HighScore)
			file.close()
	return HighScore
	
