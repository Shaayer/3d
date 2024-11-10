extends Area3D

var velocityZ=-0.7;
var finished=false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

@onready var ray: RayCast3D = $RayCast3D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	ray.position.z=-velocityZ*2/5
	ray.target_position.z=velocityZ*1.5+ray.position.z
	#return
	
	
	
	if ray.is_colliding():
		global_position=ray.get_collision_point()
		_on_body_entered(null)
		return
	
	velocityZ+=delta
	if velocityZ>=0:
		finished=true
	if finished==true:
		velocityZ=0
		position.y-=gravity*delta
		
	rotation_degrees.x-=0.02
	position+=transform.basis.z*velocityZ
	







func _on_body_entered(body: Node3D) -> void:
	velocityZ=0
	set_process(false)
