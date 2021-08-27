extends KinematicBody2D

var number = 0
var player_almas_number = 0
var shetab_player = Vector2(0,0)
var player_speed = 210
var mizane_paresh = 1200
var forsatha = 4

func _physics_process(delta):
	if player_almas_number == 12:
		get_tree().change_scene("res://win_game_menu.tscn")
		
	if Input.is_action_pressed("ui_right"):
		shetab_player.x = player_speed
		$Sprite.play("davidan")
		$Sprite.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		shetab_player.x = -player_speed
		$Sprite.play("davidan")
		$Sprite.flip_h = true
		
	else:
		$Sprite.play("sabet")
	
	if not is_on_floor():
		$Sprite.play("paresh")

	if Input.is_action_pressed("paresh") and is_on_floor():
		
		shetab_player.y = -mizane_paresh
		
		
	shetab_player.y = shetab_player.y + 30
	#print(shetab_player.y)
	#print(player_almas_number)
	shetab_player = move_and_slide(shetab_player, Vector2.UP)
	shetab_player.x = lerp(shetab_player.x , 0, 0.5)

func add_almas_number(number):
	player_almas_number = player_almas_number + number
	
	
func _on_game_over_zone_body_entered(body):
	#get_tree().reload_current_scene()
	get_tree().change_scene("res://game_over_menu.tscn")
func nime_paresh():
	shetab_player.y = -mizane_paresh * 0.7
	
func sadame_didan(var doshman_position):
	set_modulate(Color(1, 0.3,0.3,0.8))
	if position.x < doshman_position:
		shetab_player.x = -3000
	elif position.x > doshman_position:
		shetab_player.x = 3000
	$zende_shodan.start()
	if forsatha == 0:
		get_tree().change_scene("res://game_over_menu.tscn")
	elif forsatha <= 4:
		forsatha -= 1
		get_node('/root/level_1/panel_namayesh/forsatha').karm_kardane_forsat(forsatha)
	print(forsatha)
func _on_zende_shodan_timeout():
	set_modulate(Color(1,1,1,1))
