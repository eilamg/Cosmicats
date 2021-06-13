extends Node2D


var Star = preload("res://star/Star.tscn")


var ordered_constellations = ['Fish', 'Mermaid', 'Catfish', 'Milky way', 'Octopus', 'Jellyfish', 'Squid', 'Shark', 'Ship']
var current_stage = -1


func _ready():
    randomize()
    $Parallax/Cats/Dialogue.connect("request_next_constellations", self, "_on_constellations_requested")
    spawn_star_groups()
    # spawn_random_stars(100)


func _on_constellations_requested():
    current_stage += 1
    var c = ordered_constellations[current_stage]

    var constellation = get_node("Constellations/" + c)
    constellation.position = $Parallax/Cats/constellation_spawn_0.global_position  # TODO
    constellation.fade_in()


func spawn_star_groups():
    for constellation in $Constellations.get_children():
        var star_group = StarGroup.new(constellation, Vector2(200 + randf() * 3440, 200 + randf() * 400), randf() * PI, randf() > 0.5)
        star_group.name = constellation.name
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
