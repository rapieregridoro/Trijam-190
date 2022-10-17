extends Node2D

var Inimigo = preload("res://Scenes/Inimigo.tscn")
var Temporizando_Tudo : float = 0
var Spawnou := false

var boboras_destruidas := 0
func _ready() -> void:
	Global.Tempo = 0
	Global.Inimigos = 0
	
	Global.connect("abobora_destruida",self, "derrota")
	
	pass 

func _physics_process(delta: float) -> void:
	Temporizando_Tudo += delta
	
	
	if int(Temporizando_Tudo) % 5 == 0 :
		if !Spawnou:
			for a in range( int(sqrt(Temporizando_Tudo) ) ):
				Spawn()
			Spawnou = true
	else:
		Spawnou = false
	

func derrota():
	boboras_destruidas += 1
	if boboras_destruidas >= 3:
		Global.Tempo = Temporizando_Tudo
		get_tree().change_scene("res://Scenes/Menuzinho.tscn")
	
	pass

func Spawn():
	randomize()
	var spawn_point = polar2cartesian(500, deg2rad(randi()%370))
	
	var enemego = Inimigo.instance()
	enemego.position = spawn_point
	
	add_child(enemego)
	
	pass
