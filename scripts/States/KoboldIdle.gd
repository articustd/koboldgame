extends State
class_name KoboldIdle

@export var kobold: CharacterBody2D
@export var move_speed := 30.0
@export var navAgent : NavigationAgent2D

var move_direction : Vector2
var wander_time : float

func randomize_wander():
	move_direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
	wander_time = randf_range(1, 3)
	
func Enter():
	randomize_wander()
	
func Update(delta: float):
	if wander_time > 0:
		wander_time -= delta
		
	else:
		randomize_wander()
		
func Physics_Update(delta: float):
	if kobold:
		kobold.velocity = move_direction * move_speed

func _input(event):
	if event is InputEventMouseButton:
		if event.pressed:
			navAgent.debug_enabled = true
			Transitioned.emit(self, "Goto")
