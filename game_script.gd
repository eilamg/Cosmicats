extends HBoxContainer


onready var alfred = $MarginContainer1/cat1
onready var xena = $MarginContainer2/cat2
var current_line_number = -1


signal request_next_constellations


class DialogueLine:
    var speaker
    var text
    var auto_advance

    func _init(speaker_, text_, auto_advance_=false):
        speaker = speaker_
        text = text_
        auto_advance = auto_advance_


class SignalEmitter:
    var signal_name
    var auto_advance

    func _init(signal_name_, auto_advance_=false):
        signal_name = signal_name_
        auto_advance = auto_advance_


class WaitHere:
    const auto_advance = false


onready var game_script = [
    # Opening - After the power goes up.
    # Fish
        DialogueLine.new(alfred, "Woah..."),
        DialogueLine.new(xena, "Hmm?"),
        DialogueLine.new(alfred, "Look up!"),
        DialogueLine.new(xena, "Look up a- WOAH! When did all of that get up there?!"),
        DialogueLine.new(alfred, "It just appeared as soon as all the lights went off..."),
        DialogueLine.new(xena, "They're all... twinkly. Like... fish scales."),
        DialogueLine.new(alfred, "Hey you're right... is that the ocean they always talk about?"),
        DialogueLine.new(xena, "Hmm... I'm not sure... I don't see any- oh! Right there!"),
        DialogueLine.new(alfred, "What? What's where?"),
        DialogueLine.new(xena, "It's a fish! Right there!"),
        DialogueLine.new(alfred, "Uh... I don't..."),
        DialogueLine.new(xena, "No, you're looking at it wrong! It's like this, see?", true),
    SignalEmitter.new("request_next_constellations"),  # fish appears here
    WaitHere.new(),  # wait for fish to be placed correctly
        DialogueLine.new(alfred, "Oh hey yeah! You're right!"),
        DialogueLine.new(xena, "Told ya."),
        DialogueLine.new(alfred, "Are there any more up there?"),
    # Mermaid
        DialogueLine.new(alfred, "Look, it's one of those... what do the humans call them... mermaids?", true),
        DialogueLine.new(xena, "A what?"),
        DialogueLine.new(alfred, "You know, that thing where it's like half human, half fish."),
        DialogueLine.new(xena, "...so, a fish that walks around on-"),
        DialogueLine.new(alfred, "No! Wrong halves! See, it's like that!"),
    SignalEmitter.new("request_next_constellations"),  # mermaid appears here
    WaitHere.new(),  # wait for mermaid to be placed correctly
    # Cat Fish:
        DialogueLine.new(alfred, "Hmm... something is missing..."),
        DialogueLine.new(xena, "How do you mean?"),
        DialogueLine.new(alfred, "Don't they seem lonely up there by themselves? Like they need a friend or maybe-"),
        DialogueLine.new(xena, "A CATFISH!"),
        DialogueLine.new(alfred, "...is that even a thing?"),
        DialogueLine.new(xena, "Absolutely! See? Right there!"),
    SignalEmitter.new("request_next_constellations"),  # catfish appears here
    WaitHere.new(),  # wait for catfish to be placed correctly
        DialogueLine.new(alfred, "Are you sure about that?"),
        DialogueLine.new(xena, "Of course they would have cat fish. Can you imagine if humans didn't have us?"),
        DialogueLine.new(alfred, "True, they wouldn't know what to do with themselves."),
    # School of Fish (Milky Way):
        DialogueLine.new(xena, "Look, there's even more of them over there!"),
    SignalEmitter.new("request_next_constellations"),  # school of fish appears here
    WaitHere.new(),  # wait for school of fish to be placed correctly
        DialogueLine.new(alfred, "Wow, it's like... an entire ocean kingdom in the sky!"),
        DialogueLine.new(xena, "Are they all fish though? Some of them look kinda... weird."),
        DialogueLine.new(alfred, "Look at that one! There's like... a zillion fish all swimming together."),
        DialogueLine.new(xena, "Wow... how many is a zillion?"),
        DialogueLine.new(alfred, "Umm... a lot?"),
    # Octopus:
        DialogueLine.new(xena, "Look at that one, it's got like... eight tails!"),
    SignalEmitter.new("request_next_constellations"),  # octopus appears here
    WaitHere.new(),  # wait for octopus to be placed correctly
        DialogueLine.new(alfred, "I... don't think those are tails."),
        DialogueLine.new(xena, "Well, what else would they be?"),
        DialogueLine.new(alfred, "They're like... nooodly legs. With suction thingies on the bottom. And a head."),
        DialogueLine.new(xena, "Pfft. And you think eight tails sounds rediculous."),
    # Jellyfish:
        DialogueLine.new(alfred, "Hey, you know what that one looks like?"),
        DialogueLine.new(xena, "...like that really ugly lamp your owner has? With all the shiny rocks hanging from it."),
    SignalEmitter.new("request_next_constellations"),  # jellyfish appears here
    WaitHere.new(),  # wait for jellyfish to be placed correctly
        DialogueLine.new(alfred, "What? No, it... well, kinda. But not that."),
        DialogueLine.new(alfred, "It looks like that gel blob stuff that humans make with those fruit chunks in it."),
        DialogueLine.new(xena, "Oh yeah... what do you think it tastes like?"),
        DialogueLine.new(alfred, "Uh... fish?"),
    # Squid:
        DialogueLine.new(xena, "Oh, it's another one of those eight noodle head guys."),
        DialogueLine.new(alfred, "Mmm... no, this one is different. See? It only has six of them."),
        DialogueLine.new(xena, "Oh no! What happened to the other two?"),
        DialogueLine.new(alfred, "N-no... I mean... it's something different. Look, at the top of it's head. It has fins like a fish."),
        DialogueLine.new(xena, "So... a six tailed noodle head fish?"),
        DialogueLine.new(alfred, "[sigh] Nevermind..."),
    # Shark:
        DialogueLine.new(alfred, "W-woah, that one looks... kind scary..."),
        DialogueLine.new(xena, "What, scared of the big bad fish?"),
        DialogueLine.new(alfred, "No way that's just a fish! Just look at how big they are! They'd probably eat you!"),
        DialogueLine.new(xena, "Not if I eat them first."),
    # Ship:
        DialogueLine.new(xena, "Well now... what do we have here?"),
        DialogueLine.new(alfred, "A ship?"),
        DialogueLine.new(xena, "A /sunken/ ship. You know what that means."),
    SignalEmitter.new("request_next_constellations"),  # ship appears here
    WaitHere.new(),  # wait for ship to be placed correctly
        DialogueLine.new(alfred, "Uh..."),
        DialogueLine.new(xena, "That's right, treasure!"),
        DialogueLine.new(alfred, "Come again?"),
        DialogueLine.new(xena, "Sunken ships always have treasure in them! Like the ones you see in the fish tank... but this treasure must be MASSIVE!"),
        DialogueLine.new(alfred, "Well, doesn't look like they made it... I wonder..."),
        DialogueLine.new(xena, "Hmm?"),
        DialogueLine.new(alfred, "Maybe it was the mermaid's treasure and she and her trusty catfish companion were trying to get it back!"),
        DialogueLine.new(xena, "Oh yeah! That would make a lot of sense... but that's a lot of obsticales in their way."),
        DialogueLine.new(alfred, "No kidding... and they're probably already so far from home... I mean, look at how BIG this ocean is!"),
    # [some kind of zooming out showing the sky on the whole if possible?]
        DialogueLine.new(xena, "Wow... there's so many of them... how do you think they'll even get home?"),
        DialogueLine.new(alfred, "I mean... WHERE even is their home?"),
        DialogueLine.new(xena, "Well, once they get to the sunken ship, they'll probably have to swimp past th-"),
    # [power comes back on. The stars fade from visiblity. Back to city light]
        DialogueLine.new(xena, "What?! No fair! We were just getting started!"),
        DialogueLine.new(alfred, "Hmm... well, hey maybe next time it'll be a different story?"),
        DialogueLine.new(xena, "Huh... you think so?"),
        DialogueLine.new(alfred, "Well yeah, they just don't want everyone seeing them setting up for next time."),
        DialogueLine.new(xena, "I guess so... well, should we meet here next time the lights go out?"),
        DialogueLine.new(alfred, "Absolutely! I wanna see what happens next too ya know."),
]


# func _input(event):
#      if event.is_action_pressed("ui_down"):
#          advance_script()


func advance_script():
    current_line_number += 1
    # print(current_line_number)

    if current_line_number >= len(game_script):
        return

    var line = game_script[current_line_number]

    if line is WaitHere:
        # print('wait here')
        current_line_number -= 1
        return
    elif line is DialogueLine:
        # print('dialogue')
        line.speaker.text = line.text
        auto_advance_after_n_seconds(len(line.text) / 10.0)  # auto-advance text according to line length
    elif line is SignalEmitter:
        # print('signal_emitter')
        emit_signal(line.signal_name)

    if line.auto_advance:
        advance_script()


func _on_constellation_finished():
    current_line_number += 1  # force advance past "WaitHere"
    advance_script()


func auto_advance_after_n_seconds(n):
    yield(get_tree().create_timer(n), "timeout")
    advance_script()
