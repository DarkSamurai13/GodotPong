extends Node

var PlayerScore = 0
var OpponentScore = 0

func _on_RedWall_body_entered(body):
	$Ball.position = Vector2(500,300)
	OpponentScore += 1
	score_achieved()

func _on_BlueWall_body_entered(body):
	$Ball.position = Vector2(500,300)
	PlayerScore += 1
	score_achieved()

#Score

func _process(delta):
	$PlayerScore.text = str(PlayerScore)
	$OpponentScore.text = str(OpponentScore)
	$CountdownLabel.text = str(int($CountdownTimer.time_left) + 1)

# Timer

func _on_CountdownTimer_timeout():
	get_tree().call_group('BallGroup','restart_ball')
	$CountdownLabel.visible = false

func score_achieved():
	get_tree().call_group('BallGroup','stop_ball')
	$CountdownTimer.start()
	$CountdownLabel.visible = true
	$ScoreSound.play()
	$Player.position.x = 35
	$Opponent.position.x = 965

