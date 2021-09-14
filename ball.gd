extends KinematicBody2D


var vel = Vector2(0, 0)
var moveForce = 550
var gravityForce = 20
var jumpForce = 400
var rocketForce = 400
var juice = 0
onready var juice_scale = $bscale
var scale_size = 733
var scaler : float = juice / 100




func _physics_process(delta):

	vel.x = 0
	vel.y += gravityForce
	if is_on_floor():
		vel.y = 0
		juice += 1
		if juice > 100:
			juice = 100
	
	
	if juice < 100 and is_on_floor():
		juice += 10
	if Input.is_action_pressed("move_left"):
		vel.x = -moveForce
	if Input.is_action_pressed("move_right"):
		vel.x = moveForce
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			vel.y -= jumpForce
		elif vel.x > 0 and not is_on_floor():
			vel.x = 5500
		elif vel.x < 0 and not is_on_floor():
			vel.x = -5500
	if Input.is_action_pressed("rocket") and juice > 0:
		vel.y = -rocketForce
		juice -= 1
		if juice < 0:
			juice = 0
	if Input.is_action_just_released("reset"):
		get_tree().reload_current_scene()

		
		
	
	move_and_slide(vel, Vector2.UP, false, 4, 0.785398, true)
	juice_scale.rect_size = Vector2(9 * juice, 150)
	
	
	
