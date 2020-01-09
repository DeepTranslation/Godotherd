extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
  globals.kills = 0
  globals.currentStage = 0
  var labelText = "Round: " + str(globals.rounds)
  #$HUD.Rounds.set_text(labelText)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#$HUD.Rounds.set_text("Round: " + str(globals.rounds))
	pass

func _on_QuitGameButton_pressed():
  get_tree().quit()
func _on_NewGameButton_pressed():
  get_tree().change_scene("GameSceneRoot.tscn")
