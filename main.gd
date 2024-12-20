extends Node3D

@onready var enemy: RigidBody3D = $Enemy
@onready var player: CharacterBody3D = $Player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for child in get_children():
		if child is Enemy:
			child.target=player

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
