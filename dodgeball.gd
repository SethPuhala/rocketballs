extends RigidBody2D

var rng = RandomNumberGenerator.new()

onready var ball = $circle

var time = 0
var currently = null
var running = true
var tt = 0

var stuff = [-1, 1]



onready var p1 = get_node("../player1")
onready var p2 = get_node("../player2")
onready var scoretxt = get_node("../score")
onready var variables = get_node("/root/Global")

func _ready():
	set_contact_monitor(true)
	set_max_contacts_reported(4)
	rng.randomize()

var team = stuff[rng.randi() % stuff.size()]
	 





func _process(delta):
	currently = null
	
	scoretxt.set_text(str(variables.p2score) + " | " + str(variables.p1score))
	var coliBodies = get_colliding_bodies()
	if coliBodies.size() > 0:
		currently = coliBodies[0]
	if p1 == currently and team == -1 and running:
		p1.queue_free()
		variables.p1score += 1
		running = false
		
	elif p2 == currently and team == 1 and running:
		variables.p2score += 1
		p2.queue_free()
		running = false
	
		
		
	if running == false:
		tt += 1
		if tt >= 100:
			get_tree().reload_current_scene()
			
		
	if Input.is_action_just_released("fullreset"):
		variables.p1score = 0
		variables.p2score = 0
		get_tree().reload_current_scene()
	
	
	
	if team == 1:
		ball.modulate = "#ff00fb"
	elif team == -1:
		ball.modulate = "#ffffff"
	time += 1
	if time >= 400:
		team = team * -1
		time = 0
	1
	
	
	

