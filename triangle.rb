require_relative 'Rectangle'
require 'pry'
class Triangle
		attr_accessor :c1, :c2, :c3
	def initialize(x, y, z)
		if (x.class == Point && y.class == Point && z.class == Point)
			@c1 = x
			@c2 = y
			@c3 = z
		else
			raise ArgumentError
		end
	end

	def area
		#area of outside triangles 
		#(the triangels made by the sides of the given triangle and the containgin rerctangle)
		r1 = Rectangle.new(@c1, @c2).area/2
		r2 = Rectangle.new(@c1, @c3).area/2
		r3 = Rectangle.new(@c2, @c3).area/2
		
		#fet mins and maxes
		xs = [@c1.x, @c2.x, @c3.x]
		ys = [@c1.y, @c2.y, @c3.y]
		#get area of rectangle that would contain tringle
		rt = Rectangle.new(Point.new(xs.min,ys.min), Point.new(xs.max,ys.max)).area
		#gets a rectangle that would cntain whole triangle and the triangles
		
		return rt-r1-r2-r3
	end
end

=begin
@c1 = Point.new(0.0, 0.0)
@c2 = Point.new(0.0, 1.0)
@c3 = Point.new(2.0, 0.0)
@t = Triangle.new(@c1, @c2, @c3)
@t.area
=end