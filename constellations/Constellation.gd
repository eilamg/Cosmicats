tool
extends Node2D


var grabbed = false
var grab_offset = Vector2.ZERO
# var right_clicked = false

enum {STARS=1, SILHOUETTE=2, SKELETON=4, ART=8}
export(int, FLAGS, "Stars", "Silhouette", "Skeleton", "Art") var visibility_flags = ART setget set_visibility_flags


func set_visibility_flags(value):
    visibility_flags = value
    $Stars.visible = visibility_flags & STARS
    $Silhouette.visible = visibility_flags & SILHOUETTE
    $Skeleton.visible = visibility_flags & SKELETON
    $Art.visible = visibility_flags & ART


func _on_input_event(viewport, event, shape_idx):
    if not Engine.editor_hint:
        if event is InputEventMouseButton:
            if event.button_index == BUTTON_LEFT:
                grabbed = event.pressed
                grab_offset = get_local_mouse_position()
            # elif event.button_index == BUTTON_RIGHT:
            #     if event.pressed:
            #         right_clicked = true
            #     else:
            #         right_clicked = false


func _physics_process(delta):
    if not Engine.editor_hint:
        if grabbed:
            position = get_global_mouse_position() - grab_offset
