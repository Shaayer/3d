extends RigidBody3D

var speed=10
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	apply_torque_impulse(Vector3(0,randf_range(0,2*PI),0))
	apply_impulse(transform.basis.z*speed*delta)
