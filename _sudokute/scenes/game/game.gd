extends Control

var rng = RandomNumberGenerator.new()

var grid = []
var nums = [1,2,3,4,5,6,7,8,9]
var diff = 40  # amount of numbers to delete , from 1 to 81



func _ready():
	create_grid()
	fill_grid(grid)
	delete_numbers(diff)
	
	print_grid(grid)
	
	set_numbers()


# creates empty grid
func create_grid():
	# creates empty grid
	for i in range(9):
		var row = []
		for j in range(9):
			row.append(0)
		grid.append(row)


#fills up the grid with numbers
func fill_grid(grd):
	
	for row in range(0,9): 
		var restart = true
		var retries = 0
		var retries_max = 20
		while restart==true and retries<retries_max:
			grd[row]=[0,0,0,0,0,0,0,0,0]
			nums.shuffle()    
			for col in range (0,9):
				if grd[row][col]==0:    # checks that cell is empty
					for n in nums:
						if n not in grd[row]:     # check that n is not in row or col
							var column = [grd[0][col],grd[1][col],grd[2][col],grd[3][col],grd[4][col],grd[5][col],grd[6][col],grd[7][col],grd[8][col]]
							if n not in column:
								var square=[]       # identifying which square we are on
								if row<3:
									if col<3:
										square=[grd[0].slice(0,3),grd[1].slice(0,3),grd[2].slice(0,3)]
									elif col<6:
										square=[grd[0].slice(3,6),grd[1].slice(3,6),grd[2].slice(3,6)]
									else:
										square=[grd[0].slice(6,9),grd[1].slice(6,9),grd[2].slice(6,9)]
								elif row<6:
									if col<3:
										square=[grd[3].slice(0,3),grd[4].slice(0,3),grd[5].slice(0,3)]
									elif col<6:
										square=[grd[3].slice(3,6),grd[4].slice(3,6),grd[5].slice(3,6)]
									else:
										square=[grd[3].slice(6,9),grd[4].slice(6,9),grd[5].slice(6,9)]
								else:
									if col<3:
										square=[grd[6].slice(0,3),grd[7].slice(0,3),grd[8].slice(0,3)]
									elif col<6:
										square=[grd[6].slice(3,6),grd[7].slice(3,6),grd[8].slice(3,6)]
									else:
										square=[grd[6].slice(6,9),grd[7].slice(6,9),grd[8].slice(6,9)]
								if n not in square[0] and n not in square[1] and n not in square[2]:
									grd[row][col] = n
									break
			
			if 0 in grd[row]:
				restart=true
				retries = retries+1
#				print('retring filllin row')
			else:
				restart=false
		
#		print("retries:")
#		print(retries)
		
		if retries==retries_max:
#			print("to many retries, restarting generation")
			get_tree().reload_current_scene()


# checks if there is a mistake in the grid
func check_grid():
	var error = false
	for i in range (0,81):
		var row = int(i/9)
		var col = i%9
		
#		if grid[row][col]==0:
#			print('found a 0')
#			error = true
		
		for c in range (0,9):
			if grid[row][col] == grid[row][c] and c!=col and grid[row][col]!=0:
				print("there's two of the same num in the rom")
				print(row)
				error = true
			
			if grid[row][col] == grid[c][col] and c!=row and grid[row][col]!=0:
				print("there's two of the same in the col")
				print(col)
				error = true

	
	print('done')


# prints the full grid in console
func print_grid(grid):
	print("final grid")
	for i in grid.size():
		print(grid[i])


# deletes numbers in grid
# !! ADD UNIQUE SOLUTION DETECTION
func delete_numbers(diff):
	# all fucking indexes (i hate myself this is so ugly)
	var index = ['00','01','02','03','04','05','06','07','08','10','11','12','13','14','15','16','17','18','20','21','22','23','24','25','26','27','28','30','31','32','33','34','35','36','37','38','40','41','42','43','44','45','46','47','48','50','51','52','53','54','55','56','57','58','60','61','62','63','64','65','66','67','68','70','71','72','73','74','75','76','77','78','80','81','82','83','84','85','86','87','88']
	
	# randomize the indexes
	index.shuffle()  
	var solution_counter = 0
	
	# deletes the amount of numbers
	for k in diff:
		var s = index[k]
		var i = int(s[0])
		var j = int(s[1])
		
		# set that bitch
		grid[i][j]=0


# sets numbers in visual grid
func set_numbers():
	for i in range(0,81):
		var row = int(i/9)
		var col = i%9
		
		var str_index = str(row)+str(col)
		
		var grid_container = $HBoxContainer/VBoxContainer/GridContainer
		
		if grid[row][col]!=0:
			for square in grid_container.get_children():
				for button in square.get_children():
					if button.name == str_index:
						grid_container.get_node(square.get_path()).get_node(str_index).update_number(grid[row][col])
		
