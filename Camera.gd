extends Camera2D


export var camera_speed = 20

const X_MIN = 0
const X_MAX = 1920

var velocity = 0


func _process(delta):
    position.x = clamp(position.x + velocity, X_MIN, X_MAX)


func _on_LeftMargin_mouse_entered():
    velocity = -camera_speed


func _on_LeftMargin_mouse_exited():
    velocity = 0


func _on_RightMargin_mouse_entered():
    velocity = camera_speed


func _on_RightMargin_mouse_exited():
    velocity = 0
