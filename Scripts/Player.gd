extends RigidBody2D

var vel = Vector2.ZERO
var jump_high = 0

#Importuje główny skrypt i scene muzyki
onready var global = get_node("/root/Global")
onready var music = get_node("/root/Music")
onready var hp_befeore = global.health
onready var hp_after = global.health


#Ustawienie głośności dzwięków i grawitacji
func _ready():
	$AudioStreamPlayer.volume_db = global.sound
	$Hurt.volume_db = global.sound
	set_gravity_scale(10)

#Powtarza caly czas
func _physics_process(delta):
	#Ustawia odbijalność postaci od ścian na 0.9 lub 0 w zależoności od wartości zmiennej glonal.bounce
	if global.bounce:
		set_bounce(0.9)
	else:
		set_bounce(0)
	#Jeżeli wartość zdrowia się zmieniła odtwarza animacje dostania obrażen i odtarza dzwięk 
	hp_after = global.health
	if hp_befeore != hp_after and $AnimationPlayer.current_animation != "Hit":
		$AnimationPlayer.play("Hit")
		$Hurt.play()
		hp_befeore = global.health
		
	#Deklaruje pusty wektor
	var a = Vector2.ZERO
	# (0, 0) 
	#Ustawia x wektora na rożnice wciśnięca guzików czyli:
	#Gdy naciśnieto strzałke w lewo Input.get_action_strength("ui_left") == 1 i analogicznie w prawo
	# Analogicznie góra, dół. Wartości dodatnie są poniżej osi x a ujemne powyżej
	#Gdy jest odwrócone sterowanie kod dziala na odwrót
	
	if global.reverse:
		a.x = Input.get_action_strength("ui_left") - Input.get_action_strength("ui_right")
	else:
		a.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
		
	# Układ wsþólrzędnych w godot góra, dół działa na odwrót niż w matematyce. Wartości dodatnie są poniżej osi x a ujemne powyżej
	# Ustawia y wektora na -1 i odtwarza dzwięk skoku
	if Input.is_action_just_pressed("ui_up") and len(get_colliding_bodies()) > 0:
		a.y = -1
		$AudioStreamPlayer.play()
		
	#Jeżeli wektor się zmienił (użytkonwnik coś nacisnął) ustawia vel na a i gdy nie jest odtwarzana animacja uderzenia
	#odtwarza animacje biegu. Na końcu ustawia tarcie na 0.5 czyli pozwala postaci na ruch
	if a != Vector2.ZERO:
		vel = a
		if $AnimationPlayer.current_animation != "Hit":
			$AnimationPlayer.play("Run")
		self.physics_material_override.friction = 0.5 
		
	# W przeciwnym wypadku ustawia vel na pusty wektor i odtwarza aniamcje stania lub tarczy (w zależności od wartości global.shield)
	else:
		vel = Vector2.ZERO
		if $AnimationPlayer.current_animation != "Hit":
			if global.shield:
				$AnimationPlayer.play("Shield")
			else:
				$AnimationPlayer.play("Idle")
		#Jeżeli postać z czymś koliduje ustawia tarcie na 1000 blokując ruch
		if len(get_colliding_bodies()) > 0:
			self.physics_material_override.friction = 1000 
			
	#Ustawia wyższy skok gdy używany jest modifkator skoku (jump_boost)		
	if global.jump_boost:
		jump_high = 65000
	else:
		jump_high = 25000
		
	#"Kopie" postać o wektor vel pomnożony przez 800 (sila biegu) i deltę (zmienna silnika pozwalająca oszacować czas mieðży klatkami)
	#To samo dla vel.y tylko pomnożone przez wysokośc skoku
	apply_impulse(Vector2.ZERO, Vector2(vel.x * delta * 800 , vel.y *delta*jump_high))

