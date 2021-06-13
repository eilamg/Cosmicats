extends Node2D


var Star = preload("res://star/Star.tscn")

onready var constellations = $Constellations

var ordered_constellations = ['Fish', 'Mermaid', 'Catfish', 'SchoolOfFish', 'Octopus', 'Jellyfish', 'Squid', 'Shark', 'Ship']
var current_stage = -1


func _ready():
    randomize()
    $ParallaxFG/Cats/Dialogue.connect("request_next_constellations", self, "_on_constellations_requested")
    spawn_star_groups()
    hide_away_constellations()
    $MusicPlayer.add_layer()

    $AnimationPlayer.play("intro")

    $ParallaxFG/Cats/Dialogue.connect("request_instructions", self, "_on_instructions_requested")

    # spawn_random_stars(100)


func _on_instructions_requested():
    $AnimationPlayer.play("display_instructions")


func hide_away_constellations():
    for constellation in constellations.get_children():
        constellation.position = Vector2(-500, -500)
        constellation.zero_alpha()


func _on_constellations_requested():
    current_stage += 1
    var c = ordered_constellations[current_stage]

    var constellation = get_node("Constellations/" + c)
    constellation.global_position = $Camera.position + Vector2(1920, 1080) / 2 + Vector2(0, 100);
    if randf() > 0.5:
        constellation.mirror()
    constellation.axis.rotation = randf() * 2 * PI

    constellation.connect("constellation_finished", $ParallaxFG/Cats/Dialogue, "_on_constellation_finished")
    constellation.fade_in()


func spawn_star_groups():
    for constellation in constellations.get_children():
        var star_group = StarGroup.new(constellation, constellation.position, constellation.axis.rotation, constellation.axis.scale.x == -1)
        star_group.name = constellation.name
        $ParallaxBG/Sky/Stars.add_child(star_group)
        star_group.connect("correctly_positioned", $MusicPlayer, "_on_constellation_positioned")


func spawn_random_stars(n):
    for i in range(n):
        var s = Star.instance()
        s.position = Vector2(randf() * 3840, 100 + randf() * 1080)
        s.name = 'Star'
        $ParallaxBG/Sky/Stars.add_child(s)


func _input(event):
    if event.is_action_pressed("toggle_fullscreen"):
        OS.window_fullscreen = not(OS.window_fullscreen)
