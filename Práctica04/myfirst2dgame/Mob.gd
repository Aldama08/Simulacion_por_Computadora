extends RigidBody2D

func _ready():
	# Duplica el SpriteFrames para que cada Mob tenga su propia copia
	$AnimatedSprite2D.sprite_frames = $AnimatedSprite2D.sprite_frames.duplicate()
	
	# Elige una animación aleatoria
	var mob_types = $AnimatedSprite2D.sprite_frames.get_animation_names()
	$AnimatedSprite2D.animation = mob_types[randi() % mob_types.size()]
	
	sleeping = false  # Asegura que el mob no se "duerma"

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
