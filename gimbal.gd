extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
var mouseShow=1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		mouseShow*=-1
	if mouseShow==1:
		Input.mouse_mode=Input.MOUSE_MODE_VISIBLE
	if mouseShow==-1:
		Input.mouse_mode=Input.MOUSE_MODE_CAPTURED

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion && mouseShow==-1:
		print(event.relative)
		rotation.y+=-event.relative.x*0.001
		$Camera3D.rotation.x+=-event.relative.y*0.001
		if $Camera3D.rotation.x<-PI/2:
			$Camera3D.rotation.x=-PI/2
			
		if $Camera3D.rotation.x>PI/2:
			$Camera3D.rotation.x=PI/2
