extends KinematicBody2D

export var initial_ball_speed = 300
export var speed_commulator = 50
var ball_speed = initial_ball_speed

var hit_counter = 0 
var max_hit_counter = 12
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
	var y = direction.y
	var collision = move_and_collide(direction * delta)
	if collision :
		direction = direction.bounce(collision.normal)
		if collision.collider.is_in_group("rackets"):
			y = direction.y / 2 + collision.collider_velocity.y
			if hit_counter < max_hit_counter:
				hit_counter += 1
			else:
				y = direction.y
				direction = Vector2(direction.x, y).normalized() * (ball_speed * hit_counter * speed_commulator)

func reset():
	position = Vector2(512, 256)
	direction = Vector2()
	hit_counter = 0
