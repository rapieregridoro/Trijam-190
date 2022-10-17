extends Node2D

var ponto_inicial : Vector2
var ponto_final : Vector2
var tempo

func _ready() -> void:
	$Coleta/CollisionShape2D.disabled = true
	$Tween.interpolate_property(self, "position",ponto_inicial, ponto_final, tempo, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Tween.start()
	

func physics_process(delta: float) -> void:
	
	
	pass

func _on_Tween_tween_all_completed() -> void:
	$Coleta/CollisionShape2D.disabled = false
	Global.Can_Teleport = true
	Global.point_of_tp = ponto_final
	


func _on_Coleta_body_entered(body: Node) -> void:
	Global.Com_Arma = true
	queue_free()
	
