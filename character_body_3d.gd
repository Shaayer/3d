extends CharacterBody3D

@onready var gun_tip: Marker3D = $Person/Gun/GunTip
@onready var aim_position: Marker3D = $Gimbal/Camera3D/AimPosition

@onready var gimbal: Node3D = $Gimbal
const SPEED = 5.0
const JUMP_VELOCITY = 4.5
@onready var camera: Camera3D = $Gimbal/Camera3D
#@onready var mesh_instance_3d: MeshInstance3D = $MeshInstance3D
const BULLET = preload("res://bullet.tscn")
@onready var gun: MeshInstance3D = $Person/Gun
@onready var person: MeshInstance3D = $Person

func _physics_process(delta: float) -> void:
	person.rotation.y=gimbal.rotation.y
	gun.rotation.x=camera.rotation.x
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	gun.look_at(aim_position.global_position)
	
	# Handle jump.
	if Input.is_action_just_pressed("space") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("a", "d", "w", "s")
	#var direction := (camera.global_transform.basis.z * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	var directionSide := gimbal.global_transform.basis.x*input_dir.x
	var directionForward := gimbal.global_transform.basis.z * input_dir.y
	var direction=directionSide+directionForward
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	if Input.is_action_just_released("click"):
		var bullet = BULLET.instantiate()
		
		get_parent().add_child(bullet)
		bullet.global_position=gun_tip.global_position
		bullet.global_rotation=gun.global_rotation

	move_and_slide()
