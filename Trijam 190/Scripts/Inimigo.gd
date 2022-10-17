extends KinematicBody2D

var alvos := []
var alvo_atual := Vector2.ZERO

func _ready() -> void:
	
	achar_alvo()
	
	Global.connect("abobora_destruida", self, "achar_alvo")
	

func _process(delta: float) -> void:
	move_and_slide((alvo_atual - position).normalized() * 30)
	

func achar_alvo():
	randomize()
	alvos = []
	for a in Global.aboboras:
		alvos.append(a)
	alvos.shuffle()
	var a = null
	for b in alvos:
		if !b.destruida and a == null: a = b
	alvo_atual = a.global_position if a != null else Vector2(1000, 1000)
	

var Fantasminha = preload("res://Scenes/Fantasma.tscn")
func _on_Hurt_area_entered(area: Area2D) -> void:
	
	var phanton = Fantasminha.instance()
	phanton.position = self.position
	get_parent().add_child(phanton)
	queue_free()
	


func _on_Hit_body_entered(body: Node) -> void:
	body.get_parent().Vida -= 1
	queue_free()
	


