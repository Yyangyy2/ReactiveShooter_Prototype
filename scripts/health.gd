extends Node2D


@export var health: int = 100:
	set = set_health

func set_health(new_health: int):
	health = new_health
