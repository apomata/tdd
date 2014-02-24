require_relative 'Point'

class Rectangle
	attr_accessor :c1, :c2
	def initialize(x, y)
		if (x.class == Point)
			@c1 = x
		else
			raise ArgumentError 
		end
		if (x.class == Point)
			@c2 = y
		else
			raise ArgumentError 
		end
	end

	def area
		return ((@c1.x - @c2.x)*(@c1.y - @c2.y)).abs
	end
	

	
end