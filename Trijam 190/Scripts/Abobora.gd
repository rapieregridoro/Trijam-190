extends Node2D

var Vida = 10 
var destruida := false

func _ready() -> void:
	
	Global.aboboras.append(self)
	 


func _process(delta: float) -> void:
	if Vida <= 0:
		destruida = true
		Global.aboboras.erase(self)
		Global.emit_signal("abobora_destruida")
		queue_free()
	
