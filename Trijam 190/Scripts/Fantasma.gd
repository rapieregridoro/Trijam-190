extends KinematicBody2D


var fugir_de := Vector2.ZERO

func _ready() -> void:
	
	pass

func _physics_process(delta: float) -> void:
	fugir_de = Global.Player.global_position - position
	
	move_and_slide(-fugir_de.normalized()* 25)
	


func _on_Hurt_body_entered(body: Node) -> void:
	Global.Inimigos += 1
	queue_free()


