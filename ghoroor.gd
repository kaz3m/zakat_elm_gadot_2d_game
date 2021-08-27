extends KinematicBody2D

var shetab_doshman = Vector2()
var doshamn_speed = 150
export var jahate_harekat = -1

func _ready():
	if jahate_harekat == -1:
		$AnimatedSprite.flip_h = true
	$tashkhis_partgah.position.x = $CollisionShape2D.shape.get_extents().x * jahate_harekat

func _physics_process(delta):
	
	if is_on_wall() or not $tashkhis_partgah.is_colliding():
		jahate_harekat = jahate_harekat * -1
		$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h
		$tashkhis_partgah.position.x = $CollisionShape2D.shape.get_extents().x * jahate_harekat

	shetab_doshman.y = shetab_doshman.y + 50
	shetab_doshman.x = doshamn_speed * jahate_harekat
	shetab_doshman = move_and_slide(shetab_doshman, Vector2.UP)
	


func _on_morade_doshman_body_entered(body):
	$AnimatedSprite.play("mordan")
	doshamn_speed = 0
	body.nime_paresh()
	print("Doshman Mord!!!")
	set_collision_layer_bit(3, false)
	set_collision_mask_bit(0, false)
	$morade_doshman.set_collision_mask_bit(0, false)
	$sadame_didan.set_collision_mask_bit(0, false)
	$AnimationPlayer.play("mordane_doshman")
	
	
	
	$Timer_marge_doshman.start()


func _on_Timer_marge_doshman_timeout():
	queue_free()


func _on_AnimationPlayer_animation_finished(anim_name):
	$AnimationPlayer.stop()


func _on_sadame_didan_body_entered(body):
	print("barkhord ba doshman")
	body.sadame_didan(position.x)
