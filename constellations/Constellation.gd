tool
extends Node2D


var _is_ready = false

onready var axis = $Axis
onready var stars = $Axis/Stars
onready var silhouette = $Axis/Silhouette
onready var skeleton = $Axis/Skeleton
onready var art = $Axis/Art

var dragging = false
var spinning = false
var click_offset = Vector2.ZERO
var angle_offset = 0

enum {STARS=1, SILHOUETTE=2, SKELETON=4, ART=8}
export(int, FLAGS, "Stars", "Silhouette", "Skeleton", "Art") var visibility_flags = ART setget set_visibility_flags


func _ready():
    _is_ready = true
    set_visibility_flags(visibility_flags)


func set_visibility_flags(value):
    visibility_flags = value

    if _is_ready:
        stars.visible = visibility_flags & STARS
        silhouette.visible = visibility_flags & SILHOUETTE
        skeleton.visible = visibility_flags & SKELETON
        art.visible = visibility_flags & ART


func _on_input_event(viewport, event, shape_idx):
    if not Engine.editor_hint:
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
                        print(angle_offset)
                        spinning = not(spinning)
            else:
                dragging = false


func _physics_process(delta):
    if not Engine.editor_hint:
        if dragging:
            position = get_global_mouse_position() - click_offset

        if spinning:
            pass
            axis.rotation = get_angle_to(get_global_mouse_position()) - angle_offset

            if Input.is_action_just_released("right_click"):
                spinning = false


func mirror():
    axis.scale.x *= -1
