extends KinematicBody2D

var dir : Vector2 = Vector2.ZERO
var vel : int = 50

var mira : Vector2
var largura : int = 175

var Arma = preload("res://Scenes/Arma.tscn")
var vel_arma = 0.4

var Tempo_parado : float = 0


func _ready() -> void:
	Global.Player = self
	

func _physics_process(delta: float) -> void:
	
	Movement()
	
	Animacao(delta)
	
	if Input.is_action_just_pressed("Atirar"):
		if Global.Com_Arma: Atira()
		if Global.Can_Teleport: Teleport()
	

func Animacao(delta):
	var Anim = "Idle"
	if dir != Vector2.ZERO:
		Anim = "Walk"
		if dir.x != 0:
			$AnimatedSprite.flip_h = dir.x > 0
		Tempo_parado = 0
	else:
		Anim = "Idle"
		Tempo_parado += delta
		
	
	if !Global.Com_Arma:
		Anim = Anim + "_b"
	
	if Tempo_parado > 5 and Global.Com_Arma:
		$AnimatedSprite.play("Static")
	else:
		$AnimatedSprite.animation = Anim


func Movement():
	dir.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	dir.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	move_and_slide(dir * (vel + 20 * int(!Global.Com_Arma) ))
	

func Atira():
	mira = get_global_mouse_position() - position
	var largura_atual = mira.length() if largura > mira.length() else largura
	var duracao = largura_atual/largura + 0.1
	
	var arma_atual = Arma.instance()
	
	arma_atual.tempo = duracao * vel_arma
	arma_atual.ponto_final = polar2cartesian(largura_atual,mira.angle()) + position
	arma_atual.ponto_inicial = position
	
	$"../".add_child(arma_atual)
	
	Global.Com_Arma = false

func Teleport():
	position = Global.point_of_tp
	Global.Can_Teleport = false
	


