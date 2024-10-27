extends Area3D

var velocityZ=0;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if Input.is_action_just_released("click"):
		
	
	
	velocityZ-=0.1
	if velocityZ==0:
		queue_free()
	rotation_degrees.x-=0.1
	position+=transform.basis.z*velocityZ
	
