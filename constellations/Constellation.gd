# tool
extends Node2D
class_name Constellation


signal constellation_finished

onready var axis = $Axis
onready var audio_player = $AudioStreamPlayer2D

var controllable = true

var dragging = false
var spinning = false
var click_offset = Vector2.ZERO
var angle_offset = 0


func _on_input_event(viewport, event, shape_idx):
    if controllable:
        if event is InputEventMouseButton:
            click_offset = get_local_mouse_position()

            if event.doubleclick and event.button_index == BUTTON_LEFT:
                mirror()
            elif event.pressed:
                match event.button_index:
                    BUTTON_LEFT:
                        dragging = true
                    BUTTON_RIGHT:
                        angle_offset = axis.get_angle_to(get_global_mouse_position())
                        spinning = not(spinning)
            else:
                dragging = false


func _physics_process(delta):
    if dragging:
        position = get_global_mouse_position() - click_offset

    if spinning:
        pass
        axis.rotation = get_angle_to(get_global_mouse_position()) - angle_offset

        if Input.is_action_just_released("right_click"):
            spinning = false


func mirror():
    axis.scale.x *= -1


func get_star_positions():
    var star_positions = []
    for star in $Axis/StarMarkers.get_children():
        star_positions.append(star.position)
    return star_positions


func _on_correctly_positioned(star_group):
    audio_player.play(0)
    disable_player_control()
    align_with_stargroup(star_group)


func disable_player_control():
    controllable = false


func align_with_stargroup(star_group):
    var tween = Tween.new()
    add_child(tween)
    tween.interpolate_property(self, "position", null, star_group.position, 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
    var delta_angle = fmod(star_group.rotation - axis.rotation, PI)
    tween.interpolate_property(axis, "rotation", null, axis.rotation + delta_angle, 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
    tween.connect("tween_all_completed", self, "_on_aligned")
    tween.start()


func _on_aligned():
    $AnimationPlayer.play("silhouette_to_skeleton")


func fade_in():
    $AnimationPlayer.play("silhouette_fade_in")


func zero_alpha():
    $Axis/Silhouette.self_modulate.a = 0
    $Axis/Skeleton.self_modulate.a = 0
    $Axis/Art.self_modulate.a = 0
