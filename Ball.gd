extends KinematicBody2D

export var initial_ball_speed = 300
export var speed_emulator = 50
var ball_speed = initial_ball_speed

var hitcounter = 0 
var max_hitcounter = 12
var direction = Vector2()

func _ready():
	randomize()
	set_start_direction()

func set_start_direction():
	var random_x = 0
	
	if randi()%10 < 5:
		random_x = 1
	else:
		random_x = -1
		
	direction = Vector2(random_x, rand_range(-1, 1))
	direction = direction.normalized() * ball_speed
		
func _physics_process(delta):
	var collision = move_and_collide(direction * delta)
	if collision :
		direction = direction.bounce(collision.normal)
		if collision.collider.is_in_group("rackets"):
			pass 
					
