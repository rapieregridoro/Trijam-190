extends CanvasLayer


func _ready() -> void:
	Global.Com_Arma = true
	Global.Can_Teleport = false
	Global.point_of_tp = Vector2.ZERO
	Global.aboboras = []
	 
	var tempinho : String = "Tempo sobrevivido = " + String(int(Global.Tempo)) + "s"
	$Tempo.text = tempinho
	var inimiginhos : String = "Inimigos derrotados = " + String(Global.Inimigos)
	$Inimigos.text = inimiginhos

func _on_Button_pressed() -> void:
	get_tree().change_scene("res://Scenes/Fase.tscn")
	
