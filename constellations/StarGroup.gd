extends Node2D
class_name StarGroup


var Star = preload("res://star/Star.tscn")
var constellation = null


signal correctly_positioned(star_group)


const DISTANCE_THRESHOLD = 100
const ANGLE_THRESHOLD = deg2rad(10)


func _init(constellation_, pos=Vector2.ZERO, rot=0, mirrored=false):
    constellation = constellation_
    connect("correctly_positioned", constellation, "_on_correctly_positioned")
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


func _process(delta):
    if is_close_enough():
        emit_signal("correctly_positioned", self)
        set_process(false)


func is_close_enough():
    var delta_position = (constellation.position - position).length()
    var delta_rotation = abs(fmod(constellation.axis.rotation - rotation, 2*PI))
    var mirrored = not(constellation.axis.scale.x == scale.x)
    var is_dragging = constellation.dragging
    var is_spinning = constellation.spinning

    # prints(delta_position, rad2deg(delta_rotation), mirrored, is_dragging, is_spinning)
    return (delta_position <= DISTANCE_THRESHOLD) and (delta_rotation <= ANGLE_THRESHOLD) and not(mirrored) and not(is_dragging) and not(is_spinning)
