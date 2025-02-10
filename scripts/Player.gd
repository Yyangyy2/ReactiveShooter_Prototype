extends CharacterBody2D
class_name Player





# Adjust speed of movement
@export var speed: int = 500



@onready var weapon = $Weapon
@onready var health_stat = $Health


	
	
# Allows movement direction (project settings - input map using WASD)
func _process(delta: float) -> void:
	var movement_direction: Vector2 = Vector2.ZERO
	if Input.is_action_pressed("up"):
		movement_direction.y = -1
	if Input.is_action_pressed("down"):
		movement_direction.y = 1
	if Input.is_action_pressed("left"):
		movement_direction.x = -1
	if Input.is_action_pressed("right"):
		movement_direction.x = 1
		
	# Allows speed slide smoothly
	movement_direction = movement_direction.normalized()
	velocity = movement_direction * speed
	move_and_slide()
	# Allows rotatation based on mouse (this is godot built-in func)
	look_at(get_global_mouse_position())
	
	
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_released("shoot"):
		weapon.shoot()
		


func handle_hit():
	health_stat.health -= 20
	print("Hit",health_stat.health)
