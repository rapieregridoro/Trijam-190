extends KinematicBody2D


var fugir_de := Vector2.ZERO
var Tempo:float = 10

var vel_fant = 25

func _ready() -> void:
	
	pass

func _physics_process(delta: float) -> void:
	fugir_de = Global.Player.global_position - position
	
	move_and_slide(-fugir_de.normalized() * vel_fant)
	Tempo -= delta
	if Tempo < 0:
		var Ini = load("res://Scenes/Inimigo.tscn")
		var enemego = Ini.instance()
		enemego.position = position
		get_parent().add_child(enemego)
		queue_free()
	

func _on_Hurt_body_entered(body: Node) -> void:
	Global.Inimigos += 1
	queue_free()
	


