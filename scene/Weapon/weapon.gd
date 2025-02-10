extends Node2D
class_name Weapon




# Make Bullet instance and export it from a scene
@export var Bullet: PackedScene

@onready var attack_cooldown = $AttackCoolDown
@onready var end_of_gun = $EndOfGun
@onready var gun_direction = $GunDirection



func shoot():
	if attack_cooldown.is_stopped() and Bullet != null:
		var bullet_instance = Bullet.instantiate()
		var direction = (gun_direction.get_global_position() - end_of_gun.global_position).normalized()
		GlobalSignals.emit_signal("bullet_fired", bullet_instance, end_of_gun.global_position, direction)
		attack_cooldown.start()
	
