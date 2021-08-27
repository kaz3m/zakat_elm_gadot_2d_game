extends Area2D




func _on_Area2D_body_entered(body):
	#queue_free()
	$AnimationPlayer.play("almas_paresh")
	body.add_almas_number(1)

func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()
