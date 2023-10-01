extends Node2D

var grid = []

func _ready():
	create_grid()
	fill_grid()


func create_grid():
	# creates empty grid
	for i in range(9):
		var row = []
		for j in range(9):
			row.append(0)
		grid.append(row)
	


func fill_grid():
	var nums = [1,2,3,4,5,6,7,8,9]
	for row in range(0,9): 
		var restart = true
		while restart==true:
			grid[row]=[0,0,0,0,0,0,0,0,0]
			nums.shuffle()    
			for col in range (0,9):
	#			var row = int(i/9)    # get the indez (cool way)
	#			var col = i%9
				if grid[row][col]==0:    # checks that cell is empty
					for n in nums:
						if n not in grid[row]:     # check that n is not in row or col
							if n != grid[0][col] and n != grid[1][col] and n != grid[3][col] and n != grid[4][col] and n != grid[5][col] and n != grid[6][col] and n != grid[7][col] and n != grid[8][col]:
#								var square=[]       # identifying which square we are on
#								if row<3:
#									if col<3:
#										square=[grid[0].slice(0,3),grid[1].slice(0,3),grid[2].slice(0,3)]
#									elif col<6:
#										square=[grid[0].slice(3,6),grid[1].slice(3,6),grid[2].slice(3,6)]
#									else:
#										square=[grid[0].slice(6,9),grid[1].slice(6,9),grid[2].slice(6,9)]
#								elif row<6:
#									if col<3:
#										square=[grid[3].slice(0,3),grid[4].slice(0,3),grid[5].slice(0,3)]
#									elif col<6:
#										square=[grid[3].slice(3,6),grid[4].slice(3,6),grid[5].slice(3,6)]
#									else:
#										square=[grid[3].slice(6,9),grid[4].slice(6,9),grid[5].slice(6,9)]
#								else:
#									if col<3:
#										square=[grid[6].slice(0,3),grid[7].slice(0,3),grid[8].slice(0,3)]
#									elif col<6:
#										square=[grid[6].slice(3,6),grid[7].slice(3,6),grid[8].slice(3,6)]
#									else:
#										square=[grid[6].slice(6,9),grid[7].slice(6,9),grid[8].slice(6,9)]
#								if n not in square[0] and n not in square[1] and n not in square[2]:
								grid[row][col] = n
								break
			
			if 0 in grid[row]:
				restart=true
				print('restart')
			else:
				restart=false
	
	print_grid()




func set_square(square):
	match square:
		1:
			square=[grid[0].slice(0,3),grid[1].slice(0,3),grid[2].slice(0,3)]
		2:
			square=[grid[0].slice(3,6),grid[1].slice(3,6),grid[2].slice(3,6)]
		3:
			square=[grid[0].slice(6,9),grid[1].slice(6,9),grid[2].slice(6,9)]
		4:
			square=[grid[3].slice(0,3),grid[4].slice(0,3),grid[5].slice(0,3)]
		5:
			square=[grid[3].slice(3,6),grid[4].slice(3,6),grid[5].slice(3,6)]
		6:
			square=[grid[3].slice(6,9),grid[4].slice(6,9),grid[5].slice(6,9)]
		7:
			square=[grid[6].slice(0,3),grid[7].slice(0,3),grid[8].slice(0,3)]
		8:
			square=[grid[6].slice(3,6),grid[7].slice(3,6),grid[8].slice(3,6)]
		7:
			square=[grid[6].slice(6,9),grid[7].slice(6,9),grid[8].slice(6,9)]


func print_grid():
	for i in grid.size():
		print(grid[i])
