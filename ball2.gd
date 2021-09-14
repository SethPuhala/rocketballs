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
	if Input.is_action_pressed("move_left1"):
		vel.x = -moveForce
	if Input.is_action_pressed("move_right1"):
		vel.x = moveForce
	if Input.is_action_just_pressed("jump1"):
		if is_on_floor():
			vel.y -= jumpForce
		elif vel.x > 0 and not is_on_floor():
			vel.x = 5500
		elif vel.x < 0 and not is_on_floor():
			vel.x = -5500
	if Input.is_action_pressed("rocket1") and juice > 0:
		vel.y = -rocketForce
		juice -= 1
		if juice < 0:
			juice = 0

		
		
	
	move_and_slide(vel, Vector2.UP)
	juice_scale.rect_size = Vector2(9 * juice, 150)
