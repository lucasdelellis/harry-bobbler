extends Node2D

var spawnOrder = []
var ghost : PackedScene = preload("res://Ghost/ghost.tscn")
var darkWizard : PackedScene = preload("res://DarkWizard/darkwizard.tscn")
var spike_attack : PackedScene = preload("res://Spikes/spike_atack.tscn")

func _ready() -> void:
	loadSpawnText()
	
func Spawn(block,currentGen):
	var spawnPoints = block.get_node("SpawnPoints")
	var index=0
	for spawnNode in spawnPoints.upNodes:
		var newSpawn = GetSpawn(currentGen,0,index)
		if(newSpawn!=null):
			add_child(newSpawn)
			newSpawn.position.x = block.position.x + spawnNode.position.x
			newSpawn.position.y =  block.position.y + spawnNode.position.y
		index+=1
	index = 0
	for spawnNode in spawnPoints.middleNodes:
		var newSpawn = GetSpawn(currentGen,1,index)
		if(newSpawn!=null):
			add_child(newSpawn)
			newSpawn.position.x = block.position.x + spawnNode.position.x
			newSpawn.position.y =  block.position.y +spawnNode.position.y
		index+=1
	index = 0
	for spawnNode in spawnPoints.downNodes:
		var newSpawn = GetSpawn(currentGen,2,index)
		if(newSpawn!=null):
			add_child(newSpawn)
			newSpawn.position.x = block.position.x + spawnNode.position.x
			newSpawn.position.y = block.position.y + spawnNode.position.y
		index+=1
		
func GetSpawn(gen,pos,num):
	var spawnThing
	var spawnText = spawnOrder[(gen*3)+pos][num]
	if(spawnText == "G"):
		spawnThing = ghost.instantiate()
	elif(spawnText == "D"):
		spawnThing = darkWizard.instantiate()
	elif(spawnText == "A"):
		spawnThing = spike_attack.instantiate()
		spawnThing.jugador = get_parent().get_node("Player")
		spawnThing.distancia = 30
	elif(spawnText == "P"):
		spawnThing = spike_attack.instantiate()
		spawnThing.jugador = get_parent().get_node("Player")
		spawnThing.distancia = 30
		spawnThing.spikespeed = 125 
	elif(spawnText == "N"):
		spawnThing = spike_attack.instantiate()
		spawnThing.jugador = get_parent().get_node("Player")
		spawnThing.spikespeed = 0
		
	return spawnThing
	
func loadSpawnText():
	var file = FileAccess.open("res://gen.txt", FileAccess.READ)
	var content = file.get_as_text()
	var index = 0
	while not file.eof_reached(): # iterate through all lines until the end of file is reached
		for i in range(0,3):
			var line = file.get_line()
			spawnOrder.append(line)
		file.get_line()
	file.close()
	print(spawnOrder)
	return content
	



		
