extends Node

var life : int
var nivel : int


@export var audioMenu : AudioStreamPlayer
@export var audioGame : AudioStreamPlayer
@export var audioMuerte : AudioStreamPlayer

func playMenu():
	audioMenu.play()

func playGame():
	audioGame.play()
	
func playMuerte():
	audioMuerte.play()
	
func stopMenu():
	audioMenu.play()

func stopGame():
	audioGame.stop()
	
func stopMuerte():
	audioMuerte.stop()
