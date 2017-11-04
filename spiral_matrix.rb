# Question number 2

require 'json'

def spiral_matrix(matrix)
	result = []

	actions = { 
		top:    lambda{ matrix.shift },
		right:  lambda{ matrix.map { |f| f.pop } },
		bottom: lambda{ matrix.pop.reverse },
		left:   lambda{ matrix.map { |f| f.shift }.reverse }
	}

	cases = actions.keys.cycle
	result.concat actions[ cases.next ].call() until matrix.empty?
	result
end

puts "Please insert 2D Array: "
matrix = gets
puts "The result is: "
puts spiral_matrix(JSON.parse(matrix)).join(', ')
