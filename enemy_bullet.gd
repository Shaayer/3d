extends "res://bullet.gd"



func _on_body_entered(body: Node3D) -> void:
	velocityZ=0
	set_process(false)
