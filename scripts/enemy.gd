extends CharacterBody2D

@onready var health_stat = $Health
@onready var weapon = $Weapon
@onready var ai = $AI
@export var speed: int = 100

func _ready() -> void:
		ai.initialize(self, weapon)
	
func rotate_towards(location: Vector2):
	rotation = lerp(rotation, global_position.direction_to(location).angle(), 0.1)

func velocity_towards(location: Vector2) -> Vector2:
	return global_position.direction_to(location) * speed


func handle_hit():
	health_stat.health -= 20
	print("Enemy HIT!", health_stat.health)
	if health_stat.health <= 0:
		queue_free() # Make node disappear 
