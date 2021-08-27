extends CanvasLayer


func _ready():
	$namayesh_almas.text = String( get_node('/root/level_1/zakat_player').player_almas_number )

func _physics_process(delta):
	$namayesh_almas.text = String( get_node('/root/level_1/zakat_player').player_almas_number )
