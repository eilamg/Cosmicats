extends Node2D


func _ready():
    randomize()
    var star_group = StarGroup.new($Constellations/Fish, Vector2(100 + randf() * 900, 100 + randf() * 500), randf() * PI, randf() > 0.5)
    star_group.name = 'Fish'
    $Stars.add_child(star_group)
