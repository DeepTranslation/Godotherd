extends Node2D

func _ready():
  globals.kills = 0
  globals.currentStage = 0
  var labelText = "Round: " + str(globals.rounds)
  $HUD/Rounds.set_text(labelText)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$HUD/Rounds.set_text("Round: " + str(globals.rounds))
	pass

#func _physics_process(delta):
	#var collision = move_and_collide(velocity * delta)
	#if collision:
   # 	velocity = velocity.slide(collision.normal)

