extends Node2D

func _ready():
	globals.kills = 0
	globals.currentStage = 0
	globals.hello = ''
	var labelText = "Message: " + str(globals.rounds)
	var helloText = ""+ str(globals.hello)
	$HUD/Rounds.set_text(labelText)
	$HUD/Hello.set_text(helloText)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$HUD/Rounds.set_text("Round: " + str(globals.rounds))
	$HUD/Hello.set_text("Message: "+ str(globals.hello))
	pass

#func _physics_process(delta):
	#var collision = move_and_collide(velocity * delta)
	#if collision:
   # 	velocity = velocity.slide(collision.normal)

