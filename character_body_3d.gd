extends CharacterBody3D

@onready var gimbal: Node3D = $Gimbal
const SPEED = 5.0
const JUMP_VELOCITY = 4.5
@onready var camera: Camera3D = $Gimbal/Camera3D
@onready var mesh_instance_3d: MeshInstance3D = $MeshInstance3D


func _physics_process(delta: float) -> void:
	$MeshInstance3D.rotation.y=gimbal.rotation.y
	$MeshInstance3D/MeshInstance3D2.rotation.x=camera.rotation.x
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	# Handle jump.
	if Input.is_action_just_pressed("space") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("a", "d", "w", "s")
	var direction := (camera.global_transform.basis.z * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
