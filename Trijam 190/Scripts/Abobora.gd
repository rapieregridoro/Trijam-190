extends Node2D

var Vida = 10 
var destruida := false

func _ready() -> void:
	
	Global.aboboras.append(self)
	 


func _process(delta: float) -> void:
	if Vida <= 0:
		if !destruida:
			Global.aboboras.erase(self)
			Global.emit_signal("abobora_destruida")
			$Sprite.frame = 1
			$StaticBody2D/CollisionShape2D.disabled = true
			destruida = true
		
	
