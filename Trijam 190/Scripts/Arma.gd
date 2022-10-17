extends Node2D

var ponto_inicial : Vector2
var ponto_final : Vector2
var tempo

var angulo

func _ready() -> void:
	$Coleta/CollisionShape2D.disabled = true
	$Tween.interpolate_property(self, "position",ponto_inicial, ponto_final, tempo, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Tween.start()
	pegar_angulo()
	
	

func physics_process(delta: float) -> void:
	
	
	
	
	pass

func pegar_angulo():
	
	angulo = rad2deg( (ponto_final - ponto_inicial).angle() )
	$Viajando.rotation_degrees = angulo + 135
	
	$Fincado.flip_h = (ponto_final - ponto_inicial).x > 0
	


func _on_Tween_tween_all_completed() -> void:
	$Coleta/CollisionShape2D.disabled = false
	$Dano/CollisionShape2D.disabled = true
	Global.Can_Teleport = true
	Global.point_of_tp = ponto_final
	$Fincado.show()
	$Viajando.hide()
	


func _on_Coleta_body_entered(body: Node) -> void:
	Global.Com_Arma = true
	Global.Can_Teleport = false
	queue_free()
	
