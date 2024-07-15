extends State
class_name KoboldGoto

@export var kobold: CharacterBody2D
@export var move_speed := 100.0
@export var navAgent : NavigationAgent2D

func Enter():
	pass
	
#func Update(delta: float):
	#if wander_time > 0:
		#wander_time -= delta
		#
	#else:
		#randomize_wander()
		#
func Physics_Update(delta: float):
	if navAgent.is_navigation_finished():
		kobold.velocity.x = move_toward(kobold.velocity.x, 0, move_speed)
		kobold.velocity.y = move_toward(kobold.velocity.y, 0, move_speed)
		return
	
	var currPos = kobold.global_position
	var nextPathPos = navAgent.get_next_path_position()
	#print("Kobold Position: " + str(kobold.global_position))
	#print("Kobold Next Position: " + str(nextPathPos))
	kobold.velocity = currPos.direction_to(nextPathPos) * move_speed
	#Input.get_vector()
	#if kobold:
		#kobold.velocity = move_direction * move_speed

func _input(event):
	if event is InputEventMouseButton:
		if event.pressed:
			var camera = get_viewport().get_camera_2d()
			print(str(camera.global_position))
			navAgent.target_position = (camera.zoom + camera.global_position) + event.position
