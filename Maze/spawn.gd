extends Node2D

var spawnOrder = []
var ghost := preload("res://Ghost/ghost.tscn") as PackedScene 
var darkWizard:= preload("res://DarkWizard/darkwizard.tscn") as PackedScene 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	loadSpawnText()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func Spawn(block,currentGen):
	print("spawning")
	var spawnPoints = block.get_node("SpawnPoints")
	print(spawnPoints.testAsd)
	var index=0
	for spawnNode in spawnPoints.upNodes:
		var newSpawn = GetSpawn(currentGen,0,index)
		var newThing = newSpawn.instantiate()
		add_child(newThing)
		newThing.position.x = block.position.x + spawnNode.position.x
		newThing.position.y = spawnNode.position.y
		index+=1
	index = 0
	for spawnNode in spawnPoints.middleNodes:
		var newSpawn = GetSpawn(currentGen,1,index)
		var newThing = newSpawn.instantiate()
		add_child(newThing)
		newThing.position.x = block.position.x + spawnNode.position.x
		newThing.position.y = spawnNode.position.y
		index+=1
	index = 0
	for spawnNode in spawnPoints.downNodes:
		var newSpawn = GetSpawn(currentGen,2,index)
		var newThing = newSpawn.instantiate()
		add_child(newThing)
		newThing.position.x = block.position.x + spawnNode.position.x
		newThing.position.y = spawnNode.position.y
		index+=1
		
func GetSpawn(gen,pos,num):
	var spawnThing
	var spawnText = spawnOrder[(gen*3)+pos][num]
	if(spawnText == "G"):
		spawnThing = ghost
	elif(spawnText == "D"):
		spawnThing = darkWizard
	return spawnThing
	
func loadSpawnText():
	var file = FileAccess.open("res://gen.txt", FileAccess.READ)
	var content = file.get_as_text()
	var index = 0
	while not file.eof_reached(): # iterate through all lines until the end of file is reached
		var line = file.get_line()
		spawnOrder.append(line)
	file.close()
	print(spawnOrder)
	return content
	
