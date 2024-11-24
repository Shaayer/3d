class_name Enemy

extends RigidBody3D
@onready var gun: MeshInstance3D = $EnemyGun
@onready var gun_tip: Marker3D = $EnemyGun/GunTip
var target=null

var speed=10
var count=0
var newBullet=preload("res://enemy_bullet.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	gun.look_at(target.global_position)
	apply_torque_impulse(Vector3(0,randf_range(0,2*PI),0))
	apply_impulse(transform.basis.z*speed*delta)
	
	
	count+=1
	if count % 60 == 0:

		var bullet = newBullet.instantiate()
		
		get_parent().add_child(bullet)
		bullet.global_position=gun_tip.global_position
		bullet.global_rotation=gun.global_rotation
