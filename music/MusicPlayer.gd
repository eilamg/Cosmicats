extends Node

onready var tween = $Tween


# loop1   loop2       null       loop3         null         loop4        loop5    null     loop6
#     'Fish', 'Mermaid', 'Catfish', 'SchoolOfFish', 'Octopus', 'Jellyfish', 'Squid', 'Shark', 'Ship'
onready var layers = [$Loop1, $Loop2, null, $Loop3, null, $Loop4, $Loop5, null, $Loop6]
var current_layer = 0


func add_layer():
    if current_layer >= len(layers):
        return

    var layer = layers[current_layer]

    if layer != null:
        tween.interpolate_property(layer, "volume_db",
            null, 0, 2, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
        tween.start()
    current_layer += 1


func _on_constellation_positioned(constellation):
    add_layer()
