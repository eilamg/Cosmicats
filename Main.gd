extends Node2D


var Star = preload("res://star/Star.tscn")


var stages = [['Fish'], ['Octopus']]


func _ready():
    randomize()
    spawn_star_groups()
    fade_in_constellations()
    spawn_random_stars(100)


func fade_in_constellations():
    $Constellations/Fish/AnimationPlayer.play("silhouette_fade_in")
    $Constellations/Octopus/AnimationPlayer.play("silhouette_fade_in")


func spawn_star_groups():
    var star_group = StarGroup.new($Constellations/Fish, Vector2(200 + randf() * 3440, 200 + randf() * 400), randf() * PI, randf() > 0.5)
    star_group.name = 'Fish'
    $Parallax/Sky/Stars.add_child(star_group)

    star_group = StarGroup.new($Constellations/Octopus, Vector2(200 + randf() * 3440, 200 + randf() * 400), randf() * PI, randf() > 0.5)
    star_group.name = 'Octopus'
    $Parallax/Sky/Stars.add_child(star_group)


func spawn_random_stars(n):
    for i in range(n):
        var s = Star.instance()
        s.position = Vector2(randf() * 3840, 100 + randf() * 1080)
        s.name = 'Star'
        $Parallax/Sky/Stars.add_child(s)


func _input(event):
    if event.is_action_pressed("toggle_fullscreen"):
        OS.window_fullscreen = not(OS.window_fullscreen)
