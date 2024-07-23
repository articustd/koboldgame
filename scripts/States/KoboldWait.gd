extends State
class_name KoboldWait

@export var kobold: CharacterBody2D
@export var maxWait: int = 10

var wait_time : float

func randomize_wait():
	wait_time = randf_range(1, maxWait)
	
func Enter():
	randomize_wait()
	
func Update(delta: float):
	if wait_time > 0:
		wait_time -= delta
		
	else:
		Transitioned.emit(self, "Idle")
