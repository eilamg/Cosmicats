extends Node2D


var Star = preload("res://star/Star.tscn")


func _ready():
    randomize()
    spawn_star_groups()
    spawn_random_stars()


func spawn_star_groups():
    var star_group = StarGroup.new($Constellations/Fish, Vector2(100 + randf() * 900, 100 + randf() * 500), randf() * PI, randf() > 0.5)
    star_group.name = 'Fish'
    $Stars.add_child(star_group)


func spawn_random_stars():
    for i in range(40):
        var s = Star.instance()
        s.position = Vector2(randf() * 1920, 100 + randf() * 1080)
        s.name = 'Star'
        $Stars.add_child(s)
