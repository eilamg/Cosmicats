extends Node

onready var tween = $Tween
onready var layers = [$Loop1, $Loop2, $Loop3, $Loop4, $Loop5, $Loop6]
var current_layer = 0


func add_layer():
    if current_layer >= len(layers):
        return

    var layer = layers[current_layer]

    tween.interpolate_property(layer, "volume_db",
        null, 0, 2, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
    tween.start()
    current_layer += 1


func _on_constellation_positioned(constellation):
    add_layer()
