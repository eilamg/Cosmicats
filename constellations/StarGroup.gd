extends Node2D
class_name StarGroup


var Star = preload("res://star/Star.tscn")
#var constellation # : Constellation
#
#

var constellation = null


func _init(constellation_, pos=Vector2.ZERO, rot=0, mirrored=false):
    constellation = constellation_
    position = pos
    rotation = rot
    if mirrored:
       scale.x = -1


func _ready():
    spawn_stars(constellation.get_star_positions())


func spawn_stars(star_positions):
    for pos in star_positions:
        var s = Star.instance()
        s.position = pos
        add_child(s)
