extends Area2D


@export var speed: int = 20 # Move 10 pixels per second

var direction := Vector2.ZERO

# Use _physics_process for realistic
func _physics_process(delta: float) -> void:
	if direction != Vector2.ZERO:
		var velocity = direction * speed
		
		global_position += velocity

func set_direction(direction: Vector2):
	self.direction = direction
	rotation += direction.angle()

# Bullet collision
func _on_body_entered(body: Node2D) -> void:
	if body.has_method("handle_hit"):
		body.handle_hit()
		queue_free()
	
