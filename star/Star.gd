tool
extends Node2D


export(int, 0, 1) var type setget set_type

var _is_ready = false


func set_type(value):
    type = value

    if _is_ready:
        $Sprite.frame = type
        $Highlight.frame = type


func _ready():
    _is_ready = true
    set_type(randi() % 2)


func _enter_tree():
    if not(Engine.editor_hint):
        var parent = get_parent()
        rotation = -parent.global_rotation * parent.scale.x
