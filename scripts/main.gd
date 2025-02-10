extends Node2D

@onready var bullet_manager = $BulletManager
@onready var player = $Player 


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize() #Randomize Enemy patrol movement (this important, even tough ai.gd has random movement but it will make the same random movement each time if without this randomize())
	GlobalSignals.bullet_fired.connect(Callable(bullet_manager, "handle_bullet_spawned"))
